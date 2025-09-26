//
//  TurnoService.swift
//  nova-ios-app-ipad
//
//  Created by Alumno on 24/09/25.
//

import Foundation
import Combine

// MARK: - Modelo
struct Turno: Identifiable, Codable {
    var id: Int
    var hora: String
    var prioridad: Bool
}

// MARK: - Servicio API
class TurnoService: ObservableObject {
    @Published var listaTurno: [Turno] = []
    
    private let getFilaURL = URL(string: "http://10.14.255.42:10205/get_fila")!
    private let updatePrioridadURL = URL(string: "http://10.14.255.42:10205/update_prioridad")!
    
   
    func fetchTurnos() {
        let task = URLSession.shared.dataTask(with: getFilaURL) { data, response, error in
            if let error = error {
                print("Error fetchTurnos:", error)
                return
            }
            guard let data = data else {
                print("No data received")
                return
            }
            do {
                let decoder = JSONDecoder()
                let turnos = try decoder.decode([Turno].self, from: data)
                DispatchQueue.main.async {
                    self.listaTurno = turnos
                }
            } catch {
                print("Error decoding JSON:", error)
            }
        }
        task.resume()
    }
    
    
    func updatePrioridad(id: Int, prioridadNueva: Int) {
        var request = URLRequest(url: updatePrioridadURL)
        request.httpMethod = "PUT"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let body: [String: Any] = [
            "id": id,
            "prioridad": prioridadNueva
        ]
        
        request.httpBody = try? JSONSerialization.data(withJSONObject: body)
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print("Error updatePrioridad:", error)
                return
            }
            if let httpResponse = response as? HTTPURLResponse {
                print(" Status code:", httpResponse.statusCode)
            }
            if let data = data, let str = String(data: data, encoding: .utf8) {
                print("Respuesta:", str)
            }
            self.fetchTurnos()
        }
        task.resume()
    }
    
    // Calcular turno actual basado en la hora
    func turnoActual() -> String {
        let date = Date()
        let calendar = Calendar.current
        let h = calendar.component(.hour, from: date)
        let m = calendar.component(.minute, from: date)
        
        var turnoHour = h
        var turnoMinute = 0
        
        if h >= 9 && h < 21 {
            // Entre 9am y 9pm - turnos cada 30 minutos
            turnoMinute = m < 30 ? 0 : 30
        } else {
            // Entre 9pm y 9am - turnos cada hora
            turnoMinute = 0
        }
        
        let components = DateComponents(hour: turnoHour, minute: turnoMinute)
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm:ss"
        
        if let turnoDate = Calendar.current.date(from: components) {
            return formatter.string(from: turnoDate)
        }
        return ""
    }
    
    func borrarTurno(id: Int) async -> Bool {
            guard let url = URL(string: "http://10.14.255.42:10205/filaPop/\(id)") else {
                print("URL inválida para borrar turno")
                return false
            }
            
            var request = URLRequest(url: url)
            request.httpMethod = "DELETE"
            
            do {
                let (data, response) = try await URLSession.shared.data(for: request)
                
                guard let httpResponse = response as? HTTPURLResponse else {
                    print("Respuesta no válida del servidor")
                    return false
                }
                
                if httpResponse.statusCode == 200 {
                    if let datosAPI = String(data: data, encoding: .utf8) {
                        print("Respuesta del API: \(datosAPI)")
                    }
                    return true
                } else if httpResponse.statusCode == 404 {
                    print("No se encontró el registro con id: \(id)")
                    return false
                } else {
                    print("Código de error del API: \(httpResponse.statusCode)")
                    return false
                }
            } catch {
                print("Error en la llamada: \(error.localizedDescription)")
                return false
            }
        }
        
        // Método combinado para borrar turno actual
        func borrarTurnoActual() async -> (success: Bool, id: Int?) {
            // Si la lista está vacía, cargar primero
            if listaTurno.isEmpty {
                print("Lista vacía, cargando turnos...")
                await fetchTurnos()
                
                // Pequeña espera para asegurar que el estado se actualice
                try? await Task.sleep(nanoseconds: 100_000_000) // 0.1 segundos
            }
            
            let turnoStr = turnoActual()
            let filtrados = listaTurno.filter { $0.hora == turnoStr }
            
            print("Turno actual: \(turnoStr)")
            print("Total turnos en lista: \(listaTurno.count)")
            print("Turnos filtrados: \(filtrados.map { $0.id })")
            
            let turnoABorrar = filtrados.first(where: { $0.prioridad == true }) ?? filtrados.first
            
            guard let id = turnoABorrar?.id else {
                print("No hay turnos disponibles para el horario \(turnoStr)")
                return (false, nil)
            }
            
            print("Borrando turno ID: \(id), prioridad: \(turnoABorrar?.prioridad ?? false)")
            
            // Borrar el turno
            let success = await borrarTurno(id: id)
            
            if success {
                // Actualizar la lista después de borrar
                await fetchTurnos()
            }
            
            return (success, id)
        }
        
        // Actualizar prioridad - convertido a async/await
        
}


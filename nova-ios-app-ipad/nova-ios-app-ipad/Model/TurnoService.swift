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
    
    // Traer turnos desde API
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
    
    // Actualizar prioridad
    func updatePrioridad(id: Int, prioridadNueva: Int) {
        var request = URLRequest(url: updatePrioridadURL)
        request.httpMethod = "PUT" // 👈 Cambiado de POST a PUT
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
                print("📥 Status code:", httpResponse.statusCode)
            }
            if let data = data, let str = String(data: data, encoding: .utf8) {
                print("📥 Respuesta:", str)
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
    
    func filtrarTurnos(horaActual: String) -> [Turno] {
        return listaTurno.filter { $0.hora == horaActual }
    }
}


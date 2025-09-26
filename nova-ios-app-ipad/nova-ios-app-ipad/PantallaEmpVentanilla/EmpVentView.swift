//
//  EmpVentView.swift
//  nova-ios-app-ipad
//
//  Created by Luis Garza on 21/09/25.
//

import SwiftUI

struct EmpVentView: View {
    @State var ventanillaActiva: Bool = true
    @StateObject var turnoService = TurnoService()
    @State var turno: Int = 0
    var body: some View {
        VStack{
            Spacer()
            
            Text("Turno # \(turno)")
                .font(.system(size: 60, weight: .bold))
                .foregroundStyle(Color(red: 255/255, green: 153/255, blue: 0/255))
            
            Spacer()
        }
        Spacer()
        VStack{
            HStack{Spacer()}
            
            Button(action:{
                Task {
                    await turnoService.fetchTurnos()
                    let turnoStr = turnoService.turnoActual()
                    let filtrados = turnoService.listaTurno.filter { $0.hora == turnoStr }
                    print("Turno actual: \(turnoStr)")
                    print("Filtrados: \(filtrados.map { $0.id })")
                    
                    if let id = filtrados.first?.id {
                        llamadaApi(idTurno: id)
                        await turnoService.fetchTurnos() // refresca lista después de borrar
                    } else {
                        print("No hay turnos filtrados disponibles")
                    }
                }
                
            }){Text("Siguiente turno")
                    .frame(maxWidth: .infinity)
                    .padding(20)
                    .multilineTextAlignment(.center)
                    .font(.system(size: 40))
                    .tint(Color(red: 1/255, green: 104/255, blue: 138/255))
                    .fontWeight(.semibold)
            }
                .frame(width: 500, height: 85)
                .padding()
                .background(.white)
                .cornerRadius(24)
                //.padding(.bottom, 32)
            
            Button(action:{
                ventanillaActiva.toggle()
            }){Text(ventanillaActiva ? "Cerrar ventanilla" : "Abrir ventanilla")
                    .frame(maxWidth: .infinity)
                    .padding(20)
                    .multilineTextAlignment(.center)
                    .font(.system(size: 40))
                    .tint(.white)
                    .fontWeight(.semibold)
            }
                .frame(width: 500, height: 85)
                .padding()
                .background(Color(red: 1/255, green: 104/255, blue: 138/255, opacity: 0.0))
                .overlay(
                    RoundedRectangle(cornerRadius: 24)
                        .stroke(.white, lineWidth: 2)
                    
                )
                .padding(.top, 32)
        }
        .frame(height: 450)
        .background(
            LinearGradient(gradient: Gradient(colors: [Color(red: 1/255, green: 104/255, blue: 138/255), Color(red: 0/255, green: 66/255, blue: 88/255)]), startPoint: .topLeading, endPoint: .bottomTrailing)
            )
    }
    
    func llamadaApi(idTurno: Int){
        guard let url = URL(string:"http://10.14.255.42:10205/filaPop/\(idTurno)") else{
                    return
                }
        
                var request = URLRequest(url: url)
                request.httpMethod = "DELETE"
                
                let task = URLSession.shared.dataTask(with: request){
                    data, response, error in
                    
                    if error != nil {
                        print("Error en la llamada: \(error!.localizedDescription)")
                        return
                    }
                    
                    guard let httpResponse = response as? HTTPURLResponse else {
                        print("Respuesta no válida del servidor")
                        return
                    }
                    
                    if (httpResponse.statusCode != 200){
                        print("Código de error del API: \(httpResponse.statusCode)")
                        return
                    }
                    
                    if (data != nil){
                        if let datosAPI = String(data: data!, encoding: .utf8){
                            print("Respuesta del API: \(datosAPI)")
                        }
                    }else{
                        print("No se recibieron datos")
                    }
                }
                task.resume()
                return
    }
    
    func cerrarVentanilla(identU: String){
        
    }
    
}

#Preview {
    EmpVentView()
}

//
//  ListaTurnoView.swift
//  nova-ios-app-ipad
//
//  Created by Alumno on 23/09/25.
//.background(
//LinearGradient(gradient: Gradient(colors: [Color(red: 1/255, green: 104/255, blue: 138/255), Color(red: 0/255, green: 66/255, blue: 88/255)]), startPoint: .topLeading, endPoint: .bottomTrailing)
//)
import SwiftUI

struct ListaTurnoView: View {
    @StateObject var turnoService = TurnoService()
    @State private var turnoSeleccionado: Turno?
    @State private var mostrarAlert = false
    @State private var turnoStr: String = ""
    var body: some View {
        VStack(spacing: 20) {
            let turnoStr = turnoService.turnoActual()
            let turnosFiltrados = turnoService.listaTurno.filter { $0.hora == turnoStr } // $0 representa el turno actual

            
            let turnosConPrioridad = turnoService.listaTurno.filter { $0.prioridad }
            RoundedRectangle(cornerRadius: 25)  
                .fill(turnosConPrioridad.isEmpty ? Color.gray : Color(red: 255/255, green: 153/255, blue: 0/255).opacity(0.8))
                .frame(height: 80)
                .overlay(
                    Text(
                        turnosConPrioridad.isEmpty
                        ? "Sin prioridad"
                        : "Prioridad Turno: \(turnosConPrioridad.map { "\($0.id)" }.joined(separator: ", "))"
                    )
                    .foregroundColor(.black)
                    .font(.system(size: 28, weight: .bold))
                    .minimumScaleFactor(0.5)
                    .lineLimit(1)
                )
                .padding(.horizontal, 110)
                

            HStack {
                Spacer()
                List {
                    ForEach(turnoService.listaTurno.indices, id: \.self) { index in
                        let turno = turnoService.listaTurno[index]
                        
                        if turno.hora == turnoService.turnoActual() {
                            TurnoRow(turno: $turnoService.listaTurno[index])
                                .listRowBackground(Color.clear)
                                .onTapGesture {
                                    turnoSeleccionado = turno
                                    mostrarAlert = true
                                }
                        }
                    }
                }
                .listStyle(.inset)
                .frame(width: 600, height: 750)
                .scrollContentBackground(.hidden)
                .cornerRadius(20)
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(
                            LinearGradient(
                                gradient: Gradient(colors: [
                                    Color(red: 1/255, green: 104/255, blue: 138/255),
                                    Color(red: 0/255, green: 66/255, blue: 88/255)
                                ]),
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            ),
                            lineWidth: 3
                        )
                        
                )
                
                
                
                Spacer()
            }
        }
        .alert("Dar prioridad a este turno?", isPresented: $mostrarAlert, actions: {
            Button("Sí") {
                if let turno = turnoSeleccionado {
                    turnoService.updatePrioridad(id: turno.id, prioridadNueva: 1)
                }
            }
            Button("Cancelar", role: .cancel) {}
        }, message: {
            if let turno = turnoSeleccionado {
                Text("Turno \(turno.id)")
            }
        })
        .onAppear {
            turnoService.fetchTurnos()
        }
        .onReceive(Timer.publish(every: 5, on: .main, in: .common).autoconnect()) { _ in
            // Se ejecuta cada 5 segundos (cambia el intervalo si quieres)
            turnoService.fetchTurnos()
        }
    }
}


#Preview {
    ListaTurnoView()
}

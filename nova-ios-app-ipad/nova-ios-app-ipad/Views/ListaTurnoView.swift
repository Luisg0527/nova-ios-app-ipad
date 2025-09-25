//
//  ListaTurnoView.swift
//  nova-ios-app-ipad
//
//  Created by Alumno on 23/09/25.
//
import SwiftUI

struct ListaTurnoView: View {
    @StateObject var turnoService = TurnoService()
    @State private var turnoSeleccionado: Turno?
    @State private var mostrarAlert = false

    var body: some View {
        VStack(spacing: 20) {
            let turnoStr = turnoService.turnoActual()
            let turnosFiltrados = turnoService.listaTurno.filter { $0.hora == turnoStr }

            // Banner superior mostrando turno actual
            RoundedRectangle(cornerRadius: 15)
                .fill(turnosFiltrados.isEmpty ? Color.gray : Color.yellow)
                .frame(height: 50)
                .overlay(
                    Text(turnosFiltrados.isEmpty ? "" : "Turno(s) hora \(turnoStr)")
                        .foregroundColor(.black)
                        .font(.headline)
                )
                .padding(.horizontal, 100)

            HStack {
                Spacer()
                List(turnosFiltrados) { turnoItem in
                    TurnoRow(turno: turnoItem)
                        .onTapGesture {
                            turnoSeleccionado = turnoItem
                            mostrarAlert = true
                        }
                }
                .listStyle(.inset)
                .frame(width: 600, height: 750)
                .cornerRadius(20)
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(Color.black, lineWidth: 2)
                )
                Spacer()
            }
        }
        .alert("Dar prioridad a este turno?", isPresented: $mostrarAlert, actions: {
            Button("Sí") {
                if let turno = turnoSeleccionado {
                    // Llamada al endpoint para cambiar prioridad en la DB
                    turnoService.updatePrioridad(turno: turno)
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
    }
}


#Preview {
    ListaTurnoView()
}

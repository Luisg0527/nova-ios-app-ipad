//
//  ListaTurnoView.swift
//  nova-ios-app-ipad
//
//  Created by Alumno on 23/09/25.
//

import SwiftUI

struct ListaTurnoView: View {
    
    @State private var turnoSeleccionado: Turno?
        @State private var mostrarAlert = false
    
    var body: some View {
        VStack(spacing:20){
            
            let turnoPrioridad = listaTurno.first(where: { $0.prioridad })
            
            RoundedRectangle(cornerRadius: 15)
                .fill(turnoPrioridad != nil ? Color.yellow : Color.gray)
                .frame(height: 50)
                .overlay(
                    Text(turnoPrioridad != nil ? "Turno \(turnoPrioridad!.numTurno)" : "")
                        .foregroundColor(.black)
                        .font(.headline)
                            )
                            .padding(.horizontal, 100)
            
            HStack{
                
                Spacer()
                List(listaTurno){turnoItem in
                    
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
                       if let turno = turnoSeleccionado,
                          let index = listaTurno.firstIndex(where: { $0.id == turno.id }) {
                           listaTurno[index].prioridad = true
                       }
                   }
                   Button("Cancelar", role: .cancel) {}
               }, message: {
                   if let turno = turnoSeleccionado {
                       Text("Turno \(turno.numTurno)")
                   }
               })
    }
}

#Preview {
    ListaTurnoView()
}

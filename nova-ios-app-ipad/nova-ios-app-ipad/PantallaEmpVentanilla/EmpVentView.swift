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
    var body: some View {
        VStack{
            Spacer()
            
            Text("Turno #")
                .font(.system(size: 60, weight: .bold))
                .foregroundStyle(Color(red: 255/255, green: 153/255, blue: 0/255))
            
            Spacer()
        }
        Spacer()
        VStack{
            HStack{Spacer()}
            
            Button(action:{
                turnoService.fetchTurnos()
                let turnoStr = turnoService.turnoActual()
                let turnosFiltrados = turnoService.filtrarTurnos(horaActual: turnoStr)
                llamadaApi(idTurno: turnosFiltrados[0].id)
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
        
    }
    
}

#Preview {
    EmpVentView()
}

//
//  SwiftUIView.swift
//  nova-ios-app-ipad
//
//  Created by Alumno on 23/09/25.
//

import SwiftUI

struct TurnoRow: View {
    @Binding public var turno: Turno
       
       var body: some View {
           HStack {
               VStack(alignment: .leading, spacing: 5) {
                   Text("Turno: \(turno.id)")
                       .font(.system(size: 40))
                       .foregroundStyle(turno.prioridad ? Color.black : Color(red: 0/255, green: 66/255, blue: 88/255))
                       .fontWeight(.bold)
                   Text("Hora: \(turno.hora)")
                       .font(.title2)
                       .foregroundStyle(turno.prioridad ? Color.black : Color.gray)
               }
               Spacer()
           }
           .padding()
           .background(turno.prioridad ? Color(red: 255/255, green: 153/255, blue: 0/255).opacity(0.2) : Color(red: 242/255, green: 242/255, blue: 242/255))
           .cornerRadius(10)
           .shadow(radius: 1)
       }
   }

   #Preview {
       TurnoRow(turno: .constant(Turno(id: 1, hora: "09:00", prioridad: false)))
   }

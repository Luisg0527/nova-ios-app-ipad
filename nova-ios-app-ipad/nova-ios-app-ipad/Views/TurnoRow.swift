//
//  SwiftUIView.swift
//  nova-ios-app-ipad
//
//  Created by Alumno on 23/09/25.
//

import SwiftUI

struct TurnoRow: View {
    @State public var turno: Turno
    
    
    var body: some View {
        HStack{
            VStack(alignment: .leading){
                Text("Turno: \(turno.numTurno)")
                    .font(.system(size: 40))
                    .foregroundStyle(Color(red:68/255 , green:100/255, blue:173/255))
                    .fontWeight(.bold)
            }.frame(width: 200)
            
            
           
            
        }
        .padding()
        .background(turno.prioridad ? Color.yellow.opacity(0.5) : Color.white) 
        .cornerRadius(12)
    }
}

#Preview {
    TurnoRow(turno: Turno(id: 1, numTurno: 1, hora: "09:00", prioridad: false))
    
}

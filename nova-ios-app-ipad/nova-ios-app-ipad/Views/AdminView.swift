//
//  AdminView.swift
//  nova-ios-app-ipad
//
//  Created by Alumno on 23/09/25.
//
// (Color(red: 255/255, green: 153/255, blue: 0/255)) naranja
//
//Color(red: 1/255, green: 104/255, blue: 138/255), Color(red: 0/255, green: 66/255, blue: 88/255) AZUL
// Azul Principal: Color(red: 1/255, green: 104/255, blue: 138/255)
// Naranja Principal: Color(red: 255/255, green: 153/255, blue: 0/255)
// Gris Fondo: Color(red: 242/255, green: 242/255, blue: 242/255)
// Gris Iconos: Color(red: 214/255, green: 214/255, blue: 214/255)
// Gris Texto: Color(red: 102/255, green: 102/255, blue: 102/255)



import SwiftUI

struct AdminView: View {
    //@Binding var selectedTab : Int

    var body: some View {
        VStack{
            Text("Fila Turno")
                .font(.system(size: 60, weight: .bold))
                .foregroundColor(Color(red: 0/255, green: 66/255, blue: 88/255))
                .padding(.bottom,20)
                .multilineTextAlignment(.center)
            
            
            ListaTurnoView()
                .padding(.horizontal, 20)
            
            
        }
        
        
    }
}

#Preview {
    AdminView()
}

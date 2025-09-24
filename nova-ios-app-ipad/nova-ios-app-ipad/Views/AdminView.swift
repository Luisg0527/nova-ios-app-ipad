//
//  AdminView.swift
//  nova-ios-app-ipad
//
//  Created by Alumno on 23/09/25.
//

import SwiftUI

struct AdminView: View {
    var body: some View {
        VStack{
            Text("Fila Turno")
                .font(.system(size: 60, weight: .bold))
                .foregroundColor(Color(red: 68/255, green: 100/255, blue: 173/255))
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

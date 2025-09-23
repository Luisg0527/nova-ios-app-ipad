//
//  EmpVentView.swift
//  nova-ios-app-ipad
//
//  Created by Luis Garza on 21/09/25.
//

import SwiftUI

struct EmpVentView: View {
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
                // algo
            }){Text("Crear turno")
                    .frame(maxWidth: .infinity)
                    .padding(20)
                    .multilineTextAlignment(.center)
                    .font(.system(size: 30))
                    .tint(Color(red: 1/255, green: 104/255, blue: 138/255))
                    .fontWeight(.semibold)
            }
                .frame(width: 500, height: 85)
                .padding()
                .background(.white)
                .cornerRadius(24)
                //.padding(.bottom, 32)
            
            Button(action:{
                // algo
            }){Text("Crear turno")
                    .frame(maxWidth: .infinity)
                    .padding(20)
                    .multilineTextAlignment(.center)
                    .font(.system(size: 30))
                    .tint(.white)
                    .fontWeight(.semibold)
            }
                .frame(width: 500, height: 85)
                .padding()
                .background(Color(red: 1/255, green: 104/255, blue: 138/255, opacity: 0.0))
                .cornerRadius(24)
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(.white, lineWidth: 2)
                    
                )
                .padding(.top, 32)
        }
        .frame(height: 450)
        .background(
            LinearGradient(gradient: Gradient(colors: [Color(red: 1/255, green: 104/255, blue: 138/255), Color(red: 0/255, green: 66/255, blue: 88/255)]), startPoint: .topLeading, endPoint: .bottomTrailing)
            )
    }
}

#Preview {
    EmpVentView()
}

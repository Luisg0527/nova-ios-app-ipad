//
//  UsuarioView.swift
//  nova-ios-app
//
//  Created by Alumno on 26/08/25.
//

import SwiftUI
import Foundation

struct UsuarioView: View {
    @Binding var mostrarLogin: Bool

    var username: String {
        UserDefaults.standard.string(forKey: "nombreUsuario") ?? ""
    }
    
    var thisUser: Usuario = getDetallesUsr(nombreUsuario: UserDefaults.standard.string(forKey: "nombreUsuario") ?? "")

    var body: some View {
        VStack {
            HStack{ Spacer() }
            
            Text("Usuario")
                .padding(.top, 10)
                .font(.system(size: 76))
                .fontWeight(.bold)
                .foregroundStyle(Color(red: 102/255, green: 102/255, blue: 102/255))
            
            Divider()
                .tint(Color(red: 255/255, green: 153/255, blue: 0/255))
                .padding(.bottom,30)
            
            HStack{
                Text("Nombre")
                    .font(.system(size: 29))
                    .fontWeight(.bold)
                    .foregroundStyle(Color(red: 102/255, green: 102/255, blue: 102/255))
                    .opacity(0.7)
                    .padding(.top, 20)
                    .padding(.leading, 50)
                Spacer()
            }
            
            HStack{
                Text("\(thisUser.nombre)")
                    .font(.system(size: 58))
                    .fontWeight(.bold)
                    .foregroundStyle(Color(red: 102/255, green: 102/255, blue: 102/255))
                    .padding(.leading, 50)
                Spacer()
            }.padding(.bottom, -9)
            
            HStack{
                Text("Usuario")
                    .font(.system(size: 29))
                    .fontWeight(.bold)
                    .foregroundStyle(Color(red: 102/255, green: 102/255, blue: 102/255))
                    .opacity(0.7)
                    .padding(.top, 20)
                    .padding(.leading, 50)
                Spacer()
            }
            
            HStack{
                Text(username.isEmpty ? "Username" : username)
                    .font(.system(size: 58))
                    .fontWeight(.bold)
                    .foregroundStyle(Color(red: 102/255, green: 102/255, blue: 102/255))
                    .padding(.leading, 50)
                Spacer()
            }.padding(.bottom, -9)
            
            HStack{
                Text("Fecha de Nacimiento")
                    .font(.system(size: 29))
                    .fontWeight(.bold)
                    .foregroundStyle(Color(red: 102/255, green: 102/255, blue: 102/255))
                    .opacity(0.7)
                    .padding(.top, 20)
                    .padding(.leading, 50)
                Spacer()
            }
            
            HStack{
                Text("\(formatFechaNacimiento(thisUser.fechaNacimiento))")
                    .font(.system(size: 58))
                    .fontWeight(.bold)
                    .foregroundStyle(Color(red: 102/255, green: 102/255, blue: 102/255))
                    .padding(.leading, 50)
                Spacer()
            }.padding(.bottom, -9)
            
            HStack{
                Text("Clave")
                    .font(.system(size: 29))
                    .fontWeight(.bold)
                    .foregroundStyle(Color(red: 102/255, green: 102/255, blue: 102/255))
                    .opacity(0.7)
                    .padding(.top, 20)
                    .padding(.leading, 50)
                Spacer()
            }
            
            HStack{
                Text("\(thisUser.identificadorU)")
                    .font(.system(size: 58))
                    .fontWeight(.bold)
                    .foregroundStyle(Color(red: 102/255, green: 102/255, blue: 102/255))
                    .padding(.leading, 50)
                Spacer()
            }.padding(.bottom, -9)
            
            Spacer()
            
            Button(action:{
                UserDefaults.standard.removeObject(forKey: "nombreUsuario")
                mostrarLogin = true
            }){
                Text("Cerrar Sesión")
                    .padding(20)
                    .multilineTextAlignment(.center)
                    .font(.system(size: 40))
                    .tint(Color(red: 236/255, green: 48/255, blue: 48/255))
                    .fontWeight(.semibold)
            }
            .frame(width: 440 , height: 80)
            .padding()
            .background(Color(red: 242/255, green: 242/255, blue: 242/255))
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(Color(red: 236/255, green: 48/255, blue: 48/255), lineWidth: 2)
            ).padding(.bottom, 65)
            
            ZStack{
                Rectangle()
                    .fill(Color(red: 255/255, green: 153/255, blue: 0/255))
                    .frame(width: 1000, height: 80)
                    .rotationEffect(.degrees(170))
                
                Rectangle()
                    .fill(Color(red: 1/255, green: 104/255, blue: 138/255))
                    .frame(width: 1000, height: 80)
            }.padding(.bottom, 60)
        }
        .background(Color(red: 242/255, green: 242/255, blue: 242/255))
    }
}

#Preview {
    UsuarioView(mostrarLogin: .constant(false))
}

//
//  InicioSesionView.swift
//  nova-ios-app-ipad
//
//  Created by Luis Garza on 22/09/25.
//

import SwiftUI

struct InicioSesionView: View {
    @State private var usuario: String = ""
    @State private var password: String = ""
    @State private var mensaje: String = ""
    @State private var loginExitoso: Bool = false
    
    // Controla si se abre la pantalla de cambiar contraseña
    @State private var mostrarCambiarContrasena = false
    
    var body: some View {
        VStack(spacing: 25) {
            
            Text("Inicio de Sesión")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.top, 80)
            
            // Usuario
            TextField("Usuario", text: $usuario)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .autocapitalization(.none)
                .padding(.horizontal, 40)
            
            // Contraseña
            SecureField("Contraseña", text: $password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal, 40)
            
            // Botón de iniciar sesión
            Button(action: {
                if UsuarioMock.validarLogin(nombreUsuario: usuario, password: password) {
                    mensaje = "Login exitoso"
                    loginExitoso = true
                } else {
                    mensaje = "Usuario o contraseña incorrectos"
                    loginExitoso = false
                }
            }) {
                Text("Iniciar Sesión")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color(red: 1/255, green: 104/255, blue: 138/255))
                    .foregroundColor(.white)
                    .cornerRadius(20)
                    .padding(.horizontal, 40)
            }
            
            Button(action: {
                mostrarCambiarContrasena = true
            }) {
                Text("¿Olvidaste tu contraseña?")
                    .font(.subheadline)
                    .foregroundColor(.blue)
            }
            .padding(.top, 10)
            // Aquí abrimos la pantalla de cambiar contraseña
            .fullScreenCover(isPresented: $mostrarCambiarContrasena) {
                CambiarContrasenaView()
            }
            
            Spacer()
        }
        .frame(width: 600)
        .padding(320)
        // Cuando login es exitoso, manda a ContentView
        .fullScreenCover(isPresented: $loginExitoso) {
            ContentView()
        }
        ZStack{
            Rectangle()
                .fill(Color(red: 255/255, green: 153/255, blue: 0/255))
                .frame(width: 1000, height: 100)
                .rotationEffect(.degrees(170))
            Rectangle()
                .fill(Color(red: 1/255, green: 104/255, blue: 138/255))
                .frame(width: 1000, height: 100)
        }.padding(.bottom, 60)
    }
}

#Preview {
    InicioSesionView()
}

//
//  InicioSesionView.swift
//  nova-ios-app-ipad
//
//  Created by Diego Guadiana on 22/09/25.
//

import SwiftUI

struct InicioSesionView: View {
    @Binding var mostrarLogin: Bool

    @State private var usuario: String = ""
    @State private var password: String = ""
    @State private var mensaje: String = ""
    @State private var loginExitoso: Bool = false
    @State private var mostrarCambiarContrasena = false

    var body: some View {
        VStack(spacing: 35) {
            // Logo arriba
            Image("Nova-logo")
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 200)
                .padding(.top, 60)
            
            // Título
            Text("Inicio de Sesión")
                .font(.system(size: 40, weight: .bold))
                .padding(.top, 10)
            
            // Usuario
            TextField("Usuario", text: $usuario)
                .font(.system(size: 22))
                .padding()
                .frame(height: 65)
                .background(Color(.systemGray6))
                .cornerRadius(12)
                .padding(.horizontal, 40)
                .autocorrectionDisabled(true)
                .autocapitalization(.none)
            
            // Contraseña
            SecureField("Contraseña", text: $password)
                .font(.system(size: 22))
                .padding()
                .frame(height: 65)
                .background(Color(.systemGray6))
                .cornerRadius(12)
                .padding(.horizontal, 40)
                .autocorrectionDisabled(true)
                .autocapitalization(.none)
            
            // Botón de iniciar sesión
            Button(action: {
                let respuesta = loginAPI(nombreUsuario: usuario, password: password)
                if let msg = respuesta.message, msg.lowercased().contains("exitoso") {
                    mensaje = msg
                    loginExitoso = true
                    UserDefaults.standard.set(usuario, forKey: "nombreUsuario")
                    mostrarLogin = false
                } else {
                    mensaje = respuesta.error ?? "Usuario o contraseña incorrectos"
                    loginExitoso = false
                }
            }) {
                Text("Iniciar Sesión")
                    .font(.system(size: 23, weight: .semibold))
                    .frame(maxWidth: .infinity)
                    .frame(height: 65)
                    .background(Color(red: 1/255, green: 104/255, blue: 138/255))
                    .foregroundColor(.white)
                    .cornerRadius(20)
                    .padding(.horizontal, 40)
            }
            
            // Botón de olvidaste tu contraseña
            Button(action: {
                mostrarCambiarContrasena = true
            }) {
                Text("¿Olvidaste tu contraseña?")
                    .font(.system(size: 23))
                    .foregroundColor(.blue)
                    .underline()
            }
            .padding(.top, 5)
            .fullScreenCover(isPresented: $mostrarCambiarContrasena) {
                CambiarContrasenaView()
            }
            
            if !mensaje.isEmpty {
                Text(mensaje)
                    .font(.subheadline)
                    .foregroundColor(loginExitoso ? .green : .red)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 40)
            }
        }
        .frame(width: 650)
        .padding(200)
        
        ZStack {
            Rectangle()
                .fill(Color(red: 255/255, green: 153/255, blue: 0/255))
                .frame(width: 1000, height: 100)
                .rotationEffect(.degrees(170))
            
            Rectangle()
                .fill(Color(red: 1/255, green: 104/255, blue: 138/255))
                .frame(width: 1000, height: 100)
        }
        .padding(.bottom, 130)
        .ignoresSafeArea(.keyboard)
        .fullScreenCover(isPresented: $loginExitoso) {
            ContentView()
        }
    }
}

#Preview {
    InicioSesionView(mostrarLogin: .constant(true))
}

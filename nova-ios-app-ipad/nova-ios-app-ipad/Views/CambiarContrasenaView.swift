//
//  CambiarContrasenaView.swift
//  nova-ios-app-ipad
//
//  Created by Alumno on 24/09/25.
//

import SwiftUI

struct CambiarContrasenaView: View {
    @State private var usuario: String = ""
    @State private var newPassword: String = ""
    @State private var confirmarPassword: String = ""
    @State private var mensaje: String = ""
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack(spacing: 30) {
            
            // Logo arriba
            Image("Nova-logo")
                .resizable()
                .scaledToFit()
                .frame(width: 160, height: 160)
                .padding(.top, 50)
            
            // Título
            Text("Cambiar Contraseña")
                .font(.system(size: 34, weight: .bold))
                .padding(.top, 5)
            
            // Usuario
            TextField("Usuario", text: $usuario)
                .font(.system(size: 22))
                .padding()
                .frame(height: 65)
                .background(Color(.systemGray6))
                .cornerRadius(12)
                .padding(.horizontal, 40)
                .textInputAutocapitalization(.never)
                .autocorrectionDisabled(true)
            
            // Nueva contraseña
            SecureField("Nueva contraseña", text: $newPassword)
                .font(.system(size: 22))
                .padding()
                .frame(height: 65)
                .background(Color(.systemGray6))
                .cornerRadius(12)
                .padding(.horizontal, 40)
                .textInputAutocapitalization(.never)
                .autocorrectionDisabled(true)
            
            // Confirmar nueva contraseña
            SecureField("Confirmar nueva contraseña", text: $confirmarPassword)
                .font(.system(size: 22))
                .padding()
                .frame(height: 65)
                .background(Color(.systemGray6))
                .cornerRadius(12)
                .padding(.horizontal, 40)
                .textInputAutocapitalization(.never)
                .autocorrectionDisabled(true)
            
            // Botón actualizar
            Button(action: {
                if newPassword != confirmarPassword {
                    mensaje = "Las contraseñas no coinciden"
                } else {
                    let respuesta = changePasswordAPI(nombreUsuario: usuario, newPassword: newPassword)
                    
                    if let msg = respuesta.message, msg.lowercased().contains("correctamente") {
                        mensaje = msg
                    } else {
                        mensaje = respuesta.error ?? "Error al cambiar contraseña"
                    }
                }
            }) {
                Text("Actualizar Contraseña")
                    .font(.system(size: 22, weight: .semibold))
                    .frame(maxWidth: .infinity)
                    .frame(height: 65)
                    .background(Color(red: 1/255, green: 104/255, blue: 138/255))
                    .foregroundColor(.white)
                    .cornerRadius(20)
                    .padding(.horizontal, 40)
            }
            
            // Botón regresar
            Button(action: {
                dismiss()
            }) {
                Text("Regresar")
                    .font(.system(size: 20))
                    .frame(maxWidth: .infinity)
                    .frame(height: 55)
                    .background(Color(.systemGray5))
                    .foregroundColor(.blue)
                    .cornerRadius(12)
                    .padding(.horizontal, 40)
            }
            .padding(.top, 5)
            
            // Mensaje
            if !mensaje.isEmpty {
                Text(mensaje)
                    .foregroundColor(mensaje.lowercased().contains("correctamente") ? .green : .red)
                    .font(.subheadline)
                    .padding(.top, 10)
            }
            
            Spacer()
        }
        .frame(width: 650)
        .padding(100)
        
        ZStack {
            Rectangle()
                .fill(Color(red: 255/255, green: 153/255, blue: 0/255))
                .frame(width: 1000, height: 100)
                .rotationEffect(.degrees(170))
            
            Rectangle()
                .fill(Color(red: 1/255, green: 104/255, blue: 138/255))
                .frame(width: 1000, height: 100)
        }
        .padding(.bottom, 30)
    }
}

#Preview {
    CambiarContrasenaView()
}

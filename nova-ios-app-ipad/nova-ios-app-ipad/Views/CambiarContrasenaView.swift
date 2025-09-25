//
//  CambiarContrasenaView.swift
//  nova-ios-app-ipad
//
//  Created by Alumno on 24/09/25.
//

import SwiftUI

struct CambiarContrasenaView: View {
    @State private var usuario: String = ""
    @State private var oldPassword: String = ""
    @State private var newPassword: String = ""
    @State private var confirmarPassword: String = ""
    @State private var mensaje: String = ""
    
    // Para cerrar la vista (regresar)
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack(spacing: 25) {
            
            // Encabezado con botón regresar
            HStack {
                Button(action: {
                    dismiss() // Cierra esta pantalla
                }) {
                    Image(systemName: "chevron.left")
                        .foregroundColor(.blue)
                        .font(.title2)
                }
                Spacer()
                Text("Cambiar Contraseña")
                    .font(.headline)
                    .fontWeight(.bold)
                Spacer()
                // Espacio vacío para balancear
                Spacer().frame(width: 40)
            }
            .padding(.horizontal, 20)
            .padding(.top, 20)
            
            // Usuario
            TextField("Usuario", text: $usuario)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal, 40)
            
            // Contraseña actual
            SecureField("Contraseña actual", text: $oldPassword)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal, 40)
            
            // Nueva contraseña
            SecureField("Nueva contraseña", text: $newPassword)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal, 40)
            
            // Confirmar nueva contraseña
            SecureField("Confirmar nueva contraseña", text: $confirmarPassword)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal, 40)
            
            // Botón de actualizar
            Button(action: {
                if newPassword != confirmarPassword {
                    mensaje = "Las contraseñas no coinciden ❌"
                } else if UsuarioMock.cambiarPassword(nombreUsuario: usuario, oldPassword: oldPassword, newPassword: newPassword) {
                    mensaje = "Contraseña cambiada correctamente ✅"
                } else {
                    mensaje = "Error al cambiar contraseña ❌"
                }
            }) {
                Text("Actualizar Contraseña")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(12)
                    .padding(.horizontal, 40)
            }
            
            // Mensaje de resultado
            if !mensaje.isEmpty {
                Text(mensaje)
                    .foregroundColor(mensaje.contains("✅") ? .green : .red)
                    .font(.subheadline)
                    .padding(.top, 10)
            }
            
            Spacer()
        }
    }
}


#Preview {
    CambiarContrasenaView()
}

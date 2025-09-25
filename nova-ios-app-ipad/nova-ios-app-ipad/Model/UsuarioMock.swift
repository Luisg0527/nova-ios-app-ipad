//
//  UsuarioMock.swift
//  nova-ios-app-ipad
//
//  Created by Alumno on 23/09/25.
//

import Foundation

// Modelo de Usuario
struct UsuarioMockLol: Identifiable {
    let id: Int
    let nombreUsuario: String
    var password: String
}

// Mock de usuarios hardcodeados
class UsuarioMock {
    static var usuarios: [UsuarioMockLol] = [
        UsuarioMockLol(id: 1, nombreUsuario: "juanperez", password: "1234"),
        UsuarioMockLol(id: 2, nombreUsuario: "maria", password: "abcd"),
        UsuarioMockLol(id: 3, nombreUsuario: "admin", password: "admin123")
    ]
    
    // Validar login
    static func validarLogin(nombreUsuario: String, password: String) -> Bool {
        return usuarios.contains { $0.nombreUsuario == nombreUsuario && $0.password == password }
    }
    
    // Cambiar contraseña
    static func cambiarPassword(nombreUsuario: String, oldPassword: String, newPassword: String) -> Bool {
        if let index = usuarios.firstIndex(where: { $0.nombreUsuario == nombreUsuario && $0.password == oldPassword }) {
            usuarios[index].password = newPassword
            return true
        }
        return false
    }
}


//
//  IniciarSesion.swift
//  nova-ios-app-ipad
//
//  Created by Alumno on 25/09/25.
//

import Foundation

struct LoginResponse: Codable {
    let message: String?
    let error: String?
}

struct PasswordChangeResponse: Codable {
    let message: String?
    let error: String?
}

func loginAPI(nombreUsuario: String, password: String) -> LoginResponse {
    var respuesta = LoginResponse(message: nil, error: nil)
    guard let url = URL(string: "http://10.14.255.42:10205/login") else {
        return respuesta
    }
    
    let group = DispatchGroup()
    group.enter()
    
    var request = URLRequest(url: url)
    request.httpMethod = "POST"
    request.addValue("application/json", forHTTPHeaderField: "Content-Type")
    
    let body: [String: Any] = [
        "nombreUsuario": nombreUsuario,
        "password": password
    ]
    request.httpBody = try? JSONSerialization.data(withJSONObject: body)
    
    let task = URLSession.shared.dataTask(with: request) { data, response, error in
        if error != nil {
            print("Error en la llamada: \(error!.localizedDescription)")
            group.leave()
            return
        }
        
        guard let httpResponse = response as? HTTPURLResponse else {
            print("Respuesta no válida del servidor")
            group.leave()
            return
        }
        
        if httpResponse.statusCode != 200 {
            print("Código de error del API: \(httpResponse.statusCode)")
            group.leave()
            return
        }
        
        let jsonDecoder = JSONDecoder()
        if let data = data {
            do {
                respuesta = try jsonDecoder.decode(LoginResponse.self, from: data)
            
                if let msg = respuesta.message, msg.lowercased().contains("exitoso") {
                    UserDefaults.standard.set(nombreUsuario, forKey: "nombreUsuario")
                }
                
            } catch {
                print("Error de conversión JSON: \(error)")
            }
        } else {
            print("No se recibieron datos")
        }
        group.leave()
    }
    task.resume()
    group.wait()
    return respuesta
}

func changePasswordAPI(nombreUsuario: String, newPassword: String) -> PasswordChangeResponse {
    var respuesta = PasswordChangeResponse(message: nil, error: nil)
    guard let url = URL(string: "http://10.14.255.42:10205/change-password") else {
        return respuesta
    }
    
    let group = DispatchGroup()
    group.enter()
    
    var request = URLRequest(url: url)
    request.httpMethod = "PUT"
    request.addValue("application/json", forHTTPHeaderField: "Content-Type")
    
    let body: [String: Any] = [
        "nombreUsuario": nombreUsuario,
        "newPassword": newPassword
    ]
    request.httpBody = try? JSONSerialization.data(withJSONObject: body)
    
    let task = URLSession.shared.dataTask(with: request) { data, response, error in
        if error != nil {
            print("Error en la llamada: \(error!.localizedDescription)")
            group.leave()
            return
        }
        
        guard let httpResponse = response as? HTTPURLResponse else {
            print("Respuesta no válida del servidor")
            group.leave()
            return
        }
        
        if httpResponse.statusCode != 200 {
            print("Código de error del API: \(httpResponse.statusCode)")
            group.leave()
            return
        }
        
        let jsonDecoder = JSONDecoder()
        if let data = data {
            do {
                respuesta = try jsonDecoder.decode(PasswordChangeResponse.self, from: data)
            } catch {
                print("Error de conversión JSON: \(error)")
            }
        } else {
            print("No se recibieron datos")
        }
        group.leave()
    }
    task.resume()
    group.wait()
    return respuesta
}

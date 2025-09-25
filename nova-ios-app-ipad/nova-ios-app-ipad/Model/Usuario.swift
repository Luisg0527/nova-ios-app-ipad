//
//  Usuario.swift
//  nova-ios-app-ipad
//
//  Created by Luis Garza on 23/09/25.
//

import Foundation

struct Usuario: Codable {
    var nombre: String
    var identificadorU: String
    var fechaNacimiento: String
    
    init(nombre: String, nombreUsuario: String, identificadorU: String, fechaNacimiento: String) {
        self.nombre = nombre
        self.identificadorU = identificadorU
        self.fechaNacimiento = fechaNacimiento
    }
    init() {
        self.nombre = "Nombre"
        self.identificadorU = "CL000"
        self.fechaNacimiento = "01 ene 2000"
    }
}


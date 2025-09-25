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
        self.nombre = "payolo"
        self.identificadorU = "ADM010"
        self.fechaNacimiento = "01/10/2004"
    }
}


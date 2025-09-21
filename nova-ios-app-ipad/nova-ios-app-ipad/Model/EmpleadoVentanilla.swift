//
//  EmpleadoVentanilla.swift
//  nova-ios-app-ipad
//
//  Created by Luis Garza on 21/09/25.
//

import Foundation

struct EmpleadoVentanilla: Codable, Identifiable {
    var numEmpleado: String
    var nombre: String
    var apellidoPaterno: String
    var apellidoMaterno: String
    var totalRecetas: Int
    var pTiempoRecetas: Int
    var enVentanilla: Bool
    var diasPorSemana: Int
    var id: Int
}

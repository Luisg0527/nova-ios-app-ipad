//
//  ComidaOpciones.swift
//  Graficas
//
//  Created by Juan Pablo Escalona on 14/09/25.
//

import Foundation

struct Receta: Identifiable {
    var id : Int
    var nombre : String
    var apellidoP : String
    var CantidadRecetas : Int
    var Tiempo : Int
    
    
    init(id: Int, nombre : String, apellidoP : String, CantidadRecetas: Int, Tiempo: Int) {
        self.id = id
        self.nombre = nombre
        self.apellidoP = apellidoP
        self.CantidadRecetas = CantidadRecetas
        self.Tiempo = Tiempo
    }
}

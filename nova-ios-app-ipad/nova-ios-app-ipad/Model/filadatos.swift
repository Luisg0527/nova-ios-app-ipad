//
//  filadatos.swift
//  nova-ios-app-ipad
//
//  Created by Alumno on 23/09/25.
//

import Foundation

    var listaTurno = obtenerFila()
func obtenerFila() -> Array<Turno>{
    var listaTurno: Array<Turno> = []
    listaTurno = [
        Turno(id: 1, numTurno: 1, hora: "09:00", prioridad: false),
        Turno(id: 2, numTurno: 2, hora: "09:15", prioridad: false),
        Turno(id: 3, numTurno: 3, hora: "09:30", prioridad: false),
        Turno(id: 4, numTurno: 4, hora: "09:45", prioridad: false),
        Turno(id: 5, numTurno: 5, hora: "10:00", prioridad: false),
        Turno(id: 6, numTurno: 6, hora: "10:15", prioridad: false),
        Turno(id: 7, numTurno: 7, hora: "10:30", prioridad: false)
    ]
    return listaTurno
    
}

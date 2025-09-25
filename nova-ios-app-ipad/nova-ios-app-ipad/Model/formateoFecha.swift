//
//  formateoFecha.swift
//  nova-ios-app
//
//  Created by Alumno on 23/09/25.
//

import Foundation

func formatFechaNacimiento(_ fechaString: String) -> String {
    let inputFormatter = DateFormatter()
    inputFormatter.locale = Locale(identifier: "en_US_POSIX")
    inputFormatter.dateFormat = "E, dd MMM yyyy HH:mm:ss zzz"
    
    guard let date = inputFormatter.date(from: fechaString) else {
        return fechaString
    }
    
    let outputFormatter = DateFormatter()
    outputFormatter.locale = Locale(identifier: "es_MX")
    outputFormatter.dateFormat = "dd MMM yyyy"
    
    return outputFormatter.string(from: date)
    
}

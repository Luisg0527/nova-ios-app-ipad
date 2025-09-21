//
//  ModelData.swift
//  nova-ios-app-ipad
//
//  Created by Luis Garza on 21/09/25.
//

import Foundation

var listaEmpleadosVentanilla: Array<EmpleadoVentanilla> = callAPIListaJson()

func callAPIListaJson() -> Array<EmpleadoVentanilla> {
        
        var empleadoVListaRegresar: Array<EmpleadoVentanilla> = []
        guard let url = URL(string:"http://10.14.255.42:10205/empleadoV/GET") else{
            return empleadoVListaRegresar
        }
        
        
        let group = DispatchGroup()
        group.enter()
        
        let task = URLSession.shared.dataTask(with: url){
            data, response, error in
            
            if error != nil {
                print("Error en la llamada: \(error!.localizedDescription)")
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse else {
                print("Respuesta no válida del servidor")
                return
            }
            
            if (httpResponse.statusCode != 200){
                print("Código de error del API: \(httpResponse.statusCode)")
                return
            }
            
            let jsonDecoder = JSONDecoder()
            if (data != nil){
                do{
                    let empleadoVList:Array<EmpleadoVentanilla> = try jsonDecoder.decode([EmpleadoVentanilla].self, from: data!)
                    
//                    for empleadoVItem in empleadoVList{
//                        print("Id: \(empleadoVItem.id) - Titulo: \(empleadoVItem.title)")
//                    }
                    empleadoVListaRegresar = empleadoVList
                    
                }catch{
                    print("Error de conversion JSON: \(error)")
                }
            }else{
                print("No se recibieron datos")
            }
            group.leave()
        }
        task.resume()
        group.wait()
        return empleadoVListaRegresar
    }

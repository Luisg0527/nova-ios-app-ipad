//
//  ContentView.swift
//  TabViewEjemplo
//
//  Created by Juan Pablo Escalona on 26/08/25.
//

import SwiftUI

struct ContentView: View {
    @State private var mostrarLogin: Bool = false
    
    init() {
        if let _ = UserDefaults.standard.string(forKey: "nombreUsuario") {
            _mostrarLogin = State(initialValue: false)
        } else {
            _mostrarLogin = State(initialValue: true)
        }
    }
    
    var body: some View {
        if mostrarLogin {
            InicioSesionView(mostrarLogin: $mostrarLogin)
        } else {
            VStack {
                TabView{
                    TablasComparativasView()
                        .tabItem {
                            Image(systemName: "house.circle")
                            Text("Home")
                        }
                    AdminView()
                        .tabItem {
                            Image(systemName: "doc.richtext.fill")
                            Text("Detalles")
                        }
                    UsuarioView(mostrarLogin: $mostrarLogin)
                        .tabItem {
                            Image(systemName: "doc.richtext.fill")
                            Text("Usuario")
                        }
                    EmpVentView()
                        .tabItem {
                            Image(systemName: "doc.richtext.fill")
                            Text("Empleado")
                        }
                }
                .indexViewStyle(.page)
            }
        }
    }
    
    #Preview {
        ContentView()
    }
}

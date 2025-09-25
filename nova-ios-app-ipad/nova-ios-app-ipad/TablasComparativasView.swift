//
//  TablasComparativasView.swift
//  nova-ios-app-ipad
//
//  Created by Juan Pablo Escalona on 17/09/25.
//

import SwiftUI

struct TablasComparativasView: View {
    //@Binding var selectedTab : Int

    var body: some View {
        VStack {
            TabView {
                PantallaPrincipal()
                    .tabItem {
                        Image(systemName: "chart.bar")
                        Text("Gráfica")
                    }
                PantallaSecundaria()
                    .tabItem {
                        Image(systemName: "list.bullet")
                        Text("Listado")
                    }
            }
            .accentColor(.orange) // color del ítem activo
        }
    }
    
}

#Preview {
    TablasComparativasView()
}


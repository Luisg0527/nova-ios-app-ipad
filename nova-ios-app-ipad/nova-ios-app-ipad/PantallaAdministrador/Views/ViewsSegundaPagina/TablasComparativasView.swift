//
//  TablasComparativasView.swift
//  nova-ios-app-ipad
//
//  Created by Juan Pablo Escalona on 17/09/25.
//

import SwiftUI

struct TablasComparativasView: View {
    var body: some View {
        VStack {
            // 🔹 Header
            HStack {
                Text("Tablas Comparativas")
                    .font(.system(size: 48, weight: .bold))
                    .foregroundStyle(.black)

                Spacer()

                Image(systemName: "person.crop.circle")
                    .font(.system(size: 50))
                    .foregroundStyle(.black)
            }
            .padding(.horizontal, 30)

            // 🔹 TabView clásico (abajo)
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

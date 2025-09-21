//
//  ContentView.swift
//  TabViewEjemplo
//
//  Created by Juan Pablo Escalona on 26/08/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            HStack {
                Text("Dashboard")
                    .font(.system(size: 48, weight: .bold))
                    .foregroundStyle(.black)
                
                Spacer()
                
                Image(systemName: "person.crop.circle")
                    .font(.system(size: 50))
                    .foregroundStyle(.black)
            }.padding(.horizontal, 30)
            PantallaPrincipal()
        }
            
            }
    }

#Preview {
    ContentView()
}

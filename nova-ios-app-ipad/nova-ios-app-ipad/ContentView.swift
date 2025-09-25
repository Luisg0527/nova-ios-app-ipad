//
//  ContentView.swift
//  TabViewEjemplo
//
//  Created by Juan Pablo Escalona on 26/08/25.
//

import SwiftUI

struct ContentView: View {
    //@State private var selectedTab = 0
    var body: some View {
        VStack {
            TabView{
                TablasComparativasView()
                    .tabItem {
                        Image(systemName: "house.circle") //Emoji de casa
                        Text("Home")
                        
                    }
                AdminView()
                    .tabItem {
                        Image(systemName: "doc.richtext.fill")
                        Text("Detalles")
                    }
            }
            .indexViewStyle(.page)
            
        }
        
    }
}
#Preview {
    ContentView()
}

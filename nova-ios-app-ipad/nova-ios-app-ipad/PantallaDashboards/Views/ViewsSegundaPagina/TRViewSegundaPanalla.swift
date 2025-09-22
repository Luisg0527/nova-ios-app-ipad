//
//  InterfaceTablasComp.swift
//  nova-ios-app-ipad
//
//  Created by Juan Pablo Escalona on 17/09/25.
//

import SwiftUI

import Charts

struct TRViewSegundaPanalla: View {
    var body: some View {
        VStack {
            ZStack {
                //let azulnova = Color(red: 3/255, green: 104/255, blue: 138/255)
                let naranjanova = Color(red: 255/255, green: 153/255, blue: 0/255)
                
                
                RoundedRectangle(cornerRadius: 16, style: .continuous)
                    .fill(Color.white)
                    .shadow(color: .black.opacity(0.1), radius: 10, x: 0, y: 2)
                    .frame(height: 700)
                //.padding(.all, 7.0)
                    .overlay(
                        VStack(alignment: .leading, spacing: 12) {
                            
                            HStack{
                                Image(systemName: "person.fill")
                                    .font(.system(size: 30))
                                    .foregroundStyle(naranjanova)
                                    .frame(width:50, height : 50)
                                Text(" Análisis de eficiencia por receta")
                                //.font(.title)
                                    .font(.system(size: 35))
                                    .font(.headline)
                                    .foregroundStyle(.black)
                                Spacer()
                            }.padding(20)
                            Spacer()
                            RoundedRectangle(cornerRadius: 16, style: .continuous)
                                .fill(Color.white)
                                .padding(26.0)
                                .shadow(color: .black.opacity(0.08), radius: 8,x:0,y:2)
                                .frame(height: 500)
                                .overlay(
                                    Chart(listaEmpleadosVentanilla) { item in
                                        LineMark(
                                            x: .value("Nombre", item.nombre),
                                            y: .value("Cantidad", item.pTiempoRecetas)
                                        )
                                        //.padding(7.0)
                                        .foregroundStyle(.orange)
                                        .lineStyle(StrokeStyle(lineWidth:1, lineCap: .round))
                                        
                                        PointMark (
                                            x : .value("Nombre", item.nombre),
                                            y : .value("Cantidad", item.pTiempoRecetas)
                                        )
                                        .foregroundStyle(naranjanova)
                                        .symbolSize(70)
                                        
                                        
                                    }
                                        .padding(.all, 40.0)
                                    
                                    //.tint(.black)
                                    //.cornerRadius(8)
                                    // .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
                                    
                                )
                            Spacer()
                            HStack {
                                Spacer()
                                Text("18/12/2025")
                                    .font(.system(size: 20))
                                    .foregroundStyle(.gray)
                                Spacer()
                            }
                            Spacer()
                            
                        }.padding(10) //Padding para medir el texto
                    )
                    .padding([.leading, .bottom, .trailing], 10)
            }
            
        }
    }
}

#Preview {
   TRViewSegundaPanalla()
}

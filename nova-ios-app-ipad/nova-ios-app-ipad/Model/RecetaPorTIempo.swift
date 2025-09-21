import SwiftUI
import Charts

struct RecetaPorTIempo: View {
    var body: some View {
        ZStack {
            let azulnovaa = Color(red: 3/255, green: 104/255, blue: 138/255)
            //let naranjanova = Color(red: 255/255, green: 153/255, blue: 0/255)
            RoundedRectangle(cornerRadius: 16, style: .continuous)
                .fill(Color.white)
                .shadow(color: .black.opacity(0.1), radius: 10, x: 0, y: 2)
                .frame(height: 350)
                .overlay(
                    VStack (alignment: .leading, spacing: 12) {
                        HStack {
                            Image(systemName: "receipt.fill")
                                .font(.system(size: 30))
                                .foregroundStyle(azulnovaa)
                                .frame(width:50, height : 50)
                            Text(" Tiempo por Receta")
                                .font(.title)
                                .font(.headline)
                                .foregroundStyle(.black)
                            Spacer()
                            Picker(selection: .constant(1), label: Text("Elegir")) {
                                Text("Juan Perez").tag(1)
                                Text("Maria Gonzalez").tag(2)
                                Text("Roberto Estrada").tag(3)
                            }
                            .tint(.gray)
                        }
                        
                        RoundedRectangle(cornerRadius: 16, style: .continuous)
                            .fill(Color.white)
                            .shadow(color: .black.opacity(0.08), radius: 8,x:0,y:2)
                            .frame(height: 180)
                            .overlay(
                                Chart(datosBarChart) { item in
                                    LineMark(
                                        x: .value("Nombre", item.nombre),
                                        y: .value("Cantidad", item.CantidadRecetas)
                                    )
                                    .foregroundStyle(azulnovaa)
                                    .lineStyle(StrokeStyle(lineWidth:3, lineCap: .round))
                                    
                                    PointMark (
                                        x : .value("Nombre", item.nombre),
                                        y : .value("Cantidad", item.CantidadRecetas)
                                    )
                                    .foregroundStyle(azulnovaa)
                                    .symbolSize(100)
                                    
                                }
                                .frame(height: 250)
                                .padding()
                                
                            )
                            .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))

                            .padding(8)
                        
                        Spacer()
                        
                        HStack {
                            Text("Goal:")
                                .foregroundStyle(.gray)
                            Text("1.000")
                                .foregroundStyle(azulnovaa)
                            Spacer()
                            Text("Due day 31/12/2018")
                                .foregroundStyle(.gray)
                        }
                    }
                    .padding(16) // Padding adentro del rectángulo
                )
                .padding(.horizontal, 30) // Padding afuera del rectángulo
        }
        //Spacer() -> este lo comento, aquí no hace nada
    }
}

#Preview {
    RecetaPorTIempo()
}

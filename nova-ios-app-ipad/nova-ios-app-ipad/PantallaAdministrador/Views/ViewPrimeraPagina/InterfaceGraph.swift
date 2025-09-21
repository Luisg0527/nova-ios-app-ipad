import SwiftUI
import Charts

struct InterfaceGraph: View {
    var body: some View {
        ZStack {
            let azulnova = Color(red: 3/255, green: 104/255, blue: 138/255)
            //let naranjanovaa = Color(red: 255/255, green: 153/255, blue: 0/255)
            RoundedRectangle(cornerRadius: 16, style: .continuous)
                .fill(Color.white)
                .shadow(color: .black.opacity(0.1), radius: 10, x: 0, y: 2)
                .frame(height: 350)
                .overlay(
                    VStack (alignment: .leading, spacing: 12){
                        HStack{
                            Image(systemName: "person.fill")
                                .font(.system(size: 30))
                                .foregroundStyle(azulnova)
                                .frame(width:50, height : 50)
                            Text(" Recetas Vendidas")
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
                        //Spacer()
                        let recetas = datosBarChart[2].CantidadRecetas // 24
                        RoundedRectangle(cornerRadius: 16, style: .continuous)
                            .fill(Color.white)
                            .shadow(color: .black.opacity(0.08), radius: 8,x:0,y:2)
                            .frame(height: 180)
                            .overlay(
                                ZStack {
                                    
                                    Circle()
                                        .stroke(azulnova, lineWidth: 15)

                                    // texto central con el número total
                                    Text("\(recetas)")
                                        .font(.title)
                                        .bold()
                                        .foregroundColor(azulnova)
                                }
                                
                                    .padding(15)
                            )
                        Spacer()
                        HStack{
                            Text("Dias Trabajados")
                                .foregroundStyle(.gray)
                            Text("5")
                                .foregroundStyle(azulnova)
                            Spacer()
                            Text("Due day 31/12/2018")
                                .foregroundStyle(.gray)
                            
                        }
                        
                    }
                    //Padding adentro del rectangulo
                    .padding(16)
                        
                //Padding afuera del rectangulo
                )
                .padding(.horizontal, 30)
            
                
        }
        //Spacer()
    }
}

#Preview {
    InterfaceGraph()
}

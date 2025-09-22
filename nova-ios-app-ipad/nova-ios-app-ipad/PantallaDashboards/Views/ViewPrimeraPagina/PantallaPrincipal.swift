import SwiftUI

struct PantallaPrincipal: View {
    var body: some View {
        VStack {
            
            HStack {
                Text("Tablero de control")
                    .font(.system(size: 48, weight: .bold))
                    .foregroundStyle(.black)

                Spacer()

            }
            .padding(.horizontal, 30)
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    
                    
                    InterfaceGraph()
                }
                .padding(.vertical, 10)
                //.padding(.bottom, 0)
            }
            .background(Color(UIColor.systemGroupedBackground))
            //.scrollIndicators(.hidden) // opcional, para ocultar la barra lateral
        }
    }
}

#Preview {
    PantallaPrincipal()
}


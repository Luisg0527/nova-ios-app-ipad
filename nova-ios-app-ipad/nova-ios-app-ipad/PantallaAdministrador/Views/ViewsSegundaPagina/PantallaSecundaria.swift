import SwiftUI

struct PantallaSecundaria: View {
    var body: some View {
        VStack {
            HStack {
                Text("Análisis comparativo")
                    .font(.system(size: 48, weight: .bold))
                    .foregroundStyle(.black)

                Spacer()

                Image(systemName: "person.crop.circle")
                    .font(.system(size: 50))
                    .foregroundStyle(.black)
            }
            .padding(.horizontal, 30)
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    
                    
                    InterfaceTablasComp()
                    TRViewSegundaPanalla()
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
    PantallaSecundaria()
}


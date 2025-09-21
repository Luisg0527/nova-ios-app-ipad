import SwiftUI

struct PantallaSecundaria: View {
    var body: some View {
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

#Preview {
    PantallaSecundaria()
}


import SwiftUI

struct CardFinance: View {
    let title: String
    let amount: Double
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.system(size: 14, weight: .bold))
                .foregroundColor(.gray200)
                .padding(10)
            
            Text(amount, format: .currency(code: "USD"))
                .font(.title)
                .foregroundColor(.gray200)
                .padding(.horizontal, 15)
                
            
        }
        .frame(width: 200, height: 90, alignment: .topLeading)
        .background(.green100)
        .cornerRadius(8)
        
    }
}

import SwiftUI

struct Header: View {
    let greeting: String
    
    var body: some View {
        HStack {
            VStack (alignment: .leading ){
                Text("Hi, \(greeting)")
                    .font(.system(size: 20, weight: .bold))
                    .foregroundColor(.gray200)
                
                Text("Welcome back!")
                    .font(.system(size: 14))
                    .foregroundColor(.gray200)
            }
            
            Spacer()
            
            Image(systemName: "bell.fill")
                .font(.system(size: 25))
                .foregroundColor(.gray200)
        }
        .padding(.horizontal, 20)
    }
}


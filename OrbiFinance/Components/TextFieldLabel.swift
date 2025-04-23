//
//  TextFieldLabel.swift
//  OrbiFinance
//
//  Created by Lucas Renan on 17/04/25.
//

import SwiftUI

struct TextFieldLabel: View {
    @Binding var text: String
    let placeholder: String
    
    var body: some View {
        VStack (alignment: .leading){
            ZStack(alignment: .leading) {
                if text.isEmpty {
                    Text(placeholder)
                        .foregroundColor(.gray200).opacity(0.7)
                        .padding(15)
                }
                
                TextField("", text: $text)
                    .foregroundColor(.gray200)
                    .padding(15)
            }
            .background(.black700)
            .cornerRadius(8)
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color.green100, lineWidth: 2).opacity(0.5)
            )
        }
    }
}

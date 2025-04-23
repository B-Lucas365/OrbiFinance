
import SwiftUI

struct  CustomDropdown: View {
    @Binding var selectedType: TransactionType
    @State private var isExpanded = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Button{
                withAnimation {
                    isExpanded.toggle()
                }
            } label: {
                HStack {
                    Text(selectedType.displayName)
                        .foregroundColor(Color(.gray200)).opacity(0.7)
                    
                    Spacer()
                    Image(systemName: "chevron.down")
                        .rotationEffect(.degrees(isExpanded ? 180 : 0))
                        .foregroundColor(Color(.gray200)).opacity(0.7)
                }
                .padding()
                .background(Color(.black700))
                .cornerRadius(8)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color(.green100).opacity(0.5), lineWidth: 2)
                )
            }
            
            if isExpanded {
                VStack(spacing: 0) {
                    ForEach(TransactionType.allCases) { type in
                        Button {
                            selectedType = type
                            isExpanded = false
                        } label: {
                            HStack {
                                Text(type.displayName)
                                    .padding()
                                    .foregroundColor(Color(.gray200)).opacity(0.7)
                                Spacer()
                            }
                            .background(type == selectedType ? Color(.green700) : Color(.black700))
                        }

                        if type != TransactionType.allCases.last {
                            Divider()
                        }
                    }
                }
                .background(Color(.black700))
                .cornerRadius(8)
                .shadow(radius: 4)
            }
        }
        .animation(.easeInOut, value: isExpanded)
    }
}

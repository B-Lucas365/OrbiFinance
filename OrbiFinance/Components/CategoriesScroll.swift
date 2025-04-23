import SwiftUI

struct CategoriesScroll: View {
    @Binding var selectedCategory: TransactionCategory
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(TransactionCategory.allCases) {category in
                    VStack {
                        Text(category.displayName)
                            .foregroundColor(.gray200).opacity(0.7)
                    }
                    .padding(10)
                    .background(
                        category == selectedCategory ? Color.black700.opacity(0.5) : Color.black700
                    )
                    .cornerRadius(30)
                    .overlay(
                        RoundedRectangle(cornerRadius: 30)
                            .stroke(
                                category == selectedCategory ? Color.green100 : Color.green100.opacity(0.5), lineWidth: 2
                            )
                    )
                    .onTapGesture{
                        selectedCategory = category
                    }
                }
            }
            .padding(.horizontal, 20)
            .padding(.vertical, 10)
        }
    }
}

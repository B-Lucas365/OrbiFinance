import SwiftUI

struct TransactionRow: View {
    let transaction: Transaction

    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(transaction.title)
                    .font(.headline)
                    .foregroundColor(.gray200)
                Text(transaction.category.displayName)
                    .font(.caption)
                    .foregroundColor(.gray200)
            }

            Spacer()

            Text(transaction.amount, format: .currency(code: "USD"))
                .foregroundColor(transaction.type == .income ? .green : .red)
        }
        .padding()
        .background(Color.black700)
        .cornerRadius(10)
    }
}

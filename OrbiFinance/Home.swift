import SwiftUI

struct Home: View {
    @StateObject private var viewModel = FinanceViewModel()
    @State private var showModalTransaction: Bool = false

    var body: some View {
        VStack {
            VStack(alignment: .leading) {
                Header(greeting: "Lucas")
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 10) {
                        CardFinance(title: "Income", amount: viewModel.totalIncome)
                        CardFinance(title: "Expense", amount: viewModel.totalExpense)
                    }
                    .padding(.horizontal, 20)
                }
                
                VStack (alignment: .leading) {
                    Text("Total Balance")
                        .font(.system(size: 14))
                        .foregroundColor(.gray200)
                    
                    Text(viewModel.totalBalance, format: .currency(code: "USD"))
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.gray200)
                }
                .padding(.horizontal, 20)
                .padding(.top, 20)
                
                List {
                    ForEach(viewModel.transactions) { transaction in
                        TransactionRow(transaction: transaction)
                            .listRowBackground(Color.clear)
                    }
                    .onDelete { indexSet in
                        viewModel.deleteTransaction(at: indexSet)
                    }
                }
                .listStyle(.plain)
                .scrollContentBackground(.hidden)
                .background(Color.black700)
            }
            
            Spacer()
            
            HStack {
                Spacer()
                Button {
                    showModalTransaction.toggle()
                } label: {
                    VStack {
                        Image(systemName: "plus")
                            .font(.title)
                            .foregroundColor(Color(.gray200))
                    }
                    .padding(15)
                    .background(Color(.green100))
                    .clipShape(Circle())
                }
                .padding(.trailing, 20)
            }
            .sheet(isPresented: $showModalTransaction) {
                AddTransactionView(viewModel: viewModel)
                    .presentationDetents([.medium])
            }
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.black700)
    }
}

#Preview {
    Home()
}

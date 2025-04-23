import Foundation

class FinanceViewModel: ObservableObject {
    @Published private(set) var transactions: [Transaction] = []
    private let storageKey = "transactions_store_key"
    
    init() {
        LoadTransactions()
    }
    
    func addTransaction(_ transaction: Transaction) {
        transactions.append(transaction)
        saveTransactions()
    }
    
    func deleteTransaction(at offSets: IndexSet) {
        transactions.remove(atOffsets: offSets)
        saveTransactions()
    }
    
    var totalBalance: Double {
         transactions.reduce(0) { result, transaction in
             switch transaction.type {
             case .income:
                 return result + transaction.amount
             case .expense:
                 return result - transaction.amount
             }
         }
     }
    
    var totalIncome: Double {
        transactions.reduce(0) {result, transaction in
            transaction.type == .income ? result + transaction.amount : result
        }
    }
    
    var totalExpense: Double {
        transactions.reduce(0) { result, transaction in
            transaction.type == .expense ? result + transaction.amount : result
        }
    }

    
    private func saveTransactions() {
        if let encoded = try? JSONEncoder().encode(transactions) {
            UserDefaults.standard.set(encoded, forKey: storageKey)
        }
    }
    
    private func LoadTransactions() {
        if let data = UserDefaults.standard.data(forKey: storageKey),
           let decoded = try? JSONDecoder().decode([Transaction].self, from: data) {
            self.transactions = decoded
        }
    }
}

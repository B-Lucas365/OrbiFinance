import Foundation

struct Transaction: Identifiable, Codable {
    let id: UUID
    let title: String
    let amount: Double
    let date: Date
    let type: TransactionType
    let category: TransactionCategory
    init (
        title: String,
        amount: Double,
        date: Date,
        type: TransactionType,
        category: TransactionCategory
        
    ) {
        self.id = UUID()
        self.title = title
        self.amount = amount
        self.date = date
        self.type = type
        self.category = category
    }
}

import Foundation
enum TransactionCategory: String, Codable, CaseIterable, Identifiable {
    case food, salary, transport, shopping, entertainment, others
    
    var id: String {self.rawValue}
    
    var displayName: String {
        switch self {
        case .food: return "Food"
        case .salary: return "Salary"
        case .transport: return "Transport"
        case .shopping: return "Shopping"
        case .entertainment: return "Entertainment"
        case .others: return "Others"
        }
    }
}

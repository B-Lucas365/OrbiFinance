import Foundation

enum TransactionType: String, Codable, CaseIterable, Identifiable {
    case income
    case expense
    
    var id: String {self.rawValue}
    
    var displayName: String {
        switch self {
        case .income: return "Income"
        case .expense: return "Exprense"
        }
    }
}

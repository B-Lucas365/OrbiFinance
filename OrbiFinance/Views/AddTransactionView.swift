//
//  AddTransactionView.swift
//  OrbiFinance
//
//  Created by Lucas Renan on 17/04/25.
//
import SwiftUI


struct AddTransactionView: View {
    @ObservedObject var viewModel: FinanceViewModel
    @Environment(\.dismiss) private var dismiss
    @State private var title: String = ""
    @State private var amount: String = ""
    @State private var selectedType: TransactionType = .expense
    @State private var selectedCategory: TransactionCategory = .others
    @State private var selectedDate: Date = Date()
    @State private var isPickerVisible: Bool = false
    
    var body: some View {
        VStack(spacing: 10) {
            Text("Add Transaction")
                .font(.system(size: 18, weight: .bold))
                .foregroundColor(.gray200).opacity(0.6)
                .padding(.bottom, 20)
                .padding(.top, 30)
            
            VStack {
                TextFieldLabel(text: $title, placeholder: "Title")
                TextFieldLabel(text: $amount, placeholder: "Amount")
                    .keyboardType(.decimalPad)
            }
            .padding(.horizontal, 20)
            
            HStack {
                VStack {
                    CustomDropdown(selectedType: $selectedType)
                }
                .frame(width: 130)
                
                Button {
                    isPickerVisible.toggle()
                } label: {
                    HStack {
                        Text(selectedDate, style: .date)
                            .foregroundColor(Color(.gray200)).opacity(0.7)
                        Spacer()
                        Image(systemName: "calendar")
                            .foregroundColor(Color(.gray200)).opacity(0.7)
                    }
                    .padding()
                    .background(Color.black700)
                    .cornerRadius(10)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.green100.opacity(0.5), lineWidth: 2)
                    )
                }
                .sheet(isPresented: $isPickerVisible) {
                    VStack {
                        DatePicker("Select Date", selection: $selectedDate, displayedComponents: [.date])
                            .datePickerStyle(.wheel)
                            .labelsHidden()
                            .padding()
                            .tint(.white)
                        Button{
                            isPickerVisible = false
                        } label: {
                            Text("Done")
                                .foregroundColor(.black700)
                        }
                        .padding()
                    }
                    .presentationDetents([.medium])
                }
                
            }
            .padding(.horizontal, 20)
            
            CategoriesScroll(selectedCategory: $selectedCategory)
            
            Button {
                guard let value = Double(amount) else {return}
                let newTransaction = Transaction(
                    title: title,
                    amount: value,
                    date: selectedDate,
                    type: selectedType,
                    category: selectedCategory
                )
                
                viewModel.addTransaction(newTransaction)
                dismiss()
            } label: {
                VStack {
                    Text("Add Transaction")
                        .foregroundColor(.gray200).opacity(0.7)
                        .fontWeight(.bold)
                }
                .padding(15)
                .background(.green700)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color(.green100).opacity(0.8), lineWidth: 2)
                )
            }
            .disabled(title.isEmpty || amount.isEmpty)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .background(.black700)
    }
}



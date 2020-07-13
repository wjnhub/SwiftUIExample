//
//  AddView.swift
//  Expenses
//
//  Created by wjn on 2020/7/13.
//  Copyright © 2020 wjn. All rights reserved.
//

import SwiftUI

struct AddView: View {
    @State private var name = ""
    @State private var type = 0
    @State private var amount = ""
    var expenses: Expenses
    
    @Environment(\.presentationMode) var presentationMode
    
    static let types = ["生活用品", "数码家电", "服饰", "iOS学习"]
    
    var body: some View {
        NavigationView {
            Form {
                TextField("支出名", text: $name)
                Picker("种类", selection: $type) {
                    ForEach(Self.types.indices, id: \.self) {
                        Text(Self.types[$0])
                    }
                }
                TextField("话费", text: $amount)
                    .keyboardType(.numberPad)
            }
            .navigationBarTitle("添加支出")
            .navigationBarItems(trailing: Button("保存"){
                self.expenses.allExpenses.append(
                    Expense(
                        name: self.name,
                        type: Self.types[self.type],
                        amount: Int(self.amount) ?? 0)
                )
                self.presentationMode.wrappedValue.dismiss()
            }
            .disabled(name.isEmpty || amount.isEmpty)
            )
        }
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView(expenses: Expenses())
    }
}

//
//  ContentView.swift
//  Expenses
//
//  Created by wjn on 2020/7/13.
//  Copyright © 2020 wjn. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var showSheet = false
    @ObservedObject var expenses = Expenses()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(expenses.allExpenses) { expense in
                    HStack {
                        VStack(alignment: .leading, spacing: 5) {
                            Text(expense.name)
                                .font(.headline)
                            Text(expense.type)
                        }
                        Spacer()
                        
                        Text("\(expense.amount)")
                    }
                }
                .onDelete(perform: remove)
            }
            .navigationBarTitle("费用支出")
            .navigationBarItems(trailing:
                Button(action: {
                    self.showSheet = true
                }){
                    Image(systemName: "plus")
                }
            )
                .sheet(isPresented: $showSheet) {
                    AddView(expenses: self.expenses)
            }
            
        }
    }
    
    func remove(indexSet: IndexSet) {
        withAnimation {
            expenses.allExpenses.remove(atOffsets: indexSet)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

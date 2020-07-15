//
//  AddAddressView.swift
//  Tea
//
//  Created by wjn on 2020/7/15.
//  Copyright © 2020 wjn. All rights reserved.
//

import SwiftUI

struct AddAddressView: View {
    
    @ObservedObject var order: Order
    
    var body: some View {
        Form {
            Section {
                TextField("姓名", text: $order.name)
                TextField("手机", text: $order.phone)
                    .keyboardType(.numberPad)
                TextField("地址", text: $order.address)
            }
            
            Section {
                NavigationLink(destination: CheckOutView(order: order)) {
                    Text("确认订单")
                }.disabled(order.hasInvalidAddress)
            }
        }
        .navigationBarTitle(Text("送货地址"), displayMode: .inline)
    }
}

struct AddAddressView_Previews: PreviewProvider {
    static var previews: some View {
        AddAddressView(order: Order())
    }
}

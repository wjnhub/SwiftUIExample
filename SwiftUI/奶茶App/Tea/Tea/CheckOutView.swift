//
//  CheckOutView.swift
//  Tea
//
//  Created by wjn on 2020/7/15.
//  Copyright © 2020 wjn. All rights reserved.
// https://reqres.in 可以测试请求

import SwiftUI

struct CheckOutView: View {
    @ObservedObject var order: Order
    @State private var showAlert = false
    @State private var message = ""
    
    var body: some View {
        VStack(spacing: 20) {
            Text("合计\(order.num * 10)元")
                .font(.largeTitle)
            
            Button("下单") {
                self.sendOrder()
            }
        }
        .navigationBarTitle(Text("下单"), displayMode: .inline)
        .alert(isPresented: $showAlert) {
            Alert(title: Text("感谢下单"), message: Text(message), dismissButton: .default(Text("知道了")))
        }
    }
    
    func sendOrder() {
        guard let url = URL(string: "https://reqres.in/api/tea"), let data = try? JSONEncoder().encode(order) else { return }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = data
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let data = data else { return }
            guard let decodedData = try? JSONDecoder().decode(Order.self, from: data) else { return }
            let ice = decodedData.isAddIce ? "加冰" : ""
            let sugar = decodedData.isAddSugar  ? "加糖" : ""
            self.message =
            """
            服务器已经收到您的订单：
            \(decodedData.num)杯奶茶\(ice)\(sugar)
            送到以下地址：
            \(decodedData.name)
            \(decodedData.phone)
            \(decodedData.address)
            """
            self.showAlert = true
            
        }.resume()
    }
}

struct CheckOutView_Previews: PreviewProvider {
    static var previews: some View {
        CheckOutView(order: Order())
    }
}

//
//  ContentView.swift
//  ShenZhou
//
//  Created by wjn on 2020/7/13.
//  Copyright © 2020 wjn. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    let plans: [Plan] = Bundle.main.decode("plans.json")
    
    var body: some View {
        NavigationView {
            List(plans) { plan in
                NavigationLink(destination: PlanView(plan: plan)) {
                    Image(plan.imageName)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 44, height: 44)
                    
                    VStack(alignment: .leading, spacing: 10) {
                        Text(plan.name)
                        Text(plan.launchDate)
                    }
                }
            }
        .navigationBarTitle("神舟任务")
        }
        
    }
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

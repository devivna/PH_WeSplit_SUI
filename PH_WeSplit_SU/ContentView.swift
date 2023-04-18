//
//  ContentView.swift
//  PH_WeSplit_SU
//
//  Created by Students on 17.02.2023.
//

import SwiftUI

struct ContentView: View {
    let priviousTextTextField = "0"
    @State private var amount = 0.0
    @State private var numberOfPeople = 2 // 2...10 => 2 = 3 place in array
    @State private var percent = 0 // percents[0]
    
    let percents = [10, 15, 20, 25, 0]
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Amount", value: $amount, format: .currency(code: Locale.current.currencyCode ?? "UAH"))
                        .keyboardType(.decimalPad)
                        
                    
                    Picker("Number of people", selection: $numberOfPeople ) {
                        ForEach(2..<11) { number in
                            Text("\(number) people")
                        }
                    }
                }
                
                Section(content: {
                    Picker(selection: $percent, label: Text("")) {
                        ForEach(percents, id: \.self) { number in
                            Text(number, format: .percent)
                        }
                    }
                    .pickerStyle(.segmented)
                }, header: {
                    Text("How much tip do you want to leave?")
                })
                
                Section {
                    Text(amount, format: .currency(code: Locale.current.currencyCode ?? "UAH"))
                    
                    Text(calculateAmount())
                }
                
                .navigationTitle("WeSplit")
                .navigationBarTitleDisplayMode(.large)
            }
        }
    }
    
    func calculateAmount() -> String {

//        if !amount.isEmpty {
//            let totalAmount = (Double(amount) ?? 0) * (1 + Double(percent) / 100)
//            let amountPerPerson = totalAmount / Double(picker)
//            return "\(amountPerPerson)"
//        }
        
        return "$\(0.0)"
        // return "$\(amount)"
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//
//  ContentView.swift
//  PH_WeSplit_SU
//
//  Created by Students on 17.02.2023.
//

import SwiftUI

struct ContentView: View {
    let priviousTextTextField = "0"
    @State private var textTextField: String = "0"
    @State private var picker = 2
    @State private var percent = 0 // percents[0]
    
    let percents = [10, 15, 20, 25, 0]
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField(priviousTextTextField, text: $textTextField)
                    Picker("Number of people", selection: $picker) {
                        ForEach(2..<11) { number in
                            Text("\(number) people")
                                .tag(number)
                        }
                    }
                }
                
                Section(content: {
                    Picker(selection: $percent, label: Text("")) {
                        ForEach(percents, id: \.self) { number in
                            Text(number, format: .percent)
                                .tag(number)
                        }
                    }
                    .pickerStyle(.segmented)
                }, header: {
                    Text("How much tip do you want to leave?")
                })
                
                Section {
                    Text(calculateAmount())
                    // textTextField
                    // picker.description
                    // percent.description
                }
                
                .navigationTitle("WeSplit")
                .navigationBarTitleDisplayMode(.large)
            }
        }
    }
    
    func calculateAmount() -> String {

        if !textTextField.isEmpty {
            let totalAmount = (Double(textTextField) ?? 0) * (1 + Double(percent) / 100)
            let amountPerPerson = totalAmount / Double(picker)
            return "\(amountPerPerson)"
        }
        
        return "$\(0.0)"
        // return "$\(amount)"
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

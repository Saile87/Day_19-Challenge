//
//  ContentView.swift
//  Converter
//
//  Created by Elias Breitenbach on 25.01.23.
//

import SwiftUI

struct ContentView: View {
    var einheiten = ["km", "yard", "feet", "miles"]
    @State private var inputNumber = 0.0
    @State private var outputNumber = 0.0
    @State private var eingabeEinheit = 0
    @State private var ausgabeEinheit = "yard"
    
    var mathematischeRechnung: [Double] {
        
        var km = [Double]()
        km = [inputNumber, inputNumber * 1094, inputNumber * 3281, inputNumber * 0.62]
        return km
        
//        let kmInYard = inputNumber * 1094
//        let kmInFeet = inputNumber * 3281
//        let kmInMiles = inputNumber * 0.62
//
//        let yardInKm = inputNumber / 1094
//        let yardInFeet = inputNumber * 3
//        let yardInMiles = inputNumber / 1760
//
//        let feetInKm = inputNumber / 3281
//        let feetInYard = inputNumber / 3
//        let feetInMiles = inputNumber / 5280
        
    }
    var body: some View {
        Form {
            Section {
                TextField("Input", value: $inputNumber, format: .number)
                
                Section {
                    Picker("Input", selection: $eingabeEinheit) {
                        ForEach(0..<einheiten.count, id: \.self) { value in
                            Text(einheiten[value])
                        }
                    }
                    .pickerStyle(.segmented)
                }
            }
            Section {
                let kilometer = mathematischeRechnung[3]
                Text(kilometer, format: .number)
            }
            Section {
                Picker("Output", selection: $ausgabeEinheit) {
                    ForEach(einheiten, id: \.self) {
                        Text($0)
                    }
                }
                .pickerStyle(.segmented)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

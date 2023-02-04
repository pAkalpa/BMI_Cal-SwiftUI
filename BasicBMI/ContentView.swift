//
//  ContentView.swift
//  BasicBMI
//
//  Created by Pasindu Akalpa on 2/4/23.
//

import SwiftUI

struct ContentView: View {
    @State private var weightText: String = ""
    @State private var heightText: String = ""
    @State private var bmi: Double = 0
    
    var body: some View {
        VStack {
            Text("BMI Calculator: ")
                .font(.largeTitle)
            TextField("Enter Weight (in kilograms)", text: $weightText)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .border(Color.black)
            TextField("Enter Height (in meters)", text: $heightText)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .border(Color.black)
            Button {
                let weight = Double(self.weightText)!
                let height = Double(self.heightText)!
                self.bmi = weight/(height * height)
            } label: {
                Text("Calculate BMI")
                    .padding()
                    .foregroundColor(Color.white)
                    .background(Color.blue)
            }
            Text("BMI: \(bmi)")
                .font(.title)
                .padding()
        }.padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
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
    @State private var classificationText: String = ""
    
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
                var weight: Double = 0
                var height: Double = 0
                
                if let weightDouble = Double(self.weightText) {
                    weight = weightDouble
                }
                
                if let heightDouble = Double(self.heightText) {
                    height = heightDouble
                }
                
                self.bmi = weight/(height * height)
                
                if (self.bmi < 18.5) {
                    self.classificationText = "Underweight"
                } else if (self.bmi < 24.9) {
                    self.classificationText = "Healthy weight"
                } else if (self.bmi < 29.9) {
                    self.classificationText = "Overweight"
                } else {
                    self.classificationText = "Obese"
                }
            } label: {
                Text("Calculate BMI")
                    .padding()
                    .foregroundColor(Color.white)
                    .background(Color.blue)
                    .tint(.black)
            }
            Text("BMI: \(bmi, specifier: "%.1f"), \(classificationText)")
                .font(.title)
                .padding()
        }.padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        ZStack {
            Color(.black)
            ContentView().environment(\.colorScheme, .dark)
        }
    }
}

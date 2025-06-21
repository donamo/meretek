//
//  ContentView.swift
//  meretek
//
//  Created by Szabo Ambrus on 2025. 06. 21..
//
import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = MeasurementViewModel()

    @State private var chest = ""
    @State private var waist = ""
    @State private var thigh = ""
    @State private var calf = ""

    @MainActor internal var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            HStack{
                VStack{
                    
                    Text("Új mérés")
                        .font(.title)
                    
                    HStack {
                        Text("Mellkas (cm):")
                        TextField("pl. 100", text: $chest)
                            .frame(width: 100)
                    }
                    
                    HStack {
                        Text("Derék (cm):")
                        TextField("pl. 85", text: $waist)
                            .frame(width: 100)
                    }
                    
                    HStack {
                        Text("Comb (cm):")
                        TextField("pl. 60", text: $thigh)
                            .frame(width: 100)
                    }
                    
                    HStack {
                        Text("Vádli (cm):")
                        TextField("pl. 40", text: $calf)
                            .frame(width: 100)
                    }
                    
                    Button("Mentés") {
                        print("Mentve: \(chest), \(waist), \(thigh), \(calf)")
                        if let c = Double(chest),
                           let w = Double(waist),
                           let t = Double(thigh),
                           let ca = Double(calf) {
                            viewModel.addEntry(chest: c, waist: w, thigh: t, calf: ca)
                            chest = ""; waist = ""; thigh = ""; calf = ""
                        }
                    }
                    .padding(.top, 10)
                    
                    Spacer()
                }
                VStack {
                    TableView(entries: viewModel.entries)
                }
            }
        }
        .padding()
        .frame(width: 400)
    }
}

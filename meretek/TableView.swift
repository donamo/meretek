//
//  TableView.swift
//  meretek
//
//  Created by Szabo Ambrus on 2025. 06. 21..
//


import SwiftUI

struct TableView: View {
    var entries: [MeasurementEntry]

    let columns = [
        GridItem(.flexible()), // Dátum
        GridItem(.flexible()), // Mellkas
        GridItem(.flexible()), // Derék
        GridItem(.flexible()), // Comb
        GridItem(.flexible())  // Vádli
    ]

    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, alignment: .leading, spacing: 10) {
                // Fejléc
                Text("Dátum").bold()
                Text("Mellkas").bold()
                Text("Derék").bold()
                Text("Comb").bold()
                Text("Vádli").bold()

                // Tartalom
                ForEach(entries) { entry in
                    Text(entry.date.formatted(date: .abbreviated, time: .omitted))
                    Text(String(format: "%.1f", entry.chest))
                    Text(String(format: "%.1f", entry.waist))
                    Text(String(format: "%.1f", entry.thigh))
                    Text(String(format: "%.1f", entry.calf))
                }
            }
            .padding()
        }
    }
}

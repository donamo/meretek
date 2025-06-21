//
//  MeasurementViewModel.swift
//  meretek
//
//  Created by Szabo Ambrus on 2025. 06. 21..
//


import Foundation

class MeasurementViewModel: ObservableObject {
    @Published var entries: [MeasurementEntry] = []
    
    func addEntry(chest: Double, waist: Double, thigh: Double, calf: Double) {
        let newEntry = MeasurementEntry(
            date: Date(),
            chest: chest,
            waist: waist,
            thigh: thigh,
            calf: calf
        )
        entries.insert(newEntry, at: 0)
        saveEntries()
    }

    // Mentés és betöltés UserDefaults-ben (egyszerű helyi tárolás)
    func saveEntries() {
        if let data = try? JSONEncoder().encode(entries) {
            UserDefaults.standard.set(data, forKey: "entries")
        }
    }
    
    func loadEntries() {
        if let data = UserDefaults.standard.data(forKey: "entries"),
           let saved = try? JSONDecoder().decode([MeasurementEntry].self, from: data) {
            self.entries = saved
        }
    }
    
    init() {
        loadEntries()
    }
}

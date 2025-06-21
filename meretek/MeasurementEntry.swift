//
//  MeasurementEntry.swift
//  meretek
//
//  Created by Szabo Ambrus on 2025. 06. 21..
//


import Foundation

struct MeasurementEntry: Identifiable, Codable {
    var id = UUID()
    var date: Date
    var chest: Double
    var waist: Double
    var thigh: Double
    var calf: Double
}

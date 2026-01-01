//
//  MacrosResponse.swift
//  MyHealth
//
//  Created by Iqbal Alhadad on 01/01/26.
//

import Foundation
import SwiftUI

struct MacrosResponse: Identifiable {
    var id = UUID()
    var title: String
    var totalCalories: String
    var remainingGram: String
    var totalGram: String
    var color: Color
    var totalProgressBar: Double
}

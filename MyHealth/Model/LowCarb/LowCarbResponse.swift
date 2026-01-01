//
//  LowCarbResponse.swift
//  MyHealth
//
//  Created by Iqbal Alhadad on 01/01/26.
//

import Foundation
import SwiftUI

struct LowCarbResponse: Identifiable {
    var id = UUID()
    var title: String
    var totalCalories: String
    var totalGram: String
    var color: Color
    var totalProgressBar: Double
}

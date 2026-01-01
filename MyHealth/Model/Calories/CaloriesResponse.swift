//
//  CaloriesResponse.swift
//  MyHealth
//
//  Created by Iqbal Alhadad on 30/12/25.
//

import Foundation
import SwiftUI

struct CaloriesResponse: Identifiable {
    var id = UUID()
    var title: String
    var icon: String
    var totalCalories: String
    var color:Color
}

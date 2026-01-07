//
//  CircularProgressBarMacros.swift
//  MyHealth
//
//  Created by Iqbal Alhadad on 07/01/26.
//

import SwiftUI

struct CircularProgressBarMacros: View {
    var progress,size: CGFloat
    var totalCalories,totalgram:String
    var color:Color
    var body: some View {
        ZStack {
            Circle()
                .stroke(Color.gray.opacity(0.2), lineWidth: 8)
                .frame(width: size, height: size)
            
            Circle()
                .trim(from: 0, to:progress)
                .stroke(color, lineWidth: 8)
                .rotationEffect(.degrees(-90))
                .frame(width:size, height: size)
            
            VStack (spacing:0){
                Text(totalCalories)
                    .font(.title3)
                    .fontWeight(.semibold)
                Text(totalgram)
                    .font(.subheadline)
                    .foregroundStyle(.black.opacity(0.6))
                
            }
        }
    }
}

#Preview {
    CircularProgressBarMacros(progress: 80, size: 150, totalCalories: "50", totalgram: "10", color: .blue)
}

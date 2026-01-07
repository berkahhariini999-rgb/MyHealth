//
//  LineHorizontalProgressBar.swift
//  MyHealth
//
//  Created by Iqbal Alhadad on 07/01/26.
//

import SwiftUI

struct LineHorizontalProgressBar: View {
    var progress: CGFloat
    var title,totalCalories,totalGram:String
    var color:Color
    
    var body: some View {
        VStack (spacing:14){
            // title
            HStack {
                Text(title)
                Spacer()
                Text(totalCalories)
                    .fontWeight(.semibold) + Text("/\(totalGram)").foregroundStyle(.black.opacity(0.6))
            }
            .font(.subheadline)
            ZStack (alignment: .leading) {
                Capsule()
                    .fill(Color.gray.opacity(0.2))
                    .frame(height: 10)
                Capsule()
                    .fill(color)
                    .frame(width: UIScreen.main.bounds.width * progress, height: 10)
                
            }
        }
    }
}

#Preview {
    LineHorizontalProgressBar(progress: 0.7, title: HeartHealthyData[0].title, totalCalories: "800", totalGram: "100g", color: .red)
}

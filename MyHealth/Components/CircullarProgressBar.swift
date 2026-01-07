//
//  CircullarProgressBar.swift
//  MyHealth
//
//  Created by Iqbal Alhadad on 07/01/26.
//
import SwiftUI

struct CircullarProgressBar: View {
    var progress: CGFloat
    var remainingValue: Int
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(Color.gray.opacity(0.2), lineWidth: 10)
                .frame(width: 140, height: 140)
            
            Circle()
                .trim(from:0, to: progress)
                .stroke(LinearGradient(gradient: Gradient(colors: [Color.blue, Color.yellow]), startPoint: .leading, endPoint: .trailing), lineWidth: 10)
                .rotationEffect(.degrees(-90))
                .frame(width:140,height: 140)
            
            VStack (spacing:0){
                Text("\(remainingValue)")
                    .font(.title)
                    .fontWeight(.semibold)
                Text("Remaining")
                    .font(.subheadline)
            }
        }
    }
}

#Preview {
    CircullarProgressBar(progress: 80, remainingValue: 5)
}

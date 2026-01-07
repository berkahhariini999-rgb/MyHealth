//
//  HomeView.swift
//  MyHealth
//
//  Created by Iqbal Alhadad on 01/01/26.
//

import SwiftUI
import Combine

struct HomeView: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing:20){
                    //today slides
                    //steps and exercise
                    //discover
                   TabViewContentView()
                   StepAndExerciseView()
                   DiscoverView()
                
                    
                }
                .padding()
                
                
            }
            .navigationBarTitleDisplayMode(.inline)
            .background(Color.white)
            .toolbar {
                ToolbarItem (placement: .principal) {
                    HStack {
                        Button {
                            
                        } label : {
                            ZStack {
                                Circle()
                                    .fill(Color.blue)
                                    .frame(width: 40,height: 40)
                                Image(systemName: "person.fill")
                                    .foregroundStyle(.white)
                            }
                        }
                        Spacer()
                        Text("My Health")
                            .font(.title3)
                            .fontWeight(.semibold)
                            .foregroundStyle(Color.blue)
                        Spacer()
                        
                        Button {
                            
                        } label : {
                            Image(systemName: "bell")
                                .foregroundStyle(.black)
                                .fontWeight(.semibold)
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    HomeView()
}

struct TabViewContentView:View {
    @State var selectedIndex = 3
    var body: some View {
        //title and edit button
        VStack (spacing: 10) {
            HStack {
                Text("Today")
                    .font(.title)
                    .fontWeight(.semibold)
                Spacer()
                Button {
                    
                }label:{
                    Text("Edit")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .padding(.horizontal, 14)
                        .padding(.vertical, 2)
                        .background(Color.blue)
                        .foregroundStyle(Color.white)
                        .clipShape(Capsule())
                    
                }
            }
            
            
            
            //slides item
            // indicator dot
            TabView(selection: $selectedIndex){
                CaloriesView()
//                Rectangle()
//                    .fill(.red)
//                    .frame(height:280)
                   .tag(0)
                MacrosView()
//                Rectangle()
//                    .fill(.green)
//                    .frame(height:280)
                    .tag(1)
                HeartHealthyView()
//                Rectangle()
//                    .fill(.blue)
//                    .frame(height:280)
                    .tag(2)
                LowCarbView()
//                Rectangle()
//                    .fill(.yellow)
//                    .frame(height:280)
                    .tag(3)
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            .frame(height: 280)
            
            HStack {
                ForEach(0..<4, id: \.self) { index in
                    Circle()
                        .fill(index == selectedIndex ? Color.blue : .gray.opacity(0.5) )
                        .frame(width: 10,height: 10)
                        .padding(5)
                }
            }
        }
    }
    
    
    
    struct CaloriesView:View {
        var caloriesDatas: [CaloriesResponse] = caloriesData
        var body: some View {
            VStack (spacing:20) {
                //title and sub title
                VStack(spacing:0){
                    Text("Calories")
                        .font(.title2)
                        .fontWeight(.semibold)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Text("Remaining = Goal - Food + Exercise")
                        .font(.subheadline)
                        .foregroundStyle(.black.opacity(0.6))
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                //content chart, and list
                HStack(spacing:40){
                    CircullarProgressBar(progress: 0.7, remainingValue: 806)
                        .padding(.leading)
                    VStack(spacing:14){
                        ForEach(caloriesData) { calories in
                            CaloriesRowView(calories: calories)
                            
                        }
                    }
                }
                
            }
            .padding(.horizontal, 20)
            .padding(.top, 14)
            .padding(.bottom, 24)
            .frame(maxWidth: .infinity)
            .frame(height: 280)
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .shadow(color: .gray.opacity(0.15), radius: 5)
        }
    }
    
    struct CaloriesRowView:View {
        var calories:CaloriesResponse
        var body: some View {
            HStack (spacing:16){
                //icon
                Image(systemName: calories.icon)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 15, height: 15)
                    .foregroundStyle(calories.color)
                //content
                VStack (alignment: .leading, spacing: -2) {
                    Text(calories.title)
                        .font(.subheadline)
                    Text(calories.totalCalories)
                        .font(.subheadline)
                        .fontWeight(.semibold)
                    
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
    
    struct MacrosView:View {
        var macrosDatas:[MacrosResponse] = macrosData
        var body: some View {
            VStack (spacing:10) {
                //title
                Text("Macros")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .frame(maxWidth: .infinity, alignment: .leading)
                Spacer()
                //list charts items
                HStack (spacing:30){
                    ForEach(macrosData) {
                        macros in
                        MacrosRowView(macros: macros)
                    }
                }
                
            }
            .padding(.horizontal, 20)
            .padding(.top, 20)
            .padding(.bottom, 30)
            .frame(maxWidth: .infinity)
            .frame(height: 280)
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .shadow(color: .gray.opacity(0.15),radius: 5)
        }
        
    }
    
    struct MacrosRowView:View {
        var macros:MacrosResponse
        var body: some View {
            VStack (spacing:14){
                // title
                Text(macros.title)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundStyle(macros.color)
                    .lineLimit(1)
                // chart
                CircularProgressBarMacros(progress: macros.totalProgressBar, size: 90, totalCalories: macros.totalCalories, totalgram: "/\(macros.totalGram)", color: macros.color)
                // sub title
                Text(macros.remainingGram)
                    .font(.subheadline)
                    .foregroundStyle(.black.opacity(0.6))
                
            }
        }
        
    }
    
    struct HeartHealthyView:View {
        var heartHealthyDatas: [HeartHealthyResponse] = HeartHealthyData
        var body: some View {
            VStack (spacing:10) {
                Text("Heart Healthy")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .frame(maxWidth: .infinity, alignment: .leading)
                Spacer()
                //list line chart item
                VStack (spacing:20) {
                    ForEach(HeartHealthyData) {
                        heart in
                        LineHorizontalProgressBar(progress: heart.totalProgressBar, title: heart.title, totalCalories: heart.totalCalories, totalGram: heart.totalGram, color: heart.color)
                    }
                    
                }
                
            }
            .padding(.horizontal, 20)
            .padding(.top, 20)
            .padding(.bottom, 30)
            .frame(maxWidth: .infinity)
            .frame(height: 280)
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .shadow(color: .gray.opacity(0.15), radius: 5)
            
        }
    }
  
    
    
    struct LowCarbView:View {
        var lowCarbDatas: [LowCarbResponse] = LowCarbData
        var body: some View {
            VStack (spacing:10) {
                Text("Low Carb")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .frame(maxWidth: .infinity, alignment: .leading)
                Spacer()
                //list line chart item
                VStack (spacing:20) {
                    ForEach(lowCarbDatas) {
                        lowCarb in
                        LineHorizontalProgressBar(progress: lowCarb.totalProgressBar, title: lowCarb.title, totalCalories: lowCarb.totalCalories, totalGram: lowCarb.totalGram, color: lowCarb.color)
                    }
                    
                }
                
            }
            .padding(.horizontal, 20)
            .padding(.top, 20)
            .padding(.bottom, 30)
            .frame(maxWidth: .infinity)
            .frame(height: 280)
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .shadow(color: .gray.opacity(0.15), radius: 5)
            
        }
    }
    
    
  
}






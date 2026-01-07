//
//  StepAndExerciseView.swift
//  MyHealth
//
//  Created by Iqbal Alhadad on 07/01/26.
//

import SwiftUI

struct StepAndExerciseView:View {
        var width = (UIScreen.main.bounds.width - 45) / 2
        var body: some View {
            HStack {
                // step
                VStack (alignment: .leading, spacing: 4) {
                    Text("Steps")
                        .font(.headline)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    // content
                    VStack (alignment: .leading, spacing: 10){
                        HStack (spacing:16) {
                          Image(systemName: "shoe.fill")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 14, height: 14)
                                .foregroundStyle(Color.pink)
                            Text("449")
                                .font(.title3)
                                .fontWeight(.semibold)
                        }
                        .padding(.leading, 10)
                        .padding(.bottom, -6)
                        
                        // text
                        Text("Goal: 10, 000 steps")
                            .font(.footnote)
                            .foregroundStyle(.black.opacity(0.7))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        //line progress bar
                        ZStack (alignment: .leading){
                            Capsule()
                                .fill(Color.gray.opacity(0.2))
                                .frame(height:8)
                            Capsule()
                                .fill(Color.pink)
                                .frame(width: 50,height:8)
                        }
                        
                    }
                    
                }
                .padding(.horizontal, 20)
                .padding(.top, 14)
                .padding(.bottom, 24)
                .frame(width: width)
                .frame(height: 140)
                .background(.white)
                .clipShape(RoundedRectangle(cornerRadius: 12))
                .shadow(color: .gray.opacity(0.1),radius: 5)
                
                //exercise
                Spacer()
                VStack ( spacing: 4) {
                    HStack {
                        Text("Exercise")
                            .font(.headline)
                        Spacer()
                        Image(systemName: "plus")
                            .fontWeight(.semibold)
                    }
                    VStack (spacing:8) {
                        HStack (spacing:12) {
                            Image(systemName: "flame.fill")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 16,height: 16)
                                .foregroundStyle(Color.yellow)
                            Text("215 cal")
                                .font(.title3)
                                .fontWeight(.semibold)
                            Spacer()
                            
                        }
                        HStack(spacing:12) {
                            Image(systemName: "checkmark.circle")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 19,height: 19)
                                .foregroundStyle(Color.yellow)
                            Text("00:25 hr")
                                .font(.title3)
                                .fontWeight(.semibold)
                            Spacer()
                                
                            
                        }
                        
                    }
                }
                .padding(.horizontal, 20)
                .padding(.top, 14)
                .padding(.bottom, 24)
                .frame(width: width)
                .frame(height: 140)
                .background(.white)
                .clipShape(RoundedRectangle(cornerRadius: 12))
                .shadow(color: .gray.opacity(0.1),radius: 5)
                
            }
        }
    }

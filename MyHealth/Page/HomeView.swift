//
//  HomeView.swift
//  MyHealth
//
//  Created by Iqbal Alhadad on 01/01/26.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                
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

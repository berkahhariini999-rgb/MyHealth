//
//  DiscoverView.swift
//  MyHealth
//
//  Created by Iqbal Alhadad on 07/01/26.
//

import SwiftUI

struct DiscoverView: View {
    var discoverDatas: [DiscoverResponse] = discoverData
    // columns
    let columns = [
        GridItem(.flexible(), spacing: 10),
        GridItem(.flexible(), spacing: 10)
    ]
    var body: some View {
        VStack(spacing:14) {
            // title
            Text("Discover")
                .font(.title2)
                .fontWeight(.semibold)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            // list
            LazyVGrid(columns: columns, spacing: 10) {
                ForEach(discoverDatas) {
                    discover in
                    DiscoverRowView(discover: discover)
                }
            }
            
            // last item
            LastDiscoverView(discover: lastDiscoverData)
        }
    }
    
    struct DiscoverRowView: View {
        var discover: DiscoverResponse
        var width = (UIScreen.main.bounds.width - 45) / 2
        var body: some View {
            VStack (spacing:10) {
                // icon
                ZStack {
                    Circle()
                        .fill(Color.blue)
                        .frame(width: 44, height: 44)
                    Image(systemName: discover.icon)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 15,height: 15)
                        .foregroundStyle(Color.white)
                        .fontWeight(.semibold)
                }
                VStack (spacing:0) {
                    Text(discover.title)
                        .font(.headline)
                    Text(discover.description)
                        .font(.footnote)
                        .foregroundStyle(.black.opacity(0.6))
                }
            }
           
            .padding(.all, 20)
            .frame(width: width)
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .shadow(color: .gray.opacity(0.1),radius: 5)
        }
    }
    
    struct LastDiscoverView:View {
        var discover: DiscoverResponse
        var body: some View {
            VStack {
                // icon
                ZStack {
                    Circle()
                        .fill(Color.blue)
                        .frame(width: 44, height: 44)
                    Image(systemName: discover.icon)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 15,height: 15)
                        .foregroundStyle(Color.white)
                        .fontWeight(.semibold)
                }
                VStack (spacing:0) {
                    Text(discover.title)
                        .font(.headline)
                    Text(discover.description)
                        .font(.footnote)
                        .foregroundStyle(.black.opacity(0.6))
                }
            }
            .padding(.all, 20)
            .frame(width: .infinity)
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .shadow(color: .gray.opacity(0.1),radius: 5)
        }
    }
}

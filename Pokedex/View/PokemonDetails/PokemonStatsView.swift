//
//  PokemonStatsView.swift
//  Pokedex
//
//  Created by Ethan Borrowman on 2/23/21.
//

import SwiftUI

struct PokemonStatsView: View {
    private let gridItems = [GridItem(.flexible()), GridItem(.flexible())]
    private let statFrameWidth = UIScreen.screenWidth * 0.8
    
    var body: some View {
        VStack {
            Text("Stats")
                .fontWeight(.medium)
                .padding(.bottom, 5)
                .font(.system(size: 20))
            HStack(spacing: 10) {
                Text("Height: 68")
                    .fontWeight(.regular)
                Text("Weight: 195")
            }
            
            ForEach(0..<6) { count in
                HStack (alignment: .center, spacing: 15){
                    Text("Stat \(count)")
                        .foregroundColor(.black)
                    ZStack (alignment: .leading) {
                        RoundedRectangle(cornerRadius: 20)
                            .fill(Color.blue.opacity(0.25))
                            .frame(width: statFrameWidth * 0.8, height: 25, alignment: .leading)
                        RoundedRectangle(cornerRadius: 20)
                            .fill(Color.blue)
                            .frame(width: (statFrameWidth * 0.8)/2, height: 25, alignment: .leading)
                    }
                    .background((Color.clear))
                }
            }
        }
        .frame(width: statFrameWidth, alignment: .center)
    }
}

struct PokemonStatsView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonStatsView()
    }
}

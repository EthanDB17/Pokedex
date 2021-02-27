//
//  PokemonStatsView.swift
//  Pokedex
//
//  Created by Ethan Borrowman on 2/23/21.
//

import SwiftUI

struct PokemonStatsView: View {
    private let gridItems = [GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        LazyVGrid (columns: gridItems, spacing: 5) {
            ForEach(0..<6) { count in
                Text("Stat \(count)")
                    .foregroundColor(.black)
                ProgressView(value: Float16(count)/6)
                    .padding([.trailing], 10)
            }
        }
        .frame(width: UIScreen.main.bounds.width * 0.75, height: 200, alignment: .leading)
    }
}

struct PokemonStatsView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonStatsView()
    }
}

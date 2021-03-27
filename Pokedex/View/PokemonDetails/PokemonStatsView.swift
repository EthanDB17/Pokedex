//
//  PokemonStatsView.swift
//  Pokedex
//
//  Created by Ethan Borrowman on 2/23/21.
//

import SwiftUI

struct PokemonStatsView: View {
    private let gridItems = [GridItem(.flexible()), GridItem(.flexible())]
    private let statFrameWidth = UIScreen.screenWidth * 0.85
    private var statProgressWidth: CGFloat
    
    private var pokemonStats: [StatElement]
    private var vm: PokemonStatsVM
    private var height: Int
    private var weight: Int
    
    
    init(stats: [StatElement], height: Int, weight: Int) {
        self.pokemonStats = stats
        self.height = height
        self.weight = weight
        vm = PokemonStatsVM(stats: stats)
        statProgressWidth = statFrameWidth * 0.5
    }
    
    var body: some View {
        VStack {
            Text("Stats")
                .fontWeight(.bold)
                .padding(.bottom, 5)
                .padding(.top, 15)
                .font(.system(size: 20))
            HStack(spacing: 20) {
                Text("Height: \(height)")
                    .fontWeight(.medium)
                Text("Weight: \(weight)")
                    .fontWeight(.medium)
            }
            
            ForEach(0..<vm.pokemonStats.count) { stat in
                HStack (alignment: .center, spacing: 15){
                    Text(vm.pokemonStats[stat].stat.name.capitalized)
                        .foregroundColor(.black)
                        .fontWeight(.medium)
                        .frame(width: statFrameWidth * 0.4, alignment: .leading)
                    Text("\(vm.pokemonStats[stat].baseStat)")
                        .fontWeight(.medium)
                        .frame(width: statFrameWidth * 0.1, alignment: .trailing)
                    ZStack (alignment: .leading) {
                        RoundedRectangle(cornerRadius: 20)
                            .fill(Color(UIColor.lightGray).opacity(0.25))
                            .frame(width: statProgressWidth, height: 25, alignment: .leading)
                        RoundedRectangle(cornerRadius: 20)
                            .fill(Color(vm.calculateStatColor(forStatValue: vm.pokemonStats[stat].baseStat)))
                            .frame(width: CGFloat((Float(vm.pokemonStats[stat].baseStat)/200)) * statProgressWidth, height: 25, alignment: .leading)
                    }
                    .background((Color.clear))
                }
            }
        }
        .frame(width: statFrameWidth, alignment: .center)
    }
}


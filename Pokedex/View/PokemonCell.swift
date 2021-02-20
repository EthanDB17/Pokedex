//
//  PokemonCell.swift
//  Pokedex
//
//  Created by Ethan Borrowman on 2/6/21.
//

import SwiftUI
import KingfisherSwiftUI

struct PokemonCell: View {
    let pokemon: PokemonOld
    let vm: PokemonVM
    let backgroundColor: Color
    
    init(pokemon: PokemonOld, vm: PokemonVM) {
        self.pokemon = pokemon
        self.vm = vm
        self.backgroundColor = Color(vm.backgroundColor(forType: pokemon.type))
    }
    
    var body: some View {
        ZStack {
            VStack(alignment: .leading) {
                Text(pokemon.name.capitalized)
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding(.top, 8)
                    .padding(.leading)
                
                HStack {
                    Text(pokemon.type.capitalized)
                        .font(.subheadline).bold()
                        .foregroundColor(.white)
                        .padding(.horizontal, 16)
                        .padding(.vertical, 8)
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .fill(Color.white.opacity(0.25))
                        )
                        .frame(width: 100, height: 24)
                    
                    KFImage(URL(string: pokemon.imageUrl))
                        .resizable()
                        .scaledToFit()
                        .frame(width: 68, height: 68)
                        .padding([.bottom, .trailing], 4)
                }
            }
        }
        .background(backgroundColor)
        .cornerRadius(12.0)
        .shadow(color: backgroundColor, radius: 6, x: 0, y: 0)
    }
}

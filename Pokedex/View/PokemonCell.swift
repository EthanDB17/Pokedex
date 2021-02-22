//
//  PokemonCell.swift
//  Pokedex
//
//  Created by Ethan Borrowman on 2/6/21.
//

import SwiftUI

struct PokemonCell: View {
    let pokemon: Pokemon
    let vm: PokemonCellVM
    let backgroundColor: Color
    
    init(pokemon: Pokemon) {
        self.pokemon = pokemon
        self.vm = PokemonCellVM(pokemon: pokemon)
        self.backgroundColor = Color(vm.getCellBackgroundColor())
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
                    Text(vm.getPokemonType())
                        .font(.subheadline).bold()
                        .foregroundColor(.white)
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .fill(Color.white.opacity(0.25))
                                .frame(width: 86, height: 48)
                        )
                        .frame(width: 100, height: 55)
                        .lineLimit(nil)
                        .multilineTextAlignment(.center)
                    
                    Image(String(pokemon.id))
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

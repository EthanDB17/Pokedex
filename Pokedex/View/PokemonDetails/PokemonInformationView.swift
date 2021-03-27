//
//  PokemonInformationView.swift
//  Pokedex
//
//  Created by Ethan Borrowman on 2/26/21.
//

import SwiftUI

struct PokemonInformationView: View {
    @ObservedObject var detailsVM: PokemonDetailVM
        
    init(vm: PokemonDetailVM) {
        self.detailsVM = vm
    }
    
    var body: some View {
        VStack
        {
            if (detailsVM.pokemonSpecies != nil) {
                Text(detailsVM.pokemon.name.capitalized)
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(.black)
                    .padding([.top, .bottom], 15)
                
                Text(detailsVM.getPokemonType())
                    .font(.subheadline).bold()
                    .foregroundColor(.white)
                    .padding(8)
                    .background(Color(PokemonHelper.GetTypeColor(forPokemon: detailsVM.pokemon)).opacity(0.75))
                    .cornerRadius(20)
                
                if let species = detailsVM.pokemonSpecies {
                    if let description = species.flavorTextEntries.first(where: { $0.language.name == "en" }) {
                        Text(description.flavorText.replacingOccurrences(of: "\n", with: " "))
                            .padding([.leading, .trailing], 20)
                    }
                }
                
                PokemonStatsView(stats: detailsVM.pokemon.stats, height: detailsVM.pokemon.height, weight: detailsVM.pokemon.weight)
            } else {
                ProgressView("Loading \(detailsVM.pokemon.name.capitalized) Details...")
                    .frame(width: UIScreen.screenWidth/2, height: UIScreen.screenHeight/4, alignment: .center)
            }
        }
        .background(Color(.white))
    }
}

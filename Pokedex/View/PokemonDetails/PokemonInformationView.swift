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
                
    //            if let species = detailsVM.pokemonSpecies {
    //                Text(species.flavorTextEntries.first?.flavorText ?? "Desc")
    //            }
    //            else {
    //                Text("Loading...")
    //            }
                
                Text("Spits fire that is hot enough to melt boulders. Known to cause forest fires unintentionally.")
                    .padding(.top, 8)
                    .padding([.leading, .trailing], 15)
                
                PokemonStatsView()
            } else {
                ProgressView("Loading \(detailsVM.pokemon.name.capitalized) Details...")
            }
        }
        .background(Color(.white))
    }
}

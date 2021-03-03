//
//  PokedexView.swift
//  Pokedex
//
//  Created by Ethan Borrowman on 2/8/21.
//

import SwiftUI

struct PokedexView: View {
    private let gridItems = [GridItem(.flexible()), GridItem(.flexible())]
    @ObservedObject var vm = PokemonVM()
    
    var body: some View {
        if (vm.loadingPokemon) {
            ProgressView("Loading Pokemon...")
        } else {
            NavigationView {
                ScrollView {
                    LazyVGrid(columns: gridItems, spacing: 16) {
                        ForEach(vm.pokemon) { pokemon in
                            NavigationLink(destination: PokemonDetailView()) {
                                PokemonCell(pokemon: pokemon)
                            }
                        }
                    }
                }
                .navigationTitle("Pokemon")
            }
        }
    }
}

struct PokedexView_Previews: PreviewProvider {
    static var previews: some View {
        PokedexView()
    }
}

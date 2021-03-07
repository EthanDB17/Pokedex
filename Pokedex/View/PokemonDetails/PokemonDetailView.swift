//
//  PokemonDetailView.swift
//  Pokedex
//
//  Created by Ethan Borrowman on 2/23/21.
//

import SwiftUI

struct PokemonDetailView: View {
    @ObservedObject var detailsVM: PokemonDetailVM
    let pokemon: Pokemon
    let scrollViewHeight = UIScreen.screenHeight * (3/5)
    let background: UIColor
    
    init(pokemon: Pokemon) {
        self.pokemon = pokemon
        detailsVM = PokemonDetailVM(pokemon: self.pokemon)
        self.background = PokemonHelper.GetTypeColor(forPokemon: pokemon)
    }
    
    var body: some View {
        ZStack(alignment: .top) {
            VStack {
                Color(background).edgesIgnoringSafeArea(.all)
                    .frame(width: UIScreen.screenWidth, height: (UIScreen.screenHeight * 0.6), alignment: .top)
                Color.white.edgesIgnoringSafeArea(.all)
                    .frame(width: UIScreen.screenWidth, height: (UIScreen.screenHeight * 0.4), alignment: .bottom)
            }
            
            ScrollView
            {
                VStack(alignment: .center)
                {
                    Image("\(pokemon.id)")
                        .resizable()
                        .frame(width: 300, height: 300, alignment: .top)
                        .padding(.top, 15)
                        .padding(.bottom, -35)
                        .zIndex(1)
                    
                    PokemonInformationView(vm: detailsVM)
                        .frame(width: UIScreen.screenWidth + 30, alignment: .center)
                        .background(Color(.white))
                        .cornerRadius(48.0)
                }
                .edgesIgnoringSafeArea(.bottom)
            }
        }
        .onAppear(perform: {
            detailsVM.fetchPokemonSpecies()
        })
    }
}

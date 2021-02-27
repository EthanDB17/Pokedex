//
//  PokemonDetailView.swift
//  Pokedex
//
//  Created by Ethan Borrowman on 2/23/21.
//

import SwiftUI

struct PokemonDetailView: View {
    //let pokemon: Pokemon
    var body: some View {
        ZStack (alignment: .leading) {
            Color(UIColor.red)
                .edgesIgnoringSafeArea(.all)
            
            ScrollView
            {
                VStack(){
                    Image("6")
                        .resizable()
                        .frame(width: 300, height: 300, alignment: .center)
                    
                    PokemonInformationView()
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .background(Color(.white))
                        .cornerRadius(48.0)
                }
                .frame(maxWidth: .infinity, alignment: .top)
            }
        }
    }
}

struct PokemonDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonDetailView()
    }
}

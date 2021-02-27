//
//  PokemonInformationView.swift
//  Pokedex
//
//  Created by Ethan Borrowman on 2/26/21.
//

import SwiftUI

struct PokemonInformationView: View {
    var body: some View {
        VStack
        {
            Text("Charizard")
                .font(.largeTitle)
                .bold()
                .foregroundColor(.black)
            
            PokemonStatsView()
        }
        .background(Color(.white))
    }
}

struct PokemonInformationView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonInformationView()
    }
}

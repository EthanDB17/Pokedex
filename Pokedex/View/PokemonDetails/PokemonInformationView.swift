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
                .padding(.top, 15)
            
            Text("Fire / Flying")
                .font(.subheadline).bold()
                .foregroundColor(.white)
                .padding(8)
                .background(Color.red.opacity(0.75))
                .cornerRadius(20)
            
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

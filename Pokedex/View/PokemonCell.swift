//
//  PokemonCell.swift
//  Pokedex
//
//  Created by Ethan Borrowman on 2/6/21.
//

import SwiftUI

struct PokemonCell: View {
    var body: some View {
        ZStack {
            VStack {
                Text("Bulbasaur")
                
                HStack {
                    Text("Poison")
                    Image("Bulbasaur")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 68, height: 68)
                }
            }
        }
        .background(Color.green)
    }
}

struct PokemonCell_Previews: PreviewProvider {
    static var previews: some View {
        PokemonCell()
    }
}

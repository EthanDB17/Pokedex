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
        ScrollView
        {
            VStack(){
                Image("6")
                    .resizable()
                    .frame(width: 300, height: 300, alignment: .center)
                    .padding([.bottom], -40)
                
                PokemonInformationView()
                    .frame(width: UIScreen.screenWidth + 30)
                    .background(Color(.white))
                    .cornerRadius(48.0)
            }
            .frame(maxWidth: .infinity, alignment: .top)
            .padding(.top, 30)
        }
        .background(Color(.red))
        .edgesIgnoringSafeArea(.all)
    }
}

struct PokemonDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonDetailView()
    }
}

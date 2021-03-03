//
//  PokemonDetailView.swift
//  Pokedex
//
//  Created by Ethan Borrowman on 2/23/21.
//

import SwiftUI

struct PokemonDetailView: View {
    //let pokemon: Pokemon
    let scrollViewHeight = UIScreen.screenHeight * (3/5)
    var body: some View {
        ZStack(alignment: .top) {
            Color.red
                .edgesIgnoringSafeArea(.all)
            
            ScrollView
            {
                VStack(alignment: .center)
                {
                    Image("6")
                        .resizable()
                        .frame(width: 300, height: 300, alignment: .top)
                        .padding(.top, 20)
                        .padding(.bottom, -60)
                        .zIndex(1)
                    
                    PokemonInformationView()
                        .frame(width: UIScreen.screenWidth + 30, alignment: .center)
                        .background(Color(.white))
                        .cornerRadius(48.0)
                }
                .edgesIgnoringSafeArea(.bottom)
            }
        }
    }
}

struct PokemonDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonDetailView()
    }
}

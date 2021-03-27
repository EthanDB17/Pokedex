//
//  PokemonEvolutionView.swift
//  Pokedex
//
//  Created by Ethan Borrowman on 3/26/21.
//

import SwiftUI

struct PokemonEvolutionView: View {
    let nums: [Int] = [4, 5, 6]
    
    var body: some View {
        VStack {
            Text("Evolution Chart")
                .fontWeight(.bold)
                .padding([.top,.bottom], 10)
                .font(.system(size: 20))
            HStack(alignment: .center) {
                ForEach(nums, id: \.self) { num in
                    Image("\(num)")
                        .frame(width: 30, height: 30)
                        .aspectRatio(contentMode: .fit)
                    if (num == 4 || num == 5) {
                        Image("EvolutionArrow")
                            .frame(width: 25, height: 15)
                    }
                }
            }
        }
        
    }
}

struct PokemonEvolutionView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonEvolutionView()
    }
}

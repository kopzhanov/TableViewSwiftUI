//
//  MovieDetails.swift
//  TableViewSwiftUI
//
//  Created by Alikhan Kopzhanov on 14.09.2023.
//

import SwiftUI


struct MovieDetails: View {
    var movie : Movie
    
    var body: some View {
        VStack(spacing: 10.0) {
            Text(movie.name)
                .font(.system(size: 27, weight: .bold))
                .multilineTextAlignment(.center)
            Image(movie.imageAddress)
                .resizable()
                .padding()
                .frame(width:240, height: 360)
                .aspectRatio(contentMode: .fit)
                .clipShape(RoundedRectangle(cornerRadius: 10))
            VStack (alignment: .leading){
                HStack (alignment: .top){
                    Text("Plot:")
                        .font(.headline)
                        .fontWeight(.semibold)
                    Text(movie.desc)
                }
                HStack (alignment: .top){
                    Text("IMDB:")
                        .font(.headline)
                        .fontWeight(.semibold)
                    Text(String(movie.imdb))
                        .foregroundColor(Color.blue)
                }
                .padding(.top, 1.0)
                HStack (alignment: .top){
                    Text("Year:")
                        .font(.headline)
                        .fontWeight(.semibold)
                        .padding(.top, 1.0)
                    Text(String(movie.year))
                }
            }
            .padding([.top, .leading, .trailing])
            Spacer()
        }
    }
}



struct MovieDetails_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetails(movie: Movie(name: "Spider-Man:Across the Spider-Verse", imdb: 0.0, imageAddress: "spiderman", desc: "Miles Morales catapults across the Multiverse, where he encounters a team of Spider-People charged with protecting its very existence. When the heroes clash on how to handle a new threat, Miles must redefine what it means to be a hero.", year: 2023))
    }
}

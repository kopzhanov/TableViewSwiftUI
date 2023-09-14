//
//  ContentView.swift
//  TableViewSwiftUI
//
//  Created by Alikhan Kopzhanov on 14.09.2023.
//

import SwiftUI

struct Movie:Identifiable {
    var id = UUID()
    var name = ""
    var imdb = 0.0
    var imageAddress = ""
    var desc = ""
    var year = 0
}

struct MovieRow:View{
    var movie: Movie
    
    var body: some View{
        HStack{
            Image(movie.imageAddress)
                .resizable()
                .frame(width: 120, height: 200)
                .aspectRatio(contentMode: .fit)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .overlay(RoundedRectangle(cornerRadius: 10)
                    .stroke(.gray))
            VStack (alignment: .leading){
                Text(movie.name)
                    .font(.system(size: 28, weight: .bold))
                Text("IMDB: \(movie.imdb,specifier: "%.1f")")
                    .font(.system(size: 20, weight: .semibold))
                    .foregroundColor(.gray)
            }
        }
    }
}

var movies = [Movie(name: "Inception", imdb: 8.8, imageAddress: "inception", desc: "A thief who steals corporate                      secrets through the use of dream-sharing technology is given the inverse task of planting an idea into the mind of a C.E.O., but his tragic past may doom the project and his team to disaster.", year: 2010),
              Movie(name: "Interstellar", imdb: 8.6, imageAddress: "interstellar", desc: "When Earth becomes uninhabitable in the future, a farmer and ex-NASA pilot, Joseph Cooper, is tasked to pilot a spacecraft, along with a team of researchers, to find a new planet for humans.", year: 2014),
              Movie(name: "The Prestige", imdb: 8.5, imageAddress: "prestige", desc: "After a tragic accident, two stage magicians in 1890s London engage in a battle to create the ultimate illusion while sacrificing everything they have to outwit each other.", year: 2006),
              Movie(name: "Tenet", imdb: 7.3, imageAddress: "tenet", desc: "Armed with only one word, Tenet, and fighting for the survival of the entire world, a Protagonist journeys through a twilight world of international espionage on a mission that will unfold in something beyond real time.", year: 2020),
              Movie(name: "The Gentlemen", imdb: 7.8, imageAddress: "gentlemen", desc: "An American expat tries to sell off his highly profitable marijuana empire in London, triggering plots, schemes, bribery and blackmail in an attempt to steal his domain out from under him.", year: 2019)]

struct ContentView: View {
    var body: some View {
        NavigationView{
            List (movies){item in
                NavigationLink(destination: MovieDetails(movie:item)) { MovieRow(movie: item) }
            }
            .navigationTitle("Movies")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

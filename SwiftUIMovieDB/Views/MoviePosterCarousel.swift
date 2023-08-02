//
//  MoviePosterCarousel.swift
//  SwiftUIMovieDB
//
//  Created by Mekala Vamsi Krishna on 7/31/23.
//

import SwiftUI

struct MoviePosterCarousel: View {
    
    let title: String
    let movies: [Movie]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text(title)
                .font(.title)
                .fontWeight(.bold)
                .padding(.horizontal)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top, spacing: 16) {
                    ForEach(self.movies, id: \.id) { movie in
                        NavigationLink(destination: MovieDetailView(movieId: movie.id)) {
                            MoviePosterCard(movie: movie)
                        }
                        .buttonStyle(PlainButtonStyle())
                        .padding(.leading, movie.id == self.movies.first!.id ? 16 : 0)
                        .padding(.trailing, movie.id == self.movies.last!.id ? 16 : 0)
                    }
                }
            }
        }
    }
}

struct MoviePosterCarousel_Previews: PreviewProvider {
    static var previews: some View {
        MoviePosterCarousel(title: "Now Playing", movies: Movie.stubbedMovies)
    }
}

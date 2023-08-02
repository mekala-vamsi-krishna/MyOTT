//
//  MovieSearchView.swift
//  SwiftUIMovieDB
//
//  Created by Mekala Vamsi Krishna on 8/2/23.
//

import SwiftUI

struct MovieSearchView: View {
    
    @ObservedObject var movieSearchState = MovieSearchState()
    
    var body: some View {
        NavigationView {
            List {
                SearchBar(placeholder: "Search Movies", text: self.$movieSearchState.query)
                    .listRowInsets(EdgeInsets(top: 0, leading: 8, bottom: 0, trailing: 0))
                LoadingView(isLoading: self.movieSearchState.isLoading, error: self.movieSearchState.error) {
                    self.movieSearchState.search(query: self.movieSearchState.query)
                }
                
                if self.movieSearchState.movies != nil {
                    ForEach(self.movieSearchState.movies!) { movie in
                        NavigationLink(destination: MovieDetailView(movieId: movie.id)) {
                            VStack(alignment: .leading) {
                                Text(movie.title)
                                Text(movie.yearText)
                            }
                        }
                    }
                }
            }
            .onAppear(perform: {
                self.movieSearchState.startObserve()
            })
            .navigationTitle("Search")
        }
    }
}

struct MovieSearchView_Previews: PreviewProvider {
    static var previews: some View {
        MovieSearchView()
    }
}

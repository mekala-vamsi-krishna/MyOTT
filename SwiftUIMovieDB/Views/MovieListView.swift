//
//  MovieListView.swift
//  SwiftUIMovieDB
//
//  Created by Mekala Vamsi Krishna on 7/31/23.
//

import SwiftUI

struct MovieListView: View {
    
    @ObservedObject private var nowPlayingState = MovieListState()
    @ObservedObject private var upcomingState = MovieListState()
    @ObservedObject private var topRatedState = MovieListState()
    @ObservedObject private var popularState = MovieListState()
    
    var body: some View {
        NavigationView {
            List {
                if nowPlayingState.movies != nil {
                    MoviePosterCarousel(title: "Now Playing", movies: nowPlayingState.movies!)
                        .listRowInsets(EdgeInsets(top: 16, leading: 0, bottom: 8, trailing: 0))
                } else {
                    LoadingView(isLoading: nowPlayingState.isLoading, error: nowPlayingState.error) {
                        self.nowPlayingState.loadMovies(with: .nowPlaying)
                    }
                }
                
                if upcomingState.movies != nil {
                    MovieBackdropCarouselView(title: "Upcoming", movies: upcomingState.movies!)
                        .listRowInsets(EdgeInsets(top: 8, leading: 0, bottom: 8, trailing: 0))
                } else {
                    LoadingView(isLoading: upcomingState.isLoading, error: upcomingState.error) {
                        self.upcomingState.loadMovies(with: .upcoming)
                    }
                }
                
                if topRatedState.movies != nil {
                    MovieBackdropCarouselView(title: "Top Rated", movies: topRatedState.movies!)
                        .listRowInsets(EdgeInsets(top: 8, leading: 0, bottom: 8, trailing: 0))
                } else {
                    LoadingView(isLoading: topRatedState.isLoading, error: topRatedState.error) {
                        self.topRatedState.loadMovies(with: .topRated)
                    }
                }
                
                
                if popularState.movies != nil {
                    MovieBackdropCarouselView(title: "Popular", movies: popularState.movies!)
                        .listRowInsets(EdgeInsets(top: 8, leading: 0, bottom: 16, trailing: 0))
                } else {
                    LoadingView(isLoading: popularState.isLoading, error: popularState.error) {
                        self.popularState.loadMovies(with: .popular)
                    }
                }
                
            }
            .listStyle(.plain)
            .navigationBarTitle("My OTT")
        }
        .onAppear {
            self.nowPlayingState.loadMovies(with: .nowPlaying)
            self.upcomingState.loadMovies(with: .upcoming)
            self.topRatedState.loadMovies(with: .topRated)
            self.popularState.loadMovies(with: .popular)
        }
    }
}

struct MovieListView_Previews: PreviewProvider {
    static var previews: some View {
        MovieListView()
    }
}

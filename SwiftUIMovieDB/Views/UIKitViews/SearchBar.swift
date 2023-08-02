//
//  SearchBar.swift
//  SwiftUIMovieDB
//
//  Created by Mekala Vamsi Krishna on 8/2/23.
//

import SwiftUI

struct SearchBar: UIViewRepresentable {
    let placeholder: String
    @Binding var text: String
    
    func updateUIView(_ uiView: UISearchBar, context: Context) {
        uiView.text = text
    }
    
    func makeUIView(context: Context) -> UISearchBar {
        let searchbar = UISearchBar()
        searchbar.placeholder = placeholder
        searchbar.searchBarStyle = .minimal
        searchbar.enablesReturnKeyAutomatically = false
        searchbar.delegate = context.coordinator
        return searchbar
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(text: self.$text)
    }
    
    class Coordinator: NSObject, UISearchBarDelegate {
        @Binding var text: String
        init(text: Binding<String>) {
            _text = text
        }
        
        func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
            self.text = searchText
        }
        
        func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
            searchBar.resignFirstResponder()
        }
    }
}


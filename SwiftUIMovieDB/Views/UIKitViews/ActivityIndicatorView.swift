//
//  ActivityIndicatorView.swift
//  SwiftUIMovieDB
//
//  Created by Mekala Vamsi Krishna on 7/31/23.
//

import SwiftUI

struct ActivityIndiatorView: UIViewRepresentable {
    func updateUIView(_ uiView: UIActivityIndicatorView, context: Context) {}
    
    func makeUIView(context: Context) -> UIActivityIndicatorView {
        let view = UIActivityIndicatorView(style: .large)
        view.startAnimating()
        return view
    }
    
}

//
//  HomeViewModel.swift
//  RickAndMorty-SwiftUI
//
//  Created by Alberto on 25/10/22.
//

import Foundation

class HomeViewModel: ObservableObject {
    
    @Published var characters: [Character] = []
}

//
//  HomeView.swift
//  RickAndMorty-SwiftUI
//
//  Created by Alberto on 25/10/22.
//

import SwiftUI
import Kingfisher

struct HomeView: View {
    
    @StateObject var viewModel = HomeViewModel()
    @State var viewDidLoad = false
    var charactersFake: [Character] = [Character(id: 1, name: "Rick", status: .alive, species: .human, type: "sfsdf", gender: .male, origin: .init(name: "sdfsdf", url: "sdfsdfds"), location: .init(name: "adasdada", url: "adasdasda"), image: "https://sm.ign.com/ign_es/feature/h/how-to-wat/how-to-watch-rick-and-morty-season-6-online-release-date-and_h3rf.jpg", episode: ["01","02"], url: "", created: "")]
    
    var body: some View {
        
        NavigationView {
            
            List {
                if let characters = charactersFake {
                    ForEach(characters, id: \.id) { character in
                        HStack {
                            Spacer()
                            CharacterCell(character: character)
                                .background(NavigationLink(destination: Text("hola")){}.opacity(0))
                            Spacer()
                        }
                    }
                }
            }
            .listRowSeparator(.hidden)
            

            .scrollContentBackground(.hidden)
            .background(Color.green.opacity(0.3))
            .refreshable {
                //   viewModel.loadInfo()
            }
            .navigationTitle("Rick and Morty")
            .navigationBarTitleDisplayMode(.automatic)
            .onAppear(perform: {
                if !viewDidLoad {
                    //                    viewModel.loadInfo()
                }
                viewDidLoad = true
            })
            .listStyle(.inset)
            .background(.red)
            
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

struct CharacterCell: View {
    
    @State var character: Character
    
    var body: some View {
        
        ZStack() {
            Circle()
                .foregroundColor(Color.green.opacity(0.3))
            if let urlImageCharacter = URL(string: character.image) {
                KFImage(urlImageCharacter)
                    .resizable()
                    .aspectRatio(1.0, contentMode: .fill)
                    .frame(width: 180, height: 180)
                    .clipShape(Circle())
            } else {
                Circle()
                    .foregroundColor(.gray)
                    .frame(width: 25, height: 25)
                    .padding(.trailing, 2)
            }
            Text("character.name")
                .bold()
                .lineLimit(2)
                .foregroundColor(.white)
                .shadow(radius: 4)
        }
        .frame(width: 200, height: 200)
        .clipShape(Circle())
        .shadow(radius: 4)
    }
}

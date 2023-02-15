//
//  ContentView.swift
//  H4XOR News
//
//  Created by Matthew Cheung on 13/2/2023.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var netowrkManager = NetworkManager()
    
    var body: some View {
        NavigationStack {
            List(netowrkManager.posts){ post in
                NavigationLink{
                    DetailView(url: post.url)
                }label: {
                    HStack{
                        Text(String(post.points))
                        Text(post.title)
                    }
                }
             }
            .listStyle(.plain)
            .navigationTitle("H4XOR NEWS")
         }
        .onAppear {
            self.netowrkManager.fetchData()
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


//
//let posts = [
//    Post(id: "1", title: "Hello"),
//    Post(id: "2", title: "Fuck"),
//    Post(id: "3", title: "Dick")
//]

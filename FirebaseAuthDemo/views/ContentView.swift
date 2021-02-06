//
//  ContentView.swift
//  FirebaseAuthDemo
//
//  Created by Prayag Gediya on 30/01/21.
//

import SwiftUI
import FirebaseAuth

struct ContentView: View {
    var body: some View {
        NavigationView {
            if let _ = Auth.auth().currentUser {
                HomeView()
            } else {
                LoginView()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

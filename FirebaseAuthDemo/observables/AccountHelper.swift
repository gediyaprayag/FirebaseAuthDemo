//
//  AccountHelper.swift
//  FirebaseAuthDemo
//
//  Created by Prayag Gediya on 30/01/21.
//

import Foundation
import FirebaseAuth

class AccountHelper : ObservableObject {
    
    @Published var loading: Bool = false
    @Published var error: (Bool, String) = (false, "")
    
    func createUser(email: String, password: String, username: String) {
        loading = true
        AuthenticationHelper.shared.createUser(email: email, password: password, username: username) { (user, error) in
            self.loading = false
            if let error = error {
                self.error = (true, error.localizedDescription)
                print("Error: \(error.localizedDescription)")
            } else if let user = user {
                print("User: \(user)")
                Navigate.to.homeView()
            } else {
                self.error = (true, "Something went wrong, please try again!")
            }
        }
    }
    
    func login(email: String, password: String) {
        loading = true
        AuthenticationHelper.shared.login(email: email, password: password) { (user, error) in
            self.loading = false
            if let error = error {
                self.error = (true, error.localizedDescription)
                print("Error: \(error.localizedDescription)")
            } else if let user = user {
                print("User: \(user)")
                Navigate.to.homeView()
            } else {
                self.error = (true, "Something went wrong, please try again!")
            }
        }
    }
    
    func resetPassword(email: String) {
        loading = true
        Auth.auth().sendPasswordReset(withEmail: email) { error in
            self.loading = false
            if let error = error {
                self.error = (true, error.localizedDescription)
            } else {
                Navigate.to.loginView()
            }
        }
    }
    
}

//
//  SignUpView.swift
//  FirebaseAuthDemo
//
//  Created by Prayag Gediya on 30/01/21.
//

import SwiftUI

struct SignUpView: View {
    @State var email: String = ""
    @State var password: String = ""
    @State var showAlert: Bool = false
    @State var alertMsg: String = ""
    
    var body: some View {
        VStack(alignment: .trailing) {
            Spacer()
            TextField("Email", text: $email)
                .keyboardType(.emailAddress)
                .padding(12)
                .borderdTextField()
            
            SecureField("Password", text: $password)
                .padding(12)
                .borderdTextField()
            
            Button(action: signUp, label: {
                Text("SignUp")
                    .foregroundColor(.white)
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .frame(height: 50, alignment: .center)
                    .background(Color.black)
                    .cornerRadius(8)
            }).padding(.top, 12)
            
            Spacer()
            
        }.padding()
        .alert(isPresented: $showAlert, content: {
            Alert(title: Text(alertMsg), dismissButton: .default (Text("Okay")) { })
        })
    }
    
    func signUp() {
        if email == "" || !email.isValidEmail() {
            alertMsg = "Enter valid email"
            showAlert = true
        } else if password == "" || password.count < 8 {
            alertMsg = "Password must be 8 characters long."
            showAlert = true
        } else {
            //Signup
        }
    }
    
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}

//
//  LoginPage.swift
//  Padawan Academy
//
//  Created by Tina Nguyen on 4/1/23.
//

import SwiftUI

struct LoginPage: View {
    @State private var username = ""
    @State private var password = ""
    @State var userID = ""
    @State var navigateToDestView:Bool = false
    
    var body: some View {
        ZStack{
            Color.black.ignoresSafeArea()
            VStack {
                        Spacer()
                        
                        Image("PadawanAcademy")
                            .resizable()
                            .frame(width: 291, height: 127)
                            .padding(.bottom, 30)
                        
                        TextField("Username", text: $username)
                            .padding()
                            .background(Color(.systemGray6))
                            .cornerRadius(5.0)
                            .padding(.bottom, 20)
                        
                        SecureField("Password", text: $password)
                            .padding()
                            .background(Color(.systemGray6))
                            .cornerRadius(5.0)
                            .padding(.bottom, 20)

//                NavigationLink(destination: ShowSideBar(userID: $userID))
//                               {
//                                    Text("Log In")
//                                        .foregroundColor(.white)
//                                        .padding()
//                                        .frame(maxWidth: .infinity)
//                                        .background(Color.yellow)
//                                        .cornerRadius(5.0)
//
//                                }
                
                Button("Log In") {
                    Task {
                        try? await userLogin(username: "Email", password: "44444")

                    }
                    navigateToDestView = true
                    
                }
                .task {
                    try? await userLogin(username: "Email", password: "44444")
                }
                .foregroundColor(.white)
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.yellow)
                .cornerRadius(5.0)
                
                NavigationLink(
                    destination: ShowSideBar(userID: $userID),
                                isActive: $navigateToDestView,
                                label: {

                                    
                                }
                )
                                .padding()
                            
                        

                        Spacer()
                        
                        HStack {
                            Text("Don't have an account?")
                                .foregroundColor(Color.white)
                            
                            Button(action: {
                                // TODO: Handle sign-up button press
                            }) {
                                Text("Sign Up")
                                    .foregroundColor(.yellow)
                                    .bold()
                            }
                        }
                        .padding(.bottom, 20)
                    }
                    .padding(.horizontal, 30)
        }
        .navigationBarBackButtonHidden(true)
    }
    
    func userLogin(username: String, password: String) async -> String {
        let parameters = ["email": username, "password": password]
        let jsonData = try! JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted)
        let jsonString = String(data: jsonData, encoding: .utf8)!
        let postData = jsonString.data(using: .utf8)
        
        var request = URLRequest(url: URL(string: "https://8lbmp14qj1.execute-api.us-east-2.amazonaws.com/dev/login")!,timeoutInterval: Double.infinity)
        request.addValue("text/plain", forHTTPHeaderField: "Content-Type")

        request.httpMethod = "POST"
        request.httpBody = postData

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
          guard let data = data else {
            print(String(describing: error))
            return
          }
            self.userID = String(data: data, encoding: .utf8)!
          print(String(data: data, encoding: .utf8)!)
        }

        task.resume()
        return self.userID

    }
}

struct LoginPage_Previews: PreviewProvider {
    static var previews: some View {
        LoginPage()
    }
}

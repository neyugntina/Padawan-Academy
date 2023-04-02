//
//  LoginPage.swift
//  Padawan Academy
//
//  Created by Sarah Eltell on 4/1/23.
//

import SwiftUI

struct LoginPage: View {
    @State var loggedIn = false
    
    var body: some View {
        ZStack{
            Color.black.ignoresSafeArea()
            if self.loggedIn {
                CourseList()
                    .transition(.move(edge: .trailing))
            }
            Button(action: {
                withAnimation {
                    self.loggedIn.toggle()
                }
            })
            {
                if !self.loggedIn{
                    Text("Login")
                    .font(.largeTitle)
                    .frame(width: 100.0, height: 50.0)
                    .foregroundColor(.yellow)
                    .border(.yellow)
                }
            }
        }
    }
}

struct LoginPage_Previews: PreviewProvider {
    static var previews: some View {
        LoginPage()
    }
}

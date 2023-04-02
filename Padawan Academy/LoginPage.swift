//
//  LoginPage.swift
//  Padawan Academy
//
//  Created by Tina Nguyen on 4/1/23.
//

import SwiftUI

struct LoginPage: View {
    var body: some View {
        ZStack{
            Color.black.ignoresSafeArea()
            NavigationLink(destination: ShowSideBar()) {
                Text("Login")
                    .font(.largeTitle)
                    .frame(width: 100.0, height: 50.0)
                    .foregroundColor(.yellow)
                    .border(.yellow)
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct LoginPage_Previews: PreviewProvider {
    static var previews: some View {
        LoginPage()
    }
}

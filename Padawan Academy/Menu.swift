//
//  Hamburger.swift
//  Padawan Academy
//
//  Created by Maria Doan on 4/1/23.
//

import SwiftUI

struct Menu: View {
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Image(systemName: "person")
                    .foregroundColor(.white)
                    .imageScale(.large)
                Text("Account")
                    .foregroundColor(.white)
                    .imageScale(.large)
            }
            .padding(.top, 100)
            HStack {
                NavigationLink(destination: ShowSideBar()) {
                    Image(systemName: "book")
                        .foregroundColor(.white)
                        .imageScale(.large)
                    Text("Courses")
                        .foregroundColor(.white)
                        .imageScale(.large)
                }
            }
            .padding(.top, 30)
            HStack {
                Image(systemName: "gear")
                    .foregroundColor(.white)
                    .imageScale(.large)
                Text("Settings")
                    .foregroundColor(.white)
                    .imageScale(.large)
            }
            .padding(.top, 30)
            HStack {
                NavigationLink(destination: LoginPage()) {
                    Image(systemName: "rectangle.portrait.and.arrow.right")
                        .foregroundColor(.white)
                        .imageScale(.large)
                    Text("Logout")
                        .foregroundColor(.white)
                        .imageScale(.large)
                }
            }
            .padding(.top, 30)
            Spacer()
        }
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(.gray)
            .edgesIgnoringSafeArea(.all)
    }
}

struct Hamburger_Previews: PreviewProvider {
    static var previews: some View {
        Menu()
    }
}

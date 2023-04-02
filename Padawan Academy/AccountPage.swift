//
//  AccountPage.swift
//  Padawan Academy
//
//  Created by Maria Doan on 4/2/23.
//

import SwiftUI

struct AccountPage: View {
    var body: some View {
        VStack {
            Image("yoda")
                .resizable()
                .frame(width: 150, height: 150)
                .clipShape(Circle())
                .padding(.bottom, 10)
                .padding(.top, 160)
            
            Text("Baby Yoda")
                .font(.title)
                .foregroundColor(.white)
                .padding(.bottom, 50)
            
            
            NavigationLink(destination: LoginPage()) {
                Text("Sign Out")
                    .foregroundColor(.white)
                    .padding(.vertical, 10)
                    .frame(maxWidth: .infinity)
                    .background(Color.gray)
                    .cornerRadius(10)
            }
            .padding(.horizontal, 30)
            
            Spacer()
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Image("Image"))
    }
}


struct AccountPage_Previews: PreviewProvider {
    static var previews: some View {
        AccountPage()
    }
}

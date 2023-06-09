//
//  SideBarMenu.swift
//  Padawan Academy
//
//  Created by Maria Doan on 4/1/23.
//

import SwiftUI

struct ShowSideBar: View {
    @State var showSideBar = false
    @Binding var userID: String
    
    var body: some View {
        let drag = DragGesture()
            .onEnded {
                if $0.translation.width < -100 {
                    withAnimation() {
                        self.showSideBar = false
                    }
                }
            }
        
        return NavigationView {
            GeometryReader { geometry in
                ZStack(alignment: .leading){
                    CourseList(userID: $userID)
                        .frame(width: geometry.size.width, height: geometry.size.height)
                        .offset(x: self.showSideBar ? geometry.size.width/1.2 : 0)
                        .disabled(self.showSideBar ? true : false)
                    if self.showSideBar {
                        Menu(userID: $userID)
                            .frame(width: geometry.size.width/1.2)
                            .transition(.move(edge: .leading))
                            .animation(.easeInOut(duration: 0.35))
                            .gesture(drag)
                    }
                }
            }
            .navigationBarItems(leading: (
                Button(action: {
                    withAnimation {
                        self.showSideBar.toggle()
                    }
                }) {
                    if !self.showSideBar {
                        Image(systemName: "person.circle")
                        .resizable()
                        .frame(width: 40.0, height: 40.0)
                        .foregroundColor(.gray)
                    }
                }
            ))
        }
        .navigationBarBackButtonHidden(true)
    }
}

//struct SideBarMenu_Previews: PreviewProvider {
//    static var previews: some View {
//        ShowSideBar()
//    }
//}

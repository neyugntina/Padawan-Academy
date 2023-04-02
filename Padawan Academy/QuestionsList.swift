//
//  QuestionsList.swift
//  Padawan Academy
//
//  Created by Ted Xiong on 4/2/23.
//

import SwiftUI

struct QuestionsList: View {
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var btnBack : some View
    { Button(action: {
        self.presentationMode.wrappedValue.dismiss()
    }) {
        HStack {
                        Image(systemName: "chevron.left")
                            .aspectRatio(contentMode: .fit)
                            .foregroundColor(.black)
        }
    }
        
    }
    var body: some View {
        List {
            Text("Hello, World!")
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: btnBack)
        
    }
}

struct QuestionsList_Previews: PreviewProvider {
    static var previews: some View {
        QuestionsList()
    }
}

//
//  SettingsView.swift
//  Padawan Academy
//
//  Created by Sarah Eltell on 4/2/23.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
        ZStack{
            List {
                Section(header: Text("Settings")
                    .font(.largeTitle)
                    .foregroundColor(.white)) {}
                
                Section(header: Text("ACCOUNT")) {
                    Text("Email")
                    Text("Password")
                }
                
                Section(header: Text("PUSH NOTIFICATIONS")) {
                    Toggle("Allow Notifications", isOn: .constant(true))
                    Toggle("Notification Sound", isOn: .constant(false))
                }
                
                Section(header: Text("ABOUT")) {
                    Text("Version 1.0")
                    Text("Privacy Policy")
                    Text("Terms of Service")
                }
                
                Section(header: Text("HELP")) {
                    Text("Contact the Devs")
                    Text("Common Q&As")
                }
                .preferredColorScheme(.dark)
            }
        }
    }
}


struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}

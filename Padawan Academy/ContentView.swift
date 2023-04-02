import SwiftUI

struct Course: Identifiable {
    let id = UUID()
    let name: String
}

struct ContentView: View {
    @State var loggedIn = false
    var body: some View {
        ShowSideBar()
    }
}

struct MainView: View {
    @Binding var showSideBar: Bool
    
    var body: some View {
        LoginPage()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

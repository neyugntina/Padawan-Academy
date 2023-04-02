import SwiftUI

struct Course: Identifiable {
    let id = UUID()
    let name: String
}

struct ContentView: View {
    var body: some View {
        NavigationView {
            LoginPage()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

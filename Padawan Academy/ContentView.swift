import SwiftUI

struct Course: Identifiable, Decodable {
    let id = UUID()
//    let _id: String
    let name: String
//    let userID: String
//    let description: String
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

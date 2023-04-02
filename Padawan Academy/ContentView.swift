import SwiftUI

struct Course: Identifiable {
    let id = UUID()
    let name: String
}

struct ContentView: View {
    var body: some View {
        SideBarMenu()
    }
}

struct MainView: View {
    @Binding var showSideBar: Bool
    
    var body: some View {
        CourseList()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

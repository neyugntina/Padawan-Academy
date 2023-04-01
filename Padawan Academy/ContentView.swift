import SwiftUI

struct Course: Identifiable {
    let id = UUID()
    let name: String
}

struct ContentView: View {
    @State var courses: [Course] = [
        Course(name: "Math"),
        Course(name: "Science"),
        Course(name: "English")
    ]
    
    @State var showAddCourse = false
    @State var newCourseName = ""
    
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                
                Text("Courses")
                    .font(.largeTitle)
                    .padding(.top, 20)
                
                Spacer()
                
                List {
                    ForEach(courses) { course in
                        Text(course.name)
                    }
                }
                
                Button(action: {
                    self.showAddCourse = true
                }) {
                    Image(systemName: "plus")
                        .padding()
                        .foregroundColor(.white)
                }
                .background(Color.blue)
                .clipShape(Circle())
                .padding(.trailing, 20)
                .padding(.bottom, 20)
                .shadow(radius: 10)
            }
            .navigationBarTitle("", displayMode: .inline)
            .navigationBarHidden(true)
            .sheet(isPresented: $showAddCourse) {
                VStack {
                    TextField("New course name", text: self.$newCourseName)
                        .padding()
                    
                    Button(action: {
                        self.courses.append(Course(name: self.newCourseName))
                        self.showAddCourse = false
                        self.newCourseName = ""
                    }) {
                        Text("Add")
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                }
                .padding()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

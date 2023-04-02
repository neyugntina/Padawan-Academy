import SwiftUI

struct Course: Identifiable {
    let id = UUID()
    let name: String
}

struct ContentView: View {
    
//    @State var courses: [Course] = [
//        Course(name: "Math"),
//        Course(name: "Science"),
//        Course(name: "English")
//    ]
//
//    @State var showAddCourse = false
//    @State var newCourseName = ""
//
    var body: some View {
        CourseList()
        //        ZStack {
        //            NavigationView {
        //                VStack {
        //    //                Spacer()
        //
        //                    HStack {
        //                        Text("Courses")
        //                            .font(.largeTitle)
        //                            .bold()
        //                            .padding(.trailing, 225)
        //                    }
        //
        //
        //                    Spacer()
        //
        //                    List {
        //                        ForEach(courses) { course in
        //                            CourseRow(course: course)
        //                                .swipeActions(edge: .trailing, allowsFullSwipe: false) {
        //                                    Button(role: .destructive
        //                                           , action: {
        //                                                                                if let index = self.courses.firstIndex(where: { $0.id == course.id }) {
        //                                                                                    self.courses.remove(at: index)
        //                                                                                }
        //                                    }
        //                                           , label: {
        //                                        Label("Delete", systemImage: "trash")
        //                                    })
        //                                    Button(action: {
        //                                                                                if let index = self.courses.firstIndex(where: { $0.id == course.id }) {
        //                                                                                    self.courses.remove(at: index)
        //                                                                                }
        //                                    }, label: {
        //                                        Label("Edit", systemImage: "square.and.pencil")
        //                                    })
        //                                    .tint(.blue)
        //                                }
        //                        }
        //                        .onDelete(perform: delete)
        //                        .listRowBackground(Color.clear)
        //
        //                    }
        //                    .scrollContentBackground(.hidden)
        //                    .background(.purple)
        //
        //
        //                    Button(action: {
        //                        self.showAddCourse = true
        //                    }) {
        //                        Image(systemName: "plus")
        //                            .padding()
        //                            .foregroundColor(.white)
        //                    }
        //                    .background(Color.blue)
        //                    .clipShape(Circle())
        //                    .padding(.trailing, 20)
        //                    .padding(.bottom, 20)
        //                    .shadow(radius: 10)
        //                }
        //                .navigationBarTitle("", displayMode: .inline)
        //                .navigationBarHidden(false)
        //                .sheet(isPresented: $showAddCourse) {
        //                    VStack {
        //                        TextField("New course name", text: self.$newCourseName)
        //                            .padding()
        //
        //                        Button(action: {
        //                            self.courses.append(Course(name: self.newCourseName))
        //                            self.showAddCourse = false
        //                            self.newCourseName = ""
        //                        }) {
        //                            Text("Add")
        //                                .padding()
        //                                .background(Color.blue)
        //                                .foregroundColor(.white)
        //                                .cornerRadius(10)
        //                        }
        //                    }
        //                    .padding()
        //                }
        //            }
        //        }
        //
        //    }
        //
        //    func delete(at offsets: IndexSet) {
        //        courses.remove(atOffsets: offsets)
        //    }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

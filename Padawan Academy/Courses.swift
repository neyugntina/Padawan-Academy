//
//  Courses.swift
//  Padawan Academy
//
//  Created by Sarah Eltell on 4/1/23.
//

import SwiftUI

struct Courses: View {
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
                        .onDelete(perform: delete)

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
        
        func delete(at offsets: IndexSet) {
            courses.remove(atOffsets: offsets)
        }
}

struct Courses_Previews: PreviewProvider {
    static var previews: some View {
        Courses()
    }
}

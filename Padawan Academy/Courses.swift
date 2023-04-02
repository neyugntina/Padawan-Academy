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
                HStack {
                    Text("Courses")
                        .font(.largeTitle)
                }
                
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

struct Courses_Previews: PreviewProvider {
    static var previews: some View {
        Courses()
    }
}

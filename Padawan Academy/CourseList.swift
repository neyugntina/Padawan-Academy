//
//  CourseList.swift
//  Padawan Academy
//
//  Created by Ted Xiong on 4/1/23.
//

import SwiftUI

struct CourseList: View {
    
    @State var courses: [Course] = [
        Course(name: "Calculus 1511"),
        Course(name: "Operating Systems 2422"),
        Course(name: "Linear Algebra 3333")
    ]
    
    @State var showAddCourse = false
    @State var newCourseName = ""
    
    var body: some View {
        GeometryReader { geo in
            ZStack {
                Image("Image")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
                    .frame(width: geo.size.width, height: geo.size.height)
                    .opacity(1.0)
                
//
//
//                VStack {
//                    Text("Demo")
//                        .font(.largeTitle)
//                        .fontWeight(.bold)
//                        .foregroundColor(.white)
//
//
//                }
                
                VStack {
                        Spacer()
                        HStack {
                            Text("Courses")
                                .font(.largeTitle)
                                .bold()
                                .padding(.trailing, 225)
                                .foregroundColor(.white)
                        }
                        
                        
                        Spacer()
                        
                        List {
                            ForEach(courses) { course in
                                CourseRow(course: course)
                                    .swipeActions(edge: .trailing, allowsFullSwipe: false) {
                                        Button(role: .destructive
                                               , action: {
                                                                                    if let index = self.courses.firstIndex(where: { $0.id == course.id }) {
                                                                                        self.courses.remove(at: index)
                                                                                    }
                                        }
                                               , label: {
                                            Label("Delete", systemImage: "trash")
                                        })
                                        Button(action: {
                                                                                    if let index = self.courses.firstIndex(where: { $0.id == course.id }) {
                                                                                        self.courses.remove(at: index)
                                                                                    }
                                        }, label: {
                                            Label("Edit", systemImage: "square.and.pencil")
                                        })
                                        .tint(.blue)
                                    }
                            }
                            .onDelete(perform: delete)
                            .listRowBackground(Color.white.opacity(0.5))
                            
                            
                        }
                        .scrollContentBackground(.hidden)
                        
                        Button(action: {
                            self.showAddCourse = true
                        }) {
                            Image(systemName: "plus")
                                .padding()
                                .foregroundColor(.black)
                        }
                        .background(Color.yellow)
                        .clipShape(Circle())
                        .padding(.trailing, 20)
                        .padding(.bottom, 20)
                        .shadow(radius: 10)
                    }
//                    .navigationBarTitle("", displayMode: .inline)
//                    .navigationBarHidden(false)
                    .sheet(isPresented: $showAddCourse) {
                        VStack {
//                            Color.black
//                            opacity(0.9)
                            
                            Text("New Course")
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .font(.largeTitle)
                                .padding(.top, 50)
                            Spacer()
                            TextField("Enter course name", text: self.$newCourseName)
//                                .padding(.bottom, 25)
                                .multilineTextAlignment(.center)
                                .font(.headline)
                                .fontWeight(.medium)
                                .padding(.all, 20)
                                .background(.ultraThinMaterial)
                                .cornerRadius(30)
                                .padding()

                            Spacer()

                            Button(action: {
                                self.courses.append(Course(name: self.newCourseName))
                                self.showAddCourse = false
                                self.newCourseName = ""
                            }) {
                                Text("Add")
                                    .padding()
                                    .background(Color.yellow)
                                    
                                    .foregroundColor(.black)
                                    .cornerRadius(10)
                                    .padding(.bottom, 20)
                            }
                            
                        }
                        .background(.opacity(0.8))
//                        BottomSheetView()
                        .presentationDetents([.height(300)])
                    }
                
            }
            

        }
        
        
    }
    
    func delete(at offsets: IndexSet) {
        courses.remove(atOffsets: offsets)
    }

}

struct CourseRow: View {
    let course: Course

    var body: some View {
        VStack {
            Spacer()
            HStack {
                Text(course.name)
                    .font(.headline)
                    .foregroundColor(.primary)
                Spacer()
//                Image(systemName: "pencil")
//                    .foregroundColor(.white)
//                    .padding(.top, 30)
            }
            Spacer()
            HStack {
                Text("course details")
                    .font(.caption)
                    .foregroundColor(.primary)
                Spacer()
            }
            Spacer()
        }
    }
}

//struct BottomSheetView: View {
//    var body: some View {
//        VStack {
//            Color.white
//            //            TextField("New course name", text: $newCourseName)
////                .padding()
////
////            Button(action: {
////                self.courses.append(Course(name: self.newCourseName))
////                self.showAddCourse = false
////                self.newCourseName = ""
////            }) {
////                Text("Add")
////                    .padding()
////                    .background(Color.blue)
////                    .foregroundColor(.white)
////                    .cornerRadius(10)
////            }
////            Text("Testing")
//        }
////        .foregroundColor(.red)
//        .background(.red)
//    }
//}


struct CourseList_Previews: PreviewProvider {
    static var previews: some View {
        CourseList()
    }
}

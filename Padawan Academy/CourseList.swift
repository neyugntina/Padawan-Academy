//
//  CourseList.swift
//  Padawan Academy
//
//  Created by Ted Xiong on 4/1/23.
//

import SwiftUI

struct CourseList: View {
    @State var courses: [Course] = [
//        Course(name: "Calculus 1511"),
//        Course(name: "Operating Systems 2422"),
//        Course(name: "Linear Algebra 3333")
    ]
    
    @Binding var userID: String
    @State var showAddCourse = false
    @State var newCourseName = ""
    @State var newDescName = ""
    
    var body: some View {
        GeometryReader { geo in
            NavigationView {
            ZStack {
                Image("Image")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
                    .frame(width: geo.size.width, height: geo.size.height)
                    .opacity(1.0)
                
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
                                NavigationLink(destination: QuestionsList())
                                {
                                    CourseRow(course: course)
                                    
                                        .swipeActions(edge: .trailing, allowsFullSwipe: false) {
                                            Button(role: .destructive
                                                   , action: {
                                                if let index = self.courses.firstIndex(where: { $0.id == course.id }) {
                                                    deleteCourse(courseId: course._id)
                                                    self.courses.remove(at: index)
                                                }
                                            }
                                                   , label: {
                                                Label("Delete", systemImage: "trash")
                                            })
                                            Button(action: {
                                                if let index = self.courses.firstIndex(where: { $0.id == course.id }) {
//                                                    self.courses.remove(at: index)
                                                }
                                            }, label: {
                                                Label("Edit", systemImage: "square.and.pencil")
                                            })
                                            .tint(.blue)
                                        }
                                }
                            }
                                .onDelete(perform: delete)
                                .listRowBackground(Color.white.opacity(0.5))
                                
                            }
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
                        .scrollContentBackground(.hidden)
                        .onAppear(perform: fetchCourse)
                        
                    }
//                    .navigationBarTitle("", displayMode: .inline)
//                    .navigationBarHidden(false)
                    .sheet(isPresented: $showAddCourse) {
                        VStack {
                            
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
                            TextField("Enter description name", text: self.$newDescName)
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
                                createCourse()
//                                self.courses.append(Course(from: self.courses))
                                self.showAddCourse = false
                                self.newCourseName = ""
                            }) {
                                Text("Add")
                                    .padding()
                                    .background(Color.yellow)
                                    .foregroundColor(.black)
                                    .cornerRadius(10)
                                    .padding(.bottom, 20)
//                                    .onTapGesture {
//                                     createPosts()
//                                    }
                                    
                                    
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
    func clearCourses() {
        courses = []
    }
    func fetchCourse() {
        
        let urlString: String = "https://8lbmp14qj1.execute-api.us-east-2.amazonaws.com/dev/course/list?id="+self.userID
        
        print(self.userID)
        var request = URLRequest(url: URL(string: urlString)!,timeoutInterval: Double.infinity)
        request.httpMethod = "GET"
        courses = []
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                print(String(describing: error))
                return
            }
            print(String(data: data, encoding: .utf8)!)
            
        do {
            print("help4")
            let decodedData = try JSONDecoder().decode([Course].self, from: data)
            print("help3")
            DispatchQueue.main.async {
                print("help")
                self.courses.append(contentsOf: decodedData)
                print("huhhhhh", decodedData)
            }
        } catch {
            print(String(describing: error))
            print("Error decoding data: \(error.localizedDescription)")
        }
    }
        task.resume()
    }
    
    func createCourse() {
        let parameters = ["name": newCourseName, "description": newDescName, "userID": userID]
        let jsonData = try! JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted)
        let jsonString = String(data: jsonData, encoding: .utf8)!
        let postData = jsonString.data(using: .utf8)
        

        var request = URLRequest(url: URL(string: "https://8lbmp14qj1.execute-api.us-east-2.amazonaws.com/dev/course")!,timeoutInterval: Double.infinity)
        request.addValue("text/plain", forHTTPHeaderField: "Content-Type")

        request.httpMethod = "POST"
        request.httpBody = postData

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
          guard let data = data else {
            print(String(describing: error))
            return
          }
          print(String(data: data, encoding: .utf8)!)
        }
        fetchCourse()
        task.resume()
    }
    
    func deleteCourse(courseId: String) {
        var urlString = "https://8lbmp14qj1.execute-api.us-east-2.amazonaws.com/dev/course?id=" + courseId
        var request = URLRequest(url: URL(string: urlString)!,timeoutInterval: Double.infinity)
        request.httpMethod = "DELETE"

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
          guard let data = data else {
            print(String(describing: error))
            return
          }
          print(String(data: data, encoding: .utf8)!)
        }

        task.resume()
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
                Text(course.description)
                    .font(.caption)
                    .foregroundColor(.primary)
                Spacer()
            }
            Spacer()
        }
    }
}

//struct CourseList_Previews: PreviewProvider {
//    static var previews: some View {
//        CourseList()
//    }
//}

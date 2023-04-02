//
//  QuestionsList.swift
//  Padawan Academy
//
//  Created by Ted Xiong on 4/2/23.
//

import SwiftUI

struct Question: Identifiable, Decodable {
    let id = UUID()
    let _id: String
    let problem: String
    let answer: String
    let courseID: String
}

struct QuestionsList: View {
    
    @State var questions: [Question] = [
//        Question(question: "What is the meaning of life"),
//        Question(question: "How do I solve 2+2"),
//        Question(question: "What was Shakespeare's most famous work")
    ]

    var courseID: String = "642911122e52c5bd85d07b7c"
    
    
    @State var awake = false
    @State var newQuestion = ""
    
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    
    
    
    var btnBack : some View
    {
        Button(action: {
            self.presentationMode.wrappedValue.dismiss()
        }) {
            HStack {
                Image(systemName: "chevron.left")
                    .aspectRatio(contentMode: .fit)
                    .foregroundColor(.black)
            }
        }
        
    }
    
        
    var body: some View {
//        .navigationBarBackButtonHidden(true)
//        .navigationBarItems(leading: btnBack)
        
            GeometryReader { geo in
//                NavigationView {
                ZStack {
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
                                    Text("Questions")
                                        .font(.largeTitle)
                                        .bold()
                                        .padding(.trailing, 175)
                                        .foregroundColor(.white)
                                }
                                
                                
                                Spacer()
                                
                            
                                List {
                                    ForEach(questions) { question in
//                                        NavigationLink(destination: QuestionsList(courseID: problem.id))
//                                        {
                                            
                                            QuestionRow(question: question)
                                            
                                                .swipeActions(edge: .trailing, allowsFullSwipe: false) {
                                                    Button(role: .destructive
                                                           , action: {
                                                        if let index = self.questions.firstIndex(where: { $0.id == question.id }) {
                                                            self.questions.remove(at: index)
                                                        }
                                                    }
                                                           , label: {
                                                        Label("Delete", systemImage: "trash")
                                                    })
                                                    Button(action: {
                                                        if let index = self.questions.firstIndex(where: { $0.id == question.id }) {
                                                            self.questions.remove(at: index)
                                                        }
                                                    }, label: {
                                                        Label("Edit", systemImage: "square.and.pencil")
                                                    })
                                                    .tint(.blue)
                                                }
//                                        }
                                    }
    //                                    .onDelete(perform: delete)
                                        .listRowBackground(Color.white.opacity(0.5))
                                        
                                    }
    //                        Button(action: {
    //                            self.showAddCourse = true
    //                        }) {
    //                            Image(systemName: "plus")
    //                                .padding()
    //                                .foregroundColor(.black)
    //                        }
    //                        .background(Color.yellow)
    //                        .clipShape(Circle())
    //                        .padding(.trailing, 20)
    //                        .padding(.bottom, 20)
    //                        .shadow(radius: 10)
                            
                                }
                        .overlay {
                            if awake {
                                ChatPage()
                            }
                        }
                                .scrollContentBackground(.hidden)
                                
                            
                        Button(action: {
                            withAnimation {
                                self.awake.toggle()
                            }
                        }) {
                            if awake {
                                Image("yoda")
                                    .resizable()
                                    .clipShape(Circle())
        //                            .padding()
                                    .frame(width: 100, height: 100)
                                    .foregroundColor(.black)
                            } else if awake == false {
                                Image("yodasleep")
                                    .resizable()
                                    .clipShape(Circle())
        //                            .padding()
                                    .frame(width: 100, height: 100)
                                    .foregroundColor(.black)
                            }
                            
                                
                        }
                        .background(Color.secondary)
                        .clipShape(Circle())
                        .padding(.top, 600)
                        .padding(.trailing, 300)
                        .padding(.bottom, 20)
                        .shadow(radius: 10)
                    }
                    .navigationBarBackButtonHidden(true)
                }
                .onAppear(perform: fetchQuestion)

                
                    
                
                    

    //                    .navigationBarTitle("", displayMode: .inline)
    //                    .navigationBarHidden(false)
//                        .sheet(isPresented: $awake) {
//                            VStack {
//    //                            Color.black
//    //                            opacity(0.9)
//
//                                Text("New Course")
//                                    .fontWeight(.bold)
//                                    .foregroundColor(.white)
//                                    .font(.largeTitle)
//                                    .padding(.top, 50)
//                                Spacer()
//                                TextField("Enter course name", text: self.$newCourseName)
//    //                                .padding(.bottom, 25)
//                                    .multilineTextAlignment(.center)
//                                    .font(.headline)
//                                    .fontWeight(.medium)
//                                    .padding(.all, 20)
//                                    .background(.ultraThinMaterial)
//                                    .cornerRadius(30)
//                                    .padding()
//
//                                Spacer()
//
//                                Button(action: {
//                                    self.questions.append(Question(question: self.newCourseName))
////                                    self.showAddCourse = false
//                                    self.newCourseName = ""
//                                }) {
//                                    Text("Add")
//                                        .padding()
//                                        .background(Color.yellow)
//
//                                        .foregroundColor(.black)
//                                        .cornerRadius(10)
//                                        .padding(.bottom, 20)
//                                }
//
//                            }
//                            .background(.opacity(0.8))
//    //                        BottomSheetView()
//                            .presentationDetents([.height(300)])
//                        }
                    
//                }
                
                

            }
            
            
        
        
//        func delete(at offsets: IndexSet) {
//            questions.remove(atOffsets: offsets)
//        }
        
    }
    func fetchQuestion() {
        let urlString: String = "https://8lbmp14qj1.execute-api.us-east-2.amazonaws.com/dev/questions/list?id=642911122e52c5bd85d07b7c"
        
        var request = URLRequest(url: URL(string: urlString)!,timeoutInterval: Double.infinity)
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                print(String(describing: error))
                return
            }
            print(String(data: data, encoding: .utf8)!)
            questions = []
        do {
            print("help4")
            let decodedData = try JSONDecoder().decode([Question].self, from: data)
            print("help3")
            DispatchQueue.main.async {
                print("help")
                self.questions.append(contentsOf: decodedData)
                print("huhhhhh", decodedData)
            }
        } catch {
            print(String(describing: error))
            print("Error decoding data: \(error.localizedDescription)")
        }
    }
        task.resume()
    }
    
//    func createQuestion() {
//        let parameters = ["name": newCourseName, "description": newDescName, "userID": "234234234"]
//        let jsonData = try! JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted)
//        let jsonString = String(data: jsonData, encoding: .utf8)!
//        let postData = jsonString.data(using: .utf8)
//
//
//        var request = URLRequest(url: URL(string: "https://8lbmp14qj1.execute-api.us-east-2.amazonaws.com/dev/course")!,timeoutInterval: Double.infinity)
//        request.addValue("text/plain", forHTTPHeaderField: "Content-Type")
//
//        request.httpMethod = "POST"
//        request.httpBody = postData
//
//        let task = URLSession.shared.dataTask(with: request) { data, response, error in
//          guard let data = data else {
//            print(String(describing: error))
//            return
//          }
//          print(String(data: data, encoding: .utf8)!)
//        }
//        fetchCourse()
//        task.resume()
//    }
//
//    func deleteQuestion(courseId: String) {
//        var urlString = "https://8lbmp14qj1.execute-api.us-east-2.amazonaws.com/dev/course?id=" + courseId
//        var request = URLRequest(url: URL(string: urlString)!,timeoutInterval: Double.infinity)
//        request.httpMethod = "DELETE"
//
//        let task = URLSession.shared.dataTask(with: request) { data, response, error in
//          guard let data = data else {
//            print(String(describing: error))
//            return
//          }
//          print(String(data: data, encoding: .utf8)!)
//        }
//
//        task.resume()
//    }
}

struct QuestionRow: View {
    let question: Question

    var body: some View {
        VStack {
            Spacer()
            HStack {
                Text(question.problem)
                    .font(.headline)
                    .foregroundColor(.primary)
                Spacer()
//                Image(systemName: "pencil")
//                    .foregroundColor(.white)
//                    .padding(.top, 30)
            }
            Spacer()
            HStack {
                Text(question.answer)
                    .font(.caption)
                    .foregroundColor(.primary)
                Spacer()
            }
            Spacer()
        }
    }
}

//struct QuestionsList_Previews: PreviewProvider {
//    var courses: [Course] = [
//        Course(name: "Calculus 1511"),
//        Course(name: "Operating Systems 2422"),
//        Course(name: "Linear Algebra 3333")
//    ]
//
//    static var previews: some View {
//        QuestionsList()
//    }
//}

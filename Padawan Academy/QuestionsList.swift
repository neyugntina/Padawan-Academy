//
//  QuestionsList.swift
//  Padawan Academy
//
//  Created by Ted Xiong on 4/2/23.
//

import SwiftUI

struct Question: Identifiable {
    let id = UUID()
    let question: String
}

struct QuestionsList: View {
    
    @State var questions: [Question] = [
        Question(question: "What is the meaning of life"),
        Question(question: "How do I solve 2+2"),
        Question(question: "What was Shakespeare's most famous work")
    ]
    
    var courseID: UUID
    
    
    @State var awake = false
    @State var newCourseName = ""
    
    
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
                NavigationView {
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
                                    NavigationLink(destination: QuestionsList(courseID: question.id))
                                    {
                                        
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
                                    }
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
                        Button(action: {
                            self.awake.toggle()
                        }) {
                            Image("yoda")
                                .resizable()
                                .clipShape(Circle())
    //                            .padding()
                                .frame(width: 100, height: 100)
                                .foregroundColor(.black)
                                
                        }
                        .background(Color.secondary)
                        .clipShape(Circle())
                        .padding(.trailing, 20)
                        .padding(.bottom, 20)
                        .shadow(radius: 10)
                            }
                            .scrollContentBackground(.hidden)
                            
                            
                        
                        }
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
                    
                }
                

            }
            
            
        
        
//        func delete(at offsets: IndexSet) {
//            questions.remove(atOffsets: offsets)
//        }
        
    }
}

struct QuestionRow: View {
    let question: Question

    var body: some View {
        VStack {
            Spacer()
            HStack {
                Text(question.question)
                    .font(.headline)
                    .foregroundColor(.primary)
                Spacer()
//                Image(systemName: "pencil")
//                    .foregroundColor(.white)
//                    .padding(.top, 30)
            }
            Spacer()
            HStack {
                Text("question details")
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

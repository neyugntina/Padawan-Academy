//
//  ChatPage.swift
//  Padawan Academy
//
//  Created by Ted Xiong on 4/2/23.
//

import SwiftUI
import OpenAISwift

final class ViewModel: ObservableObject {
    init() {}
    
    private var client: OpenAISwift?
    
    func setup() {
        client = OpenAISwift(authToken: "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")
    }
    
    
    func send(text: String, completion: @escaping (String) -> Void) {
        client?.sendCompletion(with: text, maxTokens: 2000, completionHandler: {result in
            switch result {
            case .success(let model):
                let output = model.choices.first?.text ?? ""
                completion(output)
            case .failure(let failure):
                print(failure.localizedDescription)
            }
        })
    }
}



struct ChatPage: View {
    @ObservedObject var viewModel = ViewModel()
    @State var text = ""
    @State var models = [String]()
    
    //    let openAI = OpenAISwift(authToken: "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")
    //
    //    @State private var search: String = ""
    //
    //    private func performOpenAISearch(){
    //        openAI.sendCompletion(with: search) { result in
    //            switch result {
    //            case .success(let success):
    //                print(success.choices.first?.text.trimmingCharacters(in: .whitespacesAndNewlines) ?? "")
    //            case .failure(let failure):
    //                print(failure.localizedDescription)
    //            }
    //        }
    //    }
    
    var body: some View {
    
        VStack (alignment: .leading){
//            ScrollView {
                ForEach(models, id: \.self) { string in
                    
                    Text(string).foregroundColor(.white)
                        .fontWeight(.semibold)
                        .padding(.top, 10)
                        
//                }
            }
            
            
            Spacer()
            
            HStack {
                TextField("Type here...", text: $text)
                    .multilineTextAlignment(.center)
                    .font(.headline)
                    .fontWeight(.medium)
                    .padding(.all, 20)
                    .background(.ultraThinMaterial)
                    .cornerRadius(30)
                    .padding(.bottom, 25)

                                
                Button("Send") {
                    send()
                }
                .fontWeight(.bold)
                .padding(.bottom, 25)
                
            }
        }
        .onAppear() {
            viewModel.setup()
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
//            .blur(radius: 50)
        .foregroundColor(.white)
        .background(.ultraThinMaterial)
    }
    
    func send() {
        guard !text.trimmingCharacters(in: .whitespaces).isEmpty else {
            return
        }
        
        models.append("Me: \(text)")
        let prompt = "determine the processes to answer the following without solving the question: \n" + text
        viewModel.send(text: prompt) { response in
            DispatchQueue.main.async {
                self.models.append("ChatGPT: \(response)")
                self.text = ""
            }
            createQuestion(answer: response)
        }
    }
    func createQuestion(answer: String) {
        let parameters = ["problem": text, "answer": answer, "courseID": "642911122e52c5bd85d07b7c"]
        let jsonData = try! JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted)
        let jsonString = String(data: jsonData, encoding: .utf8)!
        let postData = jsonString.data(using: .utf8)


        var request = URLRequest(url: URL(string: "https://8lbmp14qj1.execute-api.us-east-2.amazonaws.com/dev/questions")!,timeoutInterval: Double.infinity)
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
        task.resume()
    }
}
            
//            // integrate with speech to text
//            TextField("Type here...", text: $search)
//                .frame(maxWidth: .infinity, maxHeight: .infinity)
//    //            .blur(radius: 50)
//                .foregroundColor(.white)
//                .background(.black.opacity(0.8))
//                .onSubmit {
//                    if !search.isEmpty {
//                        performOpenAISearch()
//                    }
//                }
//        }
        
//        Color.black
//        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
//            .frame(maxWidth: .infinity, maxHeight: .infinity)
////            .blur(radius: 50)
//            .foregroundColor(.white)
//            .background(.black.opacity(0.8))



struct ChatPage_Previews: PreviewProvider {
    static var previews: some View {
        ChatPage()
    }
}

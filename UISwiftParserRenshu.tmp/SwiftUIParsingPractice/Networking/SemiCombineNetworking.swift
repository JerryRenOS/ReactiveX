//
//  SemiCombineNetworking.swift
//  SwiftUIParsingPractice
//
//  Created by Jerry Ren on 11/11/20.
//

import Foundation

// Deprecated Approach //

public class InfoPuller: ObservableObject {
    @Published var userInfo = [UserInfo]()
 
    func loader() {
        let urlString = GloballyApplied.targetURL
        let unwrappedURL = URL(string: urlString) ?? URL(string: "")!
    
        URLSession.shared.dataTask(with: unwrappedURL) {(data,response,error) in
            do {
                if let data = data {
                    let userInfoList = try JSONDecoder().decode([UserInfo].self, from: data)
                    DispatchQueue.main.async {
                        self.userInfo = userInfoList
                        print(self.userInfo.count)
                    }
                } else {
                    print("Data not found")
                }
            } catch {
                print (error.localizedDescription)
            }
        }.resume()
    }
    init(){
        loader()
    }
}

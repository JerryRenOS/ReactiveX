//
//  ContentView.swift
//  SwiftUIParsingPractice
//
//  Created by Jerry Ren on 11/11/20.
//

import SwiftUI
import Combine

struct InfoContentView: View {
    @ObservedObject var combViewModel = CombineViewModel.init()
    @ObservedObject var dataGatherer = InfoPuller.init() //deprecated approach

    var body: some View {
        VStack {
            List(combViewModel.userInfoCollection) { uInfo in
                VStack (alignment: .leading) {
                    Text(uInfo.title).font(.system(size: 16, design: .rounded))
                    Text(String(uInfo.title))
                        .font(.system(size: 10.5))
                        .foregroundColor(Color.init(UIColor.lightGray))
                    Text(uInfo.title).font(.system(size: 7, design: .rounded)).foregroundColor(Color.black)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        InfoContentView()
    }
}

//struct ContentView: View {
//    var body: some View {
//        Text("Hey Jude")
//            .padding()
//    }
//}
//            List(dataGatherer.userInfo) { uInfo in
//                VStack (alignment: .leading) {
//                    Text(uInfo.title).font(.system(size: 16, design: .rounded))
//                    Text(String(uInfo.title))
//                        .font(.system(size: 10.5))
//                        .foregroundColor(Color.init(UIColor.lightGray))
//                    Text(uInfo.title).font(.system(size: 7, design: .rounded)).foregroundColor(Color.black)
//                }
//            }







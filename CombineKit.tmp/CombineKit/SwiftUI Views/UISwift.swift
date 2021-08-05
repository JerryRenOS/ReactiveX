//
//  UISwift.swift
//  CombineKit
//
//  Created by Jerry Ren on 11/4/20.
//

import SwiftUI

struct UISwift: View {
    
    @State private var imagery: Image?
    @State private var showingImagePicka = false
    
    var body: some View {
        VStack {
            imagery?.resizable().scaledToFit()

            Button(action: {
                showingImagePicka = !showingImagePicka
            }, label: {
                Text("UISwift Clickable").padding()
                    .foregroundColor(.gray)
                    .frame(width: 170, height: 100, alignment: .center)
            })
            .sheet(isPresented: $showingImagePicka) {
                ImagePicka()
            }
        }
    }
}

struct UISwift_Previews: PreviewProvider {
    static var previews: some View {
        UISwift()
    }
}

class SharedEnvironmentalProperties: ObservableObject {
    @Published var sharedUIColor: UIColor = .gray
}

// inside body earlier _______________
// Text("UISwift").padding()
//            .foregroundColor(.gray)
//            .frame(width: 170, height: 170, alignment: .center)

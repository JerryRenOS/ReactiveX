//
//  UISwift.swift
//  CombineKit
//
//  Created by Jerry Ren on 11/4/20.
//

import SwiftUI

struct UISwift: View {
    var body: some View {
        Text("UISwift in VC").padding()
            .foregroundColor(.gray)
            .frame(width: 170, height: 170, alignment: .center)
    }
}

struct UISwift_Previews: PreviewProvider {
    static var previews: some View {
        UISwift()
    }
}

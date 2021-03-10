//
//  SwiftickDotUI.swift
//  CombineKit
//
//  Created by Jerry Ren on 11/4/20.
//

import Foundation
import Combine
import SwiftUI

class SharedEnvironmentalProperties: ObservableObject {
    @Published var sharedUIColor: UIColor = .black
}


struct ContentView: View {
    
    @EnvironmentObject var sharedEnvironmentalObject: SharedEnvironmentalProperties
    
    @State private var counter: Int = 0
    
    var body: some View {
        
        NavigationView {
            
            ZStack {
                Color(sharedEnvironmentalObject.sharedUIColor)
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    Image("sereneLake").resizable().aspectRatio(contentMode: .fit).frame(width: 300, height: 200, alignment: .center)
                    
                    Text("counter = \(counter)").fontWeight(.bold).foregroundColor(Color(UIColor.cyan))
                    
                    Button(action: {
                        self.counter = self.counter + 1
                    })  {
                        VStack {
                            Text("Increment").foregroundColor(.white).fontWeight(.semibold)
                        }
                    }
                    Button(action: {
                        self.counter = self.counter - 1
                    }, label: {
                        VStack {
                            Text("Decrement").foregroundColor(.white).fontWeight(.semibold)
                        }
                    })
                    
                    NavigationLink(destination: ContentDetailView(counterFromParentView: $counter))  {
                        Text("Open detailScreen").fontWeight(.bold)
                    }
                }
            }
        }
    }
}

struct ThirdContentView: View {
    
    @EnvironmentObject var sharedEnvironmentalObject: SharedEnvironmentalProperties
    
    var body: some View {
        
        VStack {
            
            Color(sharedEnvironmentalObject.sharedUIColor)
                .edgesIgnoringSafeArea(.vertical)
                .overlay(
                    VStack(spacing: 20) {
                        
                        Button(action: {
                            self.sharedEnvironmentalObject.sharedUIColor = UIColor.lightGray
                        }, label: {
                            VStack {
                                Text("Switch Color").foregroundColor(Color.white).fontWeight(.black)
                            }
                        })
                })
        } // end of vstack
    }
}

struct ContentDetailView: View {
    
    @EnvironmentObject var sharedEnvironmentalObject: SharedEnvironmentalProperties
    
    @Binding var counterFromParentView: Int
    
    @State var localCounter: Int = 0
    
    var body: some View {
        VStack {
            Color(sharedEnvironmentalObject.sharedUIColor)
                .edgesIgnoringSafeArea(.vertical)
                .overlay(
                
                VStack {
                    NavigationLink(destination: ThirdContentView()) {
                        Text("Open thirdScreen").fontWeight(.bold)
                    }
                    Button(action: {
                        self.counterFromParentView = self.counterFromParentView - 1
                    }) {
                        Text("Decrease").fontWeight(.semibold).foregroundColor(.white)
                    }
                    Button(action: {
                        //    self.counterFromParentView = self.localCounter + 1
                        // self.counterFromParentView += 1
                        self.localCounter += 1
                    }, label: {
                        Text("Increase").fontWeight(.semibold).foregroundColor(.white)
                    })
                    Text("  Details'counter =  \(counterFromParentView)").fontWeight(.black).foregroundColor(Color(UIColor.cyan))
                } // end of inner vStack
            )
            
        } // end of outer vStack
            .onAppear {
                self.localCounter = self.counterFromParentView
        }
        .onDisappear {
            print("contentDetailView disappeared")
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

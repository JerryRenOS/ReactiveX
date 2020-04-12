//
//  TaskModel.swift
//  RxSuru
//
//  Created by Jerry Ren on 4/6/20.
//  Copyright © 2020 Jerry Ren. All rights reserved.
//

import Foundation

enum HighMediumLow: Int {
    case High
    case Medium
    case Low 
}


struct TaskModel {
    
    let title: String
    let priority: HighMediumLow
    
}

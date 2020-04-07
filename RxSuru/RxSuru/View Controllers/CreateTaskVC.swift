//
//  CreateTaskVC.swift
//  RxSuru
//
//  Created by Jerry Ren on 4/6/20.
//  Copyright © 2020 Jerry Ren. All rights reserved.
//

import UIKit
import Foundation
import RxSwift
import RxCocoa

class CreateTaskVC: UIViewController {
    
    @IBOutlet weak var createTaskTextField: UITextField!
    
    @IBOutlet weak var prioritySegmentedControl: UISegmentedControl!
    
    @IBAction func saveTask() {
        guard let priority = HighMediumLow(rawValue: self.prioritySegmentedControl.selectedSegmentIndex),
            let title = self.createTaskTextField.text else { return  }
        
        let task = TaskModel(title: title, priority: priority)
        
        taskSubject.onNext(task)
        dismiss(animated: true, completion: nil) 
    }
    
    private let taskSubject = PublishSubject<TaskModel>()
    var taskSubjectObservable: Observable<TaskModel> {
        return taskSubject.asObservable()
    }
    
    
    
}

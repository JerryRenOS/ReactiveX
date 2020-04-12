//
//  TaskRisutoVC.swift
//  RxSuru
//
//  Created by Jerry Ren on 4/6/20.
//  Copyright © 2020 Jerry Ren. All rights reserved.
//

import Foundation
import UIKit
import RxCocoa
import RxSwift

class TaskRisutoVC: UIViewController {
    
    @IBOutlet weak var taskTableView: UITableView!
    @IBOutlet weak var prioritizedSegmentedControl: UISegmentedControl!
    
    let disposeBag = DisposeBag()
    
    
    private var filteredTasksCollection = [TaskModel]()
    private var tasksCollection = BehaviorRelay<[TaskModel]>(value: [])
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let navControl = segue.destination as? UINavigationController else { return }
        guard let createTaskVC = navControl.viewControllers.first as? CreateTaskVC else {
            fatalError("Can't find destination controller")
        }
        
        createTaskVC.taskSubjectObservable.subscribe(onNext: { [unowned self]
            task in
            
            let priority = HighMediumLow(rawValue: self.prioritizedSegmentedControl.selectedSegmentIndex - 1)
            
            var tempTasksHolder = self.tasksCollection.value
            tempTasksHolder.append(task)
            
            self.tasksCollection.accept(tempTasksHolder)
            self.filteringTasks(accordingTo: priority)
            
        }).disposed(by: disposeBag)
        
    }
    
    private func filteringTasks(accordingTo priority: HighMediumLow?) {
        if priority == nil {
            self.filteredTasksCollection = self.tasksCollection.value
            self.updatingTable()
        }
        else {
            self.tasksCollection.map {
                tasks in
                return tasks.filter { $0.priority == priority! }
            }
            .subscribe(onNext: { [weak self] tasks in
                self?.filteredTasksCollection = tasks
                self?.updatingTable()
            }
            ).disposed(by: disposeBag)
        }
    }
    
    private func updatingTable() {
        DispatchQueue.main.async {
            self.taskTableView.reloadData()
        }
    }
    
    @IBAction func priorityLevelAltered(segmentedControl: UISegmentedControl) {
        let priority = HighMediumLow(rawValue: segmentedControl.selectedSegmentIndex - 1)
        filteringTasks(accordingTo: priority)
    }
}

extension TaskRisutoVC: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = taskTableView.dequeueReusableCell(withIdentifier: GlobalConstants.taskCellIdentifier, for: indexPath)
        cell.textLabel?.text = filteredTasksCollection[indexPath.row].title
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.filteredTasksCollection.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
}



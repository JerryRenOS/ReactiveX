//
//  RxTeibowAPIViewController.swift
//  ReactiveReactivity
//
//  Created by Jerry Ren on 8/13/20.
//  Copyright © 2020 Jerry Ren. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

class RxTeibowAPIViewController: UIViewController {
    
    let brDataSource: BehaviorRelay<[PostInFo]> = BehaviorRelay(value: [])
    
    func bindingBRDataSource() {
        brDataSource.bind(to: self.reactiveTeibow.rx.items) {rxTableView, row, element in
            let cello = rxTableView.dequeueReusableCell(withIdentifier: "rxCello")!
            cello.textLabel?.text = "\(element.title)"
            cello.detailTextLabel?.text = " @row \(row)"   
            return cello
        }
         .disposed(by: disposeBaggy)
    }
             
    var globalPostInfoArray = [PostInFo]()
  
    let disposeBaggy = DisposeBag()
    
    @IBOutlet weak var reactiveTeibow: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bindingBRDataSource()
    
        callingAPI().subscribe(onNext: { (postInfoArray) in
            self.brDataSource.accept(postInfoArray)
        }, onError: { (erro) in
            print(erro.localizedDescription)
        }, onCompleted: {
            
        }) {
            
        }.disposed(by: disposeBaggy)
        
        // reactiveTeibow.dataSource = self
       //  subscribingToAPICaller()
    }
    
    func subscribingToAPICaller() {
        callingAPI().subscribe(onNext: { (postArrayInfo) in
            print(postArrayInfo.last?.title)
            self.reactiveTeibow.reloadData()
        }, onError: { (erro) in
            print(erro.localizedDescription)
        }, onCompleted: {
            print("completed")
        }) {
            print("disposed")
        }
        .disposed(by: disposeBaggy)
    }
    
    func callingAPI() -> Observable<[PostInFo]> {
        Observable<[PostInFo]>.create { (observer) -> Disposable in
            if let url = URL(string: "https://jsonplaceholder.typicode.com/todos/") {
                let dataTask = URLSession.shared.dataTask(with: url) { (data, response, erro) in
                    DispatchQueue.main.async {
                        if erro != nil {
                            observer.onError(erro as! Error)
                            print(erro?.localizedDescription)
                        } else {
                            do {
                                if let data = data {
                                    let postInfoArray = try JSONDecoder().decode([PostInFo].self, from: data)
                                    self.globalPostInfoArray = postInfoArray
                                    observer.onNext(postInfoArray)
                        // damnnn, order actually matters for these two lines, reversed ain't gon work
                                }
                            } catch {
                                print("caught")
                            }
                        }
                    }
                }
                dataTask.resume()
            }
            let someDisposable = Disposables.create()
            return someDisposable
        }
    }
}

struct PostInFo: Codable {
    var userId: Int
    var id: Int
    var title: String
    var completed: Bool
}
   

extension RxTeibowAPIViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return globalPostInfoArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cello = reactiveTeibow.dequeueReusableCell(withIdentifier: "rxCello", for: indexPath)
        
        cello.textLabel?.text = globalPostInfoArray[indexPath.row].title
        cello.detailTextLabel?.text = String(globalPostInfoArray[indexPath.row].id)
        
        return cello
    }
      
}

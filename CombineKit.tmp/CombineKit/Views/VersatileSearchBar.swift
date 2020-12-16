//
//  VersatileSearchBar.swift
//  CombineKit
//
//  Created by Jerry Ren on 12/16/20.
//

import Combine
import UIKit

extension BineViewController {
     
    func searchWithCombine() {
        let notifiedPublisher = NotificationCenter.default.publisher(for: UISearchTextField.textDidChangeNotification, object: UISearchController().searchBar.searchTextField)
        
        notifiedPublisher.map {
            ($0.object as? UISearchTextField)?.text
        }
        .debounce(for: .milliseconds(666), scheduler: RunLoop.main)
        .sink { (value) in
            DispatchQueue.global(qos: .userInteractive).async { [weak self] in
                // perform search with searchTexts dattebato
                DispatchQueue.main.async {
                    // ui updates ya know dattebato
                }
            }
        }
    }
}

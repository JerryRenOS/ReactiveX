//
//  BineTableExtensions.swift
//  CombineKit
//
//  Created by Jerry Ren on 11/4/20.
//

import UIKit
import Combine

extension BineViewController: TableSourceAndGate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        combTable.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 11 //revision needed later
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 256
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cello = combTable.dequeueReusableCell(withIdentifier: GloballyApplied.idOfCombineCell, for: indexPath) as! CustomizableCombineCell
        
        let fetchedResult = iproductModel?.results[indexPath.row]
        cello.labelIchi.text = fetchedResult?.trackName
        cello.labelNi.text = fetchedResult?.sellerUrl
        cello.labelSan.text = fetchedResult?.description
   
        return cello
    }
    
    
    
    
    
}

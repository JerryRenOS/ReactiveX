//
//  GraphicsInterFiViewController.swift
//  ReactiveReactivity
//
//  Created by Jerry Ren on 8/15/20.
//  Copyright © 2020 Jerry Ren. All rights reserved.
//

import UIKit
import GiphyCoreSDK
import GiphyUISDK


class GraphicsInterFiViewController: UIViewController {
    
    @IBOutlet weak var gifGiphyImageView: UIImageView!
    
    let giphyIchiVC = GiphyViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.gifGiphyImageView.image = UIImage.gifImageWithURL("https://media1.giphy.com/media/12Tob44HkDJty8/200_d.gif?cid=34d60d396nnynq7trj5gbl92jkerdixihoxhzbm6sbnzefmy&rid=200_d.gif")
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        giphyGoofyConfiguration()
    }
    
    func giphyGoofyConfiguration() {
        Giphy.configure(apiKey: "cqgYNwdFsLYkNQyBWXRNGPtKzWuR5NfG")
        
        giphyIchiVC.mediaTypeConfig = [.gifs, .stickers, .text, .emoji] // change to what I want later
        
        giphyIchiVC.theme = GPHTheme(type: .automatic) // try lightBlur later
        
        present(giphyIchiVC, animated: true, completion: nil)
        

    }
      
 
}
  

   





//public class CustomTheme: GPHTheme {
//    public override init() {
//        super.init()
//        self.type = .light
//    }
//
//    public override var textFieldFont: UIFont? {
//        return UIFont.italicSystemFont(ofSize: 16.0)
//    }
//
//    public override var textColor: UIColor {
//        return .darkGray
//    }
//}

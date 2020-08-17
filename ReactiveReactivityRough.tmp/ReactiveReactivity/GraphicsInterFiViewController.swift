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

class GraphicsInterFiViewController: VelocityAnimaViewController{
    
    @IBOutlet weak var gifGiphyImageView: UIImageView!
    @IBOutlet weak var interFiGraphicsCollectionCell: UICollectionViewCell!
    
    let giphyMediaView = GPHMediaView()

    let giphyIchiVC = GiphyViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.gifGiphyImageView.image = UIImage.manHandleGIFWithURL(StorageCloset.tpGifURLForFun)
    }
        
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        gifGiphyImageView.isHidden = true
        giphyGoofyConfiguration()
    }
    
    func giphyGoofyConfiguration() {
        Giphy.configure(apiKey: StorageCloset.goofballdeveloperKey)
        
        giphyIchiVC.mediaTypeConfig = [.emoji, .gifs, .stickers, .text]
        
        giphyIchiVC.theme = GPHTheme(type: .automatic) // try lightBlur
        
        present(giphyIchiVC, animated: true, completion: nil)
        
        giphyMediaView.canBecomeFocused
    }
}
  
// MARS: -
public class CustomTheme: GPHTheme {
    public override init() {
        super.init()
        self.type = .lightBlur
    }

    public override var textFieldFont: UIFont? {
        return UIFont.italicSystemFont(ofSize: 16.50)
    }

    public override var textColor: UIColor {
        return .lightGray
    }
}

extension GraphicsInterFiViewController : GPHGridDelegate {
    func contentDidUpdate(resultCount: Int) {
        print("did update content")
    }
    
    func didSelectMedia(media: GPHMedia, cell: UICollectionViewCell) {
        print("did select media")
    }
}

extension GraphicsInterFiViewController: GiphyDelegate {
    func didDismiss(controller: GiphyViewController?) { }
    
   func didSelectMedia(giphyViewController: GiphyViewController, media: GPHMedia)   {
        giphyViewController.dismiss(animated: true, completion: nil)
   }
}


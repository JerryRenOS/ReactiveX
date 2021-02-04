//
//  CustomizableCombineCell.swift
//  CombineKit
//
//  Created by Jerry Ren on 11/4/20.
//

import UIKit

class CustomizableCombineCell: UITableViewCell {

    let labelIchi: UILabel = {
        let thisLabel = UILabel.init()
        thisLabel.numberOfLines = 0
        let georgiaDescriptor = UIFontDescriptor(name: "Georgia", size: 16)
        let georgiaBoldFont = UIFont(descriptor: georgiaDescriptor, size: 16)
 //       thisLabel.font = UIFont(name: "Georgia", size: 16)
        thisLabel.font = georgiaBoldFont

        thisLabel.textAlignment = .left
        return thisLabel
    }()
    
    let labelNi: UILabel = {
        let thisLabel = UILabel()
        thisLabel.numberOfLines = 0
        thisLabel.textAlignment = .left
        thisLabel.font = UIFont(name: "Georgia", size: 13)
        return thisLabel
    }()
    
    let labelSan: UILabel = {
        let thisLabel = UILabel()
        thisLabel.numberOfLines = 0
        thisLabel.textAlignment = .left
        thisLabel.textColor = UIColor.lightGray
        thisLabel.font = UIFont(name: "Georgia", size: 12)
        return thisLabel
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(labelIchi)
        contentView.addSubview(labelNi)
        contentView.addSubview(labelSan)
    }
                                
    required init?(coder: NSCoder) {
        fatalError("init(coder:) not yet")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let viewWidth = contentView.frame.size.width
        let viewHeight = contentView.frame.size.height

        labelIchi.frame = CGRect(x: 18, y: 20, width: viewWidth - 36, height: viewHeight / 10)
        labelNi.frame = CGRect(x: 18, y: 20 + viewHeight / 10, width: viewWidth - 36, height: viewHeight / 13)
        labelSan.frame = CGRect(x: 18, y: 10 + viewHeight / 10 + viewWidth / 13, width: viewWidth - 36, height: viewHeight - viewHeight / 13 - viewHeight / 10 - 50)
    }

}

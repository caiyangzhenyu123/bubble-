//
//  HqCollectionViewCell.swift
//  Bubble
//
//  Created by caiyangzhenyu on 2018/1/4.
//  Copyright © 2018年 caiyangzhenyu. All rights reserved.
//

import UIKit

class HqCollectionViewCell: UICollectionViewCell {
    var lbl:UILabel?
   


    override init(frame: CGRect) {
      super.init(frame: frame)
        lbl = UILabel.init()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        lbl?.frame = CGRect.init(x: 0, y: 0, width: self.frame.width, height: self.frame.height)
        lbl?.textColor = UIColor.gray
        lbl?.textAlignment = NSTextAlignment.center
        contentView.addSubview(lbl!)
    }
}

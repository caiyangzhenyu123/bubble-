//
//  HqCollectView.swift
//  Bubble
//
//  Created by caiyangzhenyu on 2018/1/4.
//  Copyright © 2018年 caiyangzhenyu. All rights reserved.
//

import UIKit
typealias clickblk = (Int)->()
class HqCollectView: UIView,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout,UICollectionViewDataSource {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    var collectionview:UICollectionView?
    var cellarr:NSArray = []
    var cwidth:CGFloat = 80
    var cheight:CGFloat = 40
    var cspace:CGFloat = 10
    var blk:clickblk?
    override func awakeFromNib() {
        super.awakeFromNib()
        let layout = UICollectionViewFlowLayout.init()
        layout.scrollDirection = UICollectionViewScrollDirection.horizontal
        layout.minimumLineSpacing = cspace
        layout.minimumInteritemSpacing = cspace
        layout.sectionInset = UIEdgeInsets.init(top: 0, left: cspace, bottom: 0, right: cspace)
        collectionview = UICollectionView.init(frame: CGRect.zero, collectionViewLayout: layout)
        
        collectionview?.backgroundColor = UIColor.black
        collectionview?.register(HqCollectionViewCell.classForCoder(), forCellWithReuseIdentifier: "rs")
        self.addSubview(collectionview!)
        collectionview?.delegate = self
        collectionview?.dataSource = self
    }
    func sendblk(sender:@escaping clickblk) {
        blk = sender
    }
    override func layoutSubviews() {
        collectionview?.frame = CGRect.init(x: 0, y: 0, width: self.frame.width, height: self.frame.height)
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cellarr.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "rs", for: indexPath) as! HqCollectionViewCell
        cell.clipsToBounds = true
        cell.layer.cornerRadius = cheight / 2
        cell.layer.borderWidth = 1
        cell.layer.borderColor = UIColor.white.cgColor
        cell.lbl?.text = cellarr[indexPath.row] as? String
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize.init(width: cwidth, height: cheight)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        blk!(indexPath.item)
        if CGFloat(indexPath.item + 1) * (cwidth + cspace) > (self.frame.width + collectionView.contentOffset.x) {
            UIView.animate(withDuration: 0.25, animations: {
                collectionView.contentOffset = CGPoint.init(x: CGFloat(indexPath.item + 1) * (self.cwidth + self.cspace) - self.frame.width, y: 0)
            })
            
        }else  if CGFloat(indexPath.item) * (cwidth + cspace) < collectionView.contentOffset.x {
            UIView.animate(withDuration: 0.25, animations: {
                collectionView.contentOffset = CGPoint.init(x: CGFloat(indexPath.item) * (self.cwidth + self.cspace), y: 0)
            })
        }
    }
   

}

//
//  ViewController.swift
//  Bubble
//
//  Created by caiyangzhenyu on 2017/12/21.
//  Copyright © 2017年 caiyangzhenyu. All rights reserved.
//

import UIKit
import WebKit
class ViewController: UIViewController,UIScrollViewDelegate {
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var botlbl: UILabel!
    @IBOutlet weak var uplbl: UILabel!
    
    @IBOutlet weak var colvIEW: HqCollectView!
    var webview: UIWebView!
    @IBAction func movebegin(_ sender: UIButton) {
        UIView.animate(withDuration: 8) {
            self.uplbl.frame = CGRect.init(x: 100, y: 200, width: 164, height: 21)
        }
        
    }
    
    // 截屏
    @IBAction func catchImg(_ sender: UIButton) {
        UIGraphicsBeginImageContext(UIScreen.main.bounds.size)
        self.tabBarController?.view.layer.render(in: UIGraphicsGetCurrentContext()!)
        let ima = UIGraphicsGetImageFromCurrentImageContext()
        let stb = UIStoryboard.init(name: "Main", bundle: Bundle.main)
        let vc = stb.instantiateViewController(withIdentifier: "CatchViewController") as! CatchViewController
        vc.imm = ima
        present(vc, animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        img.frame = CGRect.init(x: 100, y: 50, width: 200, height: 36)
        img.image =  UIImage.init(named: "bubble")?.resizableImage(withCapInsets: UIEdgeInsets.init(top: 17, left: 10, bottom: 10, right: 20), resizingMode: UIImageResizingMode.stretch)
        
        
        botlbl.frame = CGRect.init(x: 100, y: 200, width: 164, height: 21)
        uplbl.frame = CGRect.init(x: 100, y: 200, width: 0, height: 21)

        
        
        // COLLECTIONVIEW
        colvIEW.cellarr = ["1","2","3","4","5","6","7","1","1","1","1","1","1","1","1","1","1","1"]
        colvIEW.collectionview?.reloadData()

        
    }
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        print(scrollView.contentOffset.y)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


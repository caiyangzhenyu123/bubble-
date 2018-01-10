//
//  TestpgViewController.swift
//  Bubble
//
//  Created by caiyangzhenyu on 2018/1/10.
//  Copyright © 2018年 caiyangzhenyu. All rights reserved.
//

import UIKit

class TestpgViewController: UIViewController {
    var tag = 0
    var tit = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        let lbl = UILabel.init(frame: CGRect.init(x: 100, y: 200, width: 100, height: 21))
        lbl.text = tit
        view.addSubview(lbl)
        
        if tag % 2 == 0 {
            self.view.backgroundColor = UIColor.red
        }else {
            self.view.backgroundColor = UIColor.white
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

//
//  TestpgViewController.swift
//  Bubble
//
//  Created by caiyangzhenyu on 2018/1/10.
//  Copyright © 2018年 caiyangzhenyu. All rights reserved.
//

import UIKit
import WebKit

class TestpgViewController: UIViewController {
    var tag = 0
    var tit = ""
    var webview:WKWebView!
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
        webview = WKWebView.init(frame: view.bounds)
        let port = UserDefaults.standard.object(forKey: "webPort") as! String
        let str = "smmapp://mall/supply-demand/index"
        let modelparam = "/mall/index.html#/entry/" + str.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
        let url = URL.init(string: "http://localhost:" + port + modelparam)
        webview.load(URLRequest.init(url: url!))
        view.addSubview(webview)
        
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

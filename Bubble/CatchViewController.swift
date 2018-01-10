//
//  CatchViewController.swift
//  Bubble
//
//  Created by caiyangzhenyu on 2018/1/4.
//  Copyright © 2018年 caiyangzhenyu. All rights reserved.
//

import UIKit

class CatchViewController: UIViewController {

    @IBOutlet weak var imgview: UIImageView!
    var imm:UIImage?
    override func viewDidLoad() {
        super.viewDidLoad()
        if let ima = imm {
            let ima2 = UIImage.init(named: "btm")
            let lastimg = addlogo(origin: ima, logo: ima2!)
            imgview.image = lastimg
        }
        // Do any additional setup after loading the view.
    }
//     图片  添加logo  多图合并
    func addlogo(origin:UIImage,logo:UIImage)->UIImage {
        let w = imgview.frame.width
        let h = imgview.frame.height
        let logowidth:CGFloat = imgview.frame.width
        let logoheight:CGFloat = imgview.frame.width * logo.size.height /  logo.size.width
        let colorspace = CGColorSpaceCreateDeviceRGB()
        let context = CGContext.init(data: nil, width: Int(w), height: Int(h), bitsPerComponent: 8, bytesPerRow: Int(w * 4), space: colorspace, bitmapInfo: CGImageAlphaInfo.premultipliedFirst.rawValue)
        context?.draw(origin.cgImage!, in: CGRect.init(x: 0, y: 0, width: w, height: h))
        context?.draw(logo.cgImage!, in: CGRect.init(x: 0, y: 0, width: logowidth, height: logoheight))
        if let ref = context?.makeImage()  {
            return UIImage.init(cgImage: ref)
        }
        return origin
        
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

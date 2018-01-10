//
//  PageViewController.swift
//  Bubble
//
//  Created by caiyangzhenyu on 2018/1/10.
//  Copyright © 2018年 caiyangzhenyu. All rights reserved.
//

import UIKit

class PageViewController: UIViewController,UIPageViewControllerDelegate,UIPageViewControllerDataSource {
    
    @IBOutlet weak var btview: UIView!
    @IBOutlet weak var coview: HqCollectView!
    var pgvc:UIPageViewController?
    var pageContentArray = NSArray()
    var pageContentArray1 = NSArray()
    override func viewDidLoad() {
        super.viewDidLoad()
        coview.cellarr = ["0","1","2","3","4","5","6","7"]
        coview.collectionview?.reloadData()
        coview.sendblk { (tag) in
            let initvc = self.viewControllerAtIndex(tag: tag)
            let vcs = NSArray.init(object: initvc!)
            self.pgvc?.setViewControllers(vcs as? [UIViewController], direction: UIPageViewControllerNavigationDirection.reverse, animated: false, completion: nil)
        }
        
        
        pageContentArray = [0,1,2,3,4,5,6,7]
        pageContentArray1 = ["你好","你好1","你好2","你好3","你好4","你好5","你好6","你好7"]
        pgvc = UIPageViewController.init(transitionStyle: UIPageViewControllerTransitionStyle.scroll, navigationOrientation: UIPageViewControllerNavigationOrientation.horizontal, options: [UIPageViewControllerOptionInterPageSpacingKey : 0])
        pgvc?.delegate = self
        pgvc?.dataSource = self
        pgvc?.view.frame = btview.bounds
        
        let initvc = viewControllerAtIndex(tag: 0)
        let vcs = NSArray.init(object: initvc!)
        pgvc?.setViewControllers(vcs as? [UIViewController], direction: UIPageViewControllerNavigationDirection.reverse, animated: false, completion: nil)
        addChildViewController(pgvc!)
        btview.addSubview((pgvc?.view)!)
        
        // Do any additional setup after loading the view.
    }
    func indexOfViewController(vc:TestpgViewController) -> Int {
        return vc.tag
    }
    func viewControllerAtIndex(tag:Int) -> TestpgViewController? {
        if pageContentArray.count == 0 || tag > self.pageContentArray.count {
            return nil
        }
        let cvc = TestpgViewController()
        cvc.tag = self.pageContentArray[tag] as! Int
        cvc.tit = self.pageContentArray1[tag] as! String
        return cvc
        
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        var index = self.indexOfViewController(vc: (viewController as! TestpgViewController))
        if index == 0 || index == NSNotFound {
            return nil
        }
        index -= 1
        return viewControllerAtIndex(tag: index)
        
        
    }
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        var index = self.indexOfViewController(vc: (viewController as! TestpgViewController))
        if index == NSNotFound {
            return nil
        }
        index += 1
        if index == pageContentArray.count {
            return nil
        }
        return self.viewControllerAtIndex(tag: index)
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

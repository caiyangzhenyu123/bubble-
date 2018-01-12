//
//  AppDelegate.swift
//  Bubble
//
//  Created by caiyangzhenyu on 2017/12/21.
//  Copyright © 2017年 caiyangzhenyu. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate,SSZipArchiveDelegate {

    var window: UIWindow?
    var localhttpserver:HTTPServer?
    var port = "80"
    func zipArchiveDidUnzipArchive(atPath path: String, zipInfo: unz_global_info, unzippedPath: String) {
        print(111111)
    }
    func setupLocalHttpServer() {
        localhttpserver = HTTPServer.init()
        localhttpserver?.setType("_http.tcp")
        let paths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        let path = paths[0]
        
        let urlstr = Bundle.main.path(forResource: "mall.zip", ofType: nil)
        do {
//            try FileManager.default.copyItem(atPath: urlstr!, toPath: paths[0] + "/ttt.html")
            
            try FileManager.default.copyItem(atPath: urlstr!, toPath: paths[0] + "/mall.zip")
            
            SSZipArchive.unzipFile(atPath: paths[0] + "/mall.zip", toDestination: paths[0], delegate: self)
        }catch {
            print("error")
        }
        print(path)
        localhttpserver?.setDocumentRoot(path)
        startServer()
        
      
    }
    
    func startServer() {
        do {
            try localhttpserver?.start()
            localhttpserver?.setPort(80)
            port = (localhttpserver?.listeningPort() ?? 80).description
            print(port)
            UserDefaults.standard.setValue(port, forKey: "webPort")
        }catch {
            print("error")
        }
       
    }
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        self.setupLocalHttpServer()
       
        return true
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}


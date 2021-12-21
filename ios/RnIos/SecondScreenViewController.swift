//
//  SecondScreenViewController.swift
//  RnIos
//
//  Created by Marcio Bueno on 19/12/21.
//

import UIKit
import React

class SecondScreenViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.title = "Second Screen"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func goToRN(_ sender: UIButton) {
        let bridge = RCTBridge.init(delegate: self, launchOptions: nil)!
        let rootView =  RCTRootView.init(bridge: bridge, moduleName: "RnIos", initialProperties: nil)
        if #available(iOS 13, *) {
            rootView.backgroundColor = UIColor.systemBackground
        } else {
            rootView.backgroundColor = UIColor.white
        }

        let vc = UIViewController()
        vc.view = rootView
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
    }
}

extension SecondScreenViewController: RCTBridgeDelegate {
    func sourceURL(for bridge: RCTBridge!) -> URL! {
#if DEBUG
        return RCTBundleURLProvider.sharedSettings().jsBundleURL(forBundleRoot: "index", fallbackResource: nil)
#else
        return Bundle.main.url(forResource: "main", withExtension: "jsbundle")
#endif
    }
}

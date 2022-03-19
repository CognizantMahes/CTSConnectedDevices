//
//  ViewController.swift
//  CTSConnectedDevices
//
//  Created by Maheswaran on 03/14/2022.
//  Copyright (c) 2022 Maheswaran. All rights reserved.
//

import UIKit
import CTSConnectedDevices
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let bleMgr = CTSConnectedDeviceManager()
        bleMgr.printTestMethod()
        bleMgr.start()
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}


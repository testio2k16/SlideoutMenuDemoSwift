//
//  SettingViewController.swift
//  SlideoutMenuSwift
//
//  Created by testio2k16 on 9/26/16.
//  Copyright © 2016 testio2k16. All rights reserved.
//

import Foundation
import UIKit

class SettingViewController: UIViewController {
    @IBOutlet var openBtn: UIBarButtonItem!

    @IBOutlet var label: UILabel!
    var labelText = "Home Screen"
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        label.text = labelText
        openBtn.target = self.revealViewController()
        openBtn.action = #selector(SWRevealViewController.revealToggle(_:))
        
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
    }
}
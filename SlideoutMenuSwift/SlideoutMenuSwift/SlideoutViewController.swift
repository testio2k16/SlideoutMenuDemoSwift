//
//  SlideoutViewController.swift
//  SlideoutMenuSwift
//
//  Created by testio2k16 on 9/26/16.
//  Copyright © 2016 testio2k16. All rights reserved.
//

import Foundation
import UIKit

class SlideoutViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet var tableView: UITableView!
    var contents = [String]()
    let identifier = "customcell"
    var selectedItem:String = ""
    var firstIndexPath = NSIndexPath(forRow: 0, inSection: 0)


    override func viewDidLoad() {
        tableView.delegate = self
       // contents = ["Home","Settings","About Me","Item 4","Item 5","Settings 6","Item 7","Item 8","Item 9","Item 10","Item 11","Item 12","Item 13","Item 14","Settings 15","Item 16","Item 17","Item 18","Item 19","Item 20"]
        contents = ["Home","Settings","About Me","Item 4","Item 5"]
        selectedItem = contents[0]

        tableView.registerNib(UINib(nibName: "SlideMenuItem", bundle: nil), forCellReuseIdentifier: identifier)
    }
    override func viewWillAppear(animated: Bool) {
        if contents.count > 0 {
            
            self.tableView.selectRowAtIndexPath(firstIndexPath, animated: true, scrollPosition: .Top)
           
        }
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contents.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        
        
        let cell: SlideMenuItem! = tableView.dequeueReusableCellWithIdentifier(identifier) as? SlideMenuItem
        

        cell.label.text = contents[indexPath.row]
        cell.selectionStyle = .None
        switch contents[indexPath.row] {
        case "Settings":
            cell.icon.image = UIImage(named:"tools")
        case "About Me":
            cell.icon.image = UIImage(named:"boy")
        default:
            break
        }
        
        if contents[indexPath.row] == selectedItem{
            cell.checked.hidden = false
        }else{
            cell.checked.hidden = true
        }
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        guard let cell = tableView.cellForRowAtIndexPath(indexPath) else{
            return
        }
        firstIndexPath = indexPath

        
        (cell as! SlideMenuItem).checked.hidden = false
        if contents[indexPath.row] != selectedItem {
            selectedItem = contents[indexPath.row]
        }
        
        switch selectedItem {
        case "Home":
            let myStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let myVC: ViewController = myStoryboard.instantiateViewControllerWithIdentifier("ViewController") as! ViewController
            myVC.labelText = "Home Screen"
            let navController = UINavigationController(rootViewController: myVC) //initializing as a navigation controller
            self.revealViewController().setFrontViewController(navController, animated: true)
            self.revealViewController().revealToggle(self)
        case "Settings":
            let myStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let myVC: SettingViewController = myStoryboard.instantiateViewControllerWithIdentifier("SettingViewController") as! SettingViewController
            myVC.labelText = "Settings Screen"
            let navController = UINavigationController(rootViewController: myVC) //initializing as a navigation controller
            self.revealViewController().setFrontViewController(navController, animated: true)
            self.revealViewController().revealToggle(self)
        default:
            let myStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let myVC: ViewController = myStoryboard.instantiateViewControllerWithIdentifier("ViewController") as! ViewController
            myVC.labelText = "Other Screens"
            let navController = UINavigationController(rootViewController: myVC) //initializing as a navigation controller
            self.revealViewController().setFrontViewController(navController, animated: true)
            self.revealViewController().revealToggle(self)
        }
        
        
    }
    
    func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath){
        guard let cell = tableView.cellForRowAtIndexPath(indexPath) else{
            return
        }
        
        (cell as! SlideMenuItem).checked.hidden = true
    }
    
    func callHome(){
        let myStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let myVC: ViewController = myStoryboard.instantiateViewControllerWithIdentifier("ViewController") as! ViewController
        let navController = UINavigationController(rootViewController: myVC) //initializing as a navigation controller
        self.revealViewController().setFrontViewController(navController, animated: true)
        self.revealViewController().revealToggle(self)
    }
}

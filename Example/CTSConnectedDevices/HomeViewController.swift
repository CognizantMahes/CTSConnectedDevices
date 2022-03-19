//
//  HomeViewController.swift
//  CTSConnectedDevices_Example
//
//  Created by C, Maheswaran (Cognizant) on 15/03/22.
//  Copyright © 2022 CocoaPods. All rights reserved.
//

import Foundation
import CTSConnectedDevices
import UIKit
class HomeViewController: UIViewController{
    let bleMgr = CTSConnectedDeviceManager()
    // Table View
       var tableView: UITableView = {
           let table = UITableView(frame: .zero, style: .grouped)
           table.register(DeviceNameCell.self, forCellReuseIdentifier: "DeviceNameCell")
           return table
       }()
       // UI
       var safeArea: UILayoutGuide!
       override func viewDidLoad() {
           super.viewDidLoad()
           safeArea = view.layoutMarginsGuide
           setUpTableView()
           self.title = "Available Devices"
           //self.navigationController?.navigationBar.tintColor = .white
           if #available(iOS 13.0, *) {
               self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "arrow.clockwise.circle.fill"), style: .plain, target: self, action: #selector(refreshScan))
           } else {
               // Fallback on earlier versions
           }
           
                  
                   bleMgr.start()
       }
       @objc func refreshScan(){
           bleMgr.printTestMethod()
       }
       // Set Up the Table view
       func setUpTableView(){
           view.addSubview(tableView)
           tableView.translatesAutoresizingMaskIntoConstraints = false
           tableView.topAnchor.constraint(equalTo: safeArea.topAnchor).isActive = true
           tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
           if #available(iOS 11.0, *) {
               tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
               tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
           } else {
               // Fallback on earlier versions
           }
           
           tableView.dataSource = self
           tableView.delegate = self
       }
   }
   extension HomeViewController: UITableViewDataSource, UITableViewDelegate{
       func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
           return 10
       }
       
       func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
           let cell = tableView.dequeueReusableCell(withIdentifier: "DeviceNameCell", for: indexPath) as! DeviceNameCell
           cell.deviceName.text = "123455"
              return cell
       }
       
       //Edit
       func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
           return false

       }

       func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
           if (editingStyle == .delete) {
               // handle delete (by removing the data from your array and updating the tableview)
           }
       }
       func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
           let info = UITableViewRowAction(style: .destructive, title: "Info") { (action, indexPath) in
               // delete item at indexPath
               
           }

           let connect = UITableViewRowAction(style: .normal, title: "Connect") { (action, indexPath) in
               // share item at indexPath
               
           }

           connect.backgroundColor = UIColor.blue

           return [info, connect]
       }
       func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
          
           var connectAlert = UIAlertController(title: "Do you want to connect ?", message: "All data will be lost.", preferredStyle: UIAlertController.Style.alert)

           connectAlert.addAction(UIAlertAction(title: "Connect", style: .default, handler: { (action: UIAlertAction!) in
             print("Handle Connect logic here")
             }))

           connectAlert.addAction(UIAlertAction(title: "Info", style: .cancel, handler: { (action: UIAlertAction!) in
             print("Handle Info Logic here")
             }))

           present(connectAlert, animated: true, completion: nil)
       }
   }



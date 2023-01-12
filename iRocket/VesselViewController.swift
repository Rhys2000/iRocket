//
//  VesselViewController.swift
//  iRocket
//  Created by Rhys Julian-Jones on 1/9/23.
//

import UIKit

class VesselViewController: UIViewController {
    
    let vesselTableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //ViewController Title
        title = "Vessels"
        
        // **** All of these variables should be trandformed into global variables ****
        
        //iPhone 12 Pro Dimensions: Width = 390.0, Height = 844.0 -> NavigationBar Width = 390.0, Height = 96.0, Starting Point (0, 0)
        
        //Add together the height of the NavigationBar and TabBar so that we can determine the height of the usable space in the ViewController to displlay content depending on their specific device
        let topAndBottomMargin = Double((navigationController?.navigationBar.frame.size.height)!) + Double((tabBarController?.tabBar.frame.size.height)!)

        //Set variables to hold the values of both the height and the width of the contentView where information will be displayed to the user
        let contentViewHeight = Double(view.frame.size.height) - topAndBottomMargin
        let contentViewWidth = Double(view.frame.size.width)
        
        //Variable to scale up or down the size of objects in the view depending on the available content space on the user's device
        let scaleFactor = contentViewHeight / contentViewWidth
        
        print(contentViewHeight, contentViewWidth, scaleFactor)
        
    }
}

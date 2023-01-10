//
//  VesselViewController.swift
//  iRocket
//
//  Created by Rhys Julian-Jones on 1/9/23.
//

import UIKit

class VesselViewController: UIViewController {
    
    let vesselTableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Vessels"
        view.backgroundColor = .blue
        navigationController?.navigationBar.backgroundColor = .green
        print(navigationController?.navigationBar.bounds)
        print(tabBarController?.tabBar.frame.size)
        // Do any additional setup after loading the view.
        print(view.bounds)
        
        //iPhone 12 Pro Dimensions: Width = 390.0, Height = 844.0 -> NavigationBar Width = 390.0, Height = 96.0, Starting Point (0, 0)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

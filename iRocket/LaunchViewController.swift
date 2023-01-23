//
//  LaunchViewController.swift
//  iRocket
//
//  Created by Rhys Julian-Jones on 1/19/23.
//

import UIKit

class LaunchViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    //Initialization of the TableView Object that will display a card for each launch contained in the launchData array
    let launchTableView = UITableView()
    
    //Array that contains all individual Launch objects that were loaded from the launches.json file using the LaunchDataLoader class
    let launchData = LaunchDataLoader().launchData
    
    var cellHeight = CGFloat()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //ViewController Title
        title = "Manifest"

        launchTableView.register(LaunchTableViewCell.self, forCellReuseIdentifier: LaunchTableViewCell.cellIdentifier)
        launchTableView.delegate = self
        launchTableView.dataSource = self
        view.addSubview(launchTableView)
    }
    
    //Sets the boundaries of the launchTableView to be the height and width of the screen of the users device
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        launchTableView.frame = view.bounds
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return launchData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = launchTableView.dequeueReusableCell(withIdentifier: LaunchTableViewCell.cellIdentifier, for: indexPath) as? LaunchTableViewCell else { return UITableViewCell() }
        cell.createLaunchPreview(with: launchData[indexPath.row])
        cellHeight = cell.height
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let defaultWidth: Double = 390 //View width on an iPhone 12 Pro
        let scaleFactor = Double(view.frame.width) / defaultWidth
        return CGFloat(cellHeight * scaleFactor)
    }
}

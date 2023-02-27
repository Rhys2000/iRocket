//
//  LaunchViewController.swift
//  iRocket
//  Created by Rhys Julian-Jones on 1/19/23.
//

import UIKit

class LaunchViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    //Initialization of the TableView Object that will display a card for each launch contained in the launchData array
    let launchTableView = UITableView()
    
    //Array that contains all individual Launch objects that were loaded from the launches.json file using the LaunchDataLoader class
    let launchData = LaunchDataLoader().launchData
    var previewCellArray = [LaunchTableViewCell]()

    override func viewDidLoad() {
        super.viewDidLoad()
        print(launchData.count)
        
        //ViewController Title
        title = "Launches"

        launchTableView.register(LaunchTableViewCell.self, forCellReuseIdentifier: LaunchTableViewCell.cellIdentifier)
        launchTableView.delegate = self
        launchTableView.dataSource = self
        launchTableView.frame = view.bounds
        view.addSubview(launchTableView)
        
        for launchDatum in launchData {
            let cell = LaunchTableViewCell()
            cell.createLaunchPreview(with: launchDatum, using: view.frame.width)
            previewCellArray.append(cell)
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return launchData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return previewCellArray[indexPath.row]
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        //let defaultWidth: Double = 390 //View width on an iPhone 12 Pro
        //let scaleFactor = Double(view.frame.width) / defaultWidth
        return previewCellArray[indexPath.row].height //* scaleFactor
    }
}

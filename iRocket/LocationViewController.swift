//
//  LocationViewController.swift
//  iRocket
//
//  Created by Rhys Julian-Jones on 1/18/23.
//

import UIKit

class LocationViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    //Initialization of the TableView Object that will display a card for each location contained in the locationData array
    let locationTableView = UITableView()
    
    //Initialization of the SearchController object which will allows users to use scope bars to filter their searches, as well as type the name of the vessel they would like to search for
    let locationSearchController = UISearchController()
    
    //Array that contains all individual Vessel objects that were loaded from the vessels.json file using the VesselDataLoader class
    let locationData = LocationDataLoader().locationData

    override func viewDidLoad() {
        super.viewDidLoad()

        //ViewController Title
        title = "Locations"
        
        locationTableView.register(LocationTableViewCell.self, forCellReuseIdentifier: LocationTableViewCell.cellIdentifier)
        locationTableView.delegate = self
        locationTableView.dataSource = self
        view.addSubview(locationTableView)
    }
    
    //Sets the boundaries of the locationTableView to be the height and width of the screen of the users device
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        locationTableView.frame = view.bounds
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return locationData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = locationTableView.dequeueReusableCell(withIdentifier: LocationTableViewCell.cellIdentifier, for: indexPath) as? LocationTableViewCell else { return UITableViewCell() }
        cell.createLocationPreview(with: locationData[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let defaultWidth: Double = 390 //View width on an iPhone 12 Pro
        let scaleFactor = Double(view.frame.width) / defaultWidth
        return CGFloat(275 * scaleFactor)
    }

}

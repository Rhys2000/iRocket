//
//  VehicleViewController.swift
//  iRocket
//  Created by Rhys Julian-Jones on 1/19/23.
//

import UIKit

class VehicleViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    //Initialization of the TableView Object that will display a card for each vehicle contained in the vehicleData array
    let vehicleTableView = UITableView()
    
    //Array that contains all individual Vehicle objects that were loaded from the vehicles.json file using the VehicleDataLoader class
    let vehicleData = VehicleDataLoader().vehicleData

    override func viewDidLoad() {
        super.viewDidLoad()

        //ViewController Title
        title = "Vehicles"
        
        vehicleTableView.register(VehicleTableViewCell.self, forCellReuseIdentifier: VehicleTableViewCell.cellIdentifier)
        vehicleTableView.delegate = self
        vehicleTableView.dataSource = self
        view.addSubview(vehicleTableView)
    }
    
    //Sets the boundaries of the vehicleTableView to be the height and width of the screen of the users device
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        vehicleTableView.frame = view.bounds
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return vehicleData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = vehicleTableView.dequeueReusableCell(withIdentifier: VehicleTableViewCell.cellIdentifier, for: indexPath) as? VehicleTableViewCell else { return UITableViewCell() }
        cell.createVehiclePreview(with: vehicleData[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let defaultWidth: Double = 390 //View width on an iPhone 12 Pro
        let scaleFactor = Double(view.frame.width) / defaultWidth
        return CGFloat(240 * scaleFactor)
    }

}

//
//  VesselViewController.swift
//  iRocket
//  Created by Rhys Julian-Jones on 1/9/23.
//

import UIKit

class VesselViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    //Initialization of the TableViewObject that will display a card for each vessel contained in the vesselData arrary
    let vesselTableView = UITableView()
    
    //Initialization of the SearchController object which will allows users to use scope bars to filter their searches, as well as type the name of the vessel they would like to search for
    let vesselSearchController = UISearchController()
    
    //Array that contains all individual Vessel objects that were loaded from the vessels.json file using the VesselDataLoader class
    let vesselData = VesselDataLoader().vesselData

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //ViewController Title
        title = "Vessels"
        
        vesselTableView.register(VesselTableViewCell.self, forCellReuseIdentifier: VesselTableViewCell.cellIdentifier)
        vesselTableView.delegate = self
        vesselTableView.dataSource = self
        view.addSubview(vesselTableView)
    }
    
    //Sets the boundaries of the VesselTableView to be the height and width of the screen of the users device
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        vesselTableView.frame = view.bounds
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return vesselData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = vesselTableView.dequeueReusableCell(withIdentifier: VesselTableViewCell.cellIdentifier, for: indexPath) as? VesselTableViewCell else { return UITableViewCell() }
        cell.createVesselPreview(with: vesselData[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let viewController = storyboard?.instantiateViewController(withIdentifier: VesselDetailViewController.identifier) as? VesselDetailViewController
        viewController?.nameString = vesselData[indexPath.row].name
        self.navigationController?.pushViewController(viewController!, animated: true)
        vesselTableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let defaultWidth: Double = 390 //View width on an iPhone 12 Pro
        let scaleFactor = Double(view.frame.width) / defaultWidth
        return CGFloat(275 * scaleFactor)
    }
}

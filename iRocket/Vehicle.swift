//
//  Vehicle.swift
//  iRocket
//  Created by Rhys Julian-Jones on 1/19/23.
//

import Foundation
import UIKit

struct Vehicle: Codable {
    let name: String
    let rocketFamily: String
    let providerName: String
    let variantNames: [String]
    let orbitClass: OrbitClass //Make it a array
    let reusable: Reuse
    let status: VehicleStatus
}

//This class creates a global variable with all the vehicles contained in the vehicles.json file. Decodes the json data and creates an array of Vehicle objects
public class VehicleDataLoader {
    @Published var vehicleData = [Vehicle]()
    
    init() {
        if let fileLocation = Bundle.main.url(forResource: "vehicles", withExtension: "json") {
            do {
                let data = try Data(contentsOf: fileLocation)
                let jsonDecoder = JSONDecoder()
                let dataFromJson = try jsonDecoder.decode([Vehicle].self, from: data)
                
                self.vehicleData = dataFromJson
                
            } catch {
                print(error)
            }
        }
    }
}

enum OrbitClass: String, Codable {
    case orbital = "Orbital"
    case suborbital = "Suborbital"
}

enum VehicleStatus: String, Codable {
    case operational = "Operational"
    case retired = "Retired"
    case development = "Development"
    case grounded = "Grounded"
    case testing = "Testing"
    
    func getStatusColor() -> UIColor {
        switch self {
        case .operational:
            return .systemGreen
        case .retired:
            return .red
        case .development:
            return .purple
        case .grounded:
            return .systemYellow
        case .testing:
            return .orange
        }
    }
}

enum Reuse: String, Codable {
    case partial = "Partially"
    case full = "Fully"
    case expend = "Expended"
    
    func getReuseColor() -> UIColor {
        switch self {
        case .expend:
            return .darkGray
        case .partial:
            return .systemGray
        case .full:
            return .lightGray
        }
    }
}

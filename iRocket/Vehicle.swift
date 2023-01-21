//
//  Vehicle.swift
//  iRocket
//  Created by Rhys Julian-Jones on 1/19/23.
//

import Foundation

struct Vehicle: Codable {
    let name: String
    let rocketFamily: String
    let providerName: String
    let numberOfVariants: Int
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
    case active = "Active"
    case retired = "Retired"
    case development = "Development"
    case investigatiion = "Investigation"
}

enum Reuse: String, Codable {
    case partial = "Partially"
    case full = "Fully"
    case expend = "Expended"
}

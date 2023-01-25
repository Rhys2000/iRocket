//
//  Location.swift
//  iRocket
//  Created by Rhys Julian-Jones on 1/18/23.
//

import Foundation

struct Location: Codable {
    let shortName: String
    let mediumName: String
    let fullName: String
    let abbreviation: String
    let formerNames: [String]
    let owner: String
    let ownerAbbreviation: String
    let coordinates: [Double]
    let cityState: String
    let country: Country
    let launchPads: [Pad]
    let yearsActive: [String]
    let status: LocationStatus
}

struct Pad: Codable {
    let name: String
    let abbreviation: String
    let leasee: String
}

//This class creates a global variable with all the locations contained in the locations.json file. Decodes the json data and creates an array of Location objects
public class LocationDataLoader {
    @Published var locationData = [Location]()
    
    init() {
        if let fileLocation = Bundle.main.url(forResource: "locations", withExtension: "json") {
            do {
                let data = try Data(contentsOf: fileLocation)
                let jsonDecoder = JSONDecoder()
                let dataFromJson = try jsonDecoder.decode([Location].self, from: data)
                
                self.locationData = dataFromJson
                
            } catch {
                print(error)
            }
        }
    }
}

enum LocationStatus: String, Codable {
    case active = "Active"
    case retired = "Retired"
}

//
//  Launch.swift
//  iRocket
//  Created by Rhys Julian-Jones on 1/19/23.
//

import Foundation

struct Launch: Codable {
    
    //Identification number for each launch. Format is YYYY-### with # being the orbital launch attempt number for the year, and Y being the year of launch UTC
    let cosparCode: String
    
    //The most common name used for the launch
    let name: String
    
    //Alternative name for the launch
    let alternativeName: String
    
    //Shortened version of the common launch name
    let abbreviatedName: String
    
    //LiftOffTime of the Launch in the format YYYY-MM-DDThh:mm:ssTZD (ISO 8601). These times will be entered in UTC then coverted to the individual user's time zone. May not follow this format if exact launch time is not public information
    let liftOffTime: String
    
    //Associated with shortName for Location. The Location or launch site where the Vehicle will liftOff from
    let locationName: String
    
    //Pad associated with Location where the Vehicle liftedOff from
    let locationPad: String
    
    //Associated with name for Vehicle. The name of the Vehicle that was used on this Launch
    let vehicleName: String
    
    //Variant associated with Vehicle that was used on this Launch
    let vehicleVariant: String
    
    //Name of the company who owns the Vehicle used on this launch
    let launchProvider: String
    
    //Array of customerNames, each of these is a different company who had a payload about the Launch
    let customerArray: [String]
    
    //The intended orbit the Satellites will be deployed into once separating from the upper stage of the vehicle
    let orbitDestination: OrbitDestination
    
    //States whether or not a staic fire was performed during this launch
    let staticFire: Bool
    
    //Should be an Int but because the value can be nil, read in as a String
    let staticFireToLaunchWindow: String
    
    //Name of the booster or boosters that took part in the Launch
    let boosters: [String]
    
    //States whether or not a booster was attempted to be recovered
    let boosterRecoveryAttempted: [Bool]
    
    //
    let boosterRecoveryMethod: [RecoveryMethod]
    
    //
    let boosterRecoveryLocation: [String]
    
    //
    let boosterRecoveryDistance: [String]
    
    //
    let boosterRecoveryStatus: [RecoveryStatus]
    
    //
    let fairingFlights: [Int]
    
    //
    let fairingRecoveryAttempted: Bool
    
    //
    let fairingRecoveryMethod: [RecoveryMethod]
    
    //
    let fairingRecoveryLocation: [String]
    
    //
    let fairingRecoveryDistance: String
    
    //
    let fairingRecoveryStatus: [RecoveryStatus]
    
    //
    let supportShips: [String]
    
    //
    let shipRoles: [String]
    
    //The most recent status or outcome of the Launch
    let status: LaunchStatus
}

//This class creates a global variable with all the launches contained in the launches.json file. Decodes the json data and creates an array of Launch objects
public class LaunchDataLoader {
    @Published var launchData = [Launch]()
    
    init() {
        if let fileLocation = Bundle.main.url(forResource: "launches", withExtension: "json") {
            do {
                let data = try Data(contentsOf: fileLocation)
                let jsonDecoder = JSONDecoder()
                let dataFromJson = try jsonDecoder.decode([Launch].self, from: data)
                
                self.launchData = dataFromJson
                
            } catch {
                print(error)
            }
        }
    }
}

enum LaunchStatus: String, Codable {
    case success = "Success"
    case failure = "Failure"
    case upcoming = "Upcoming"
    case prefail = "Prelaunch Failure"
}

enum OrbitDestination: String, Codable {
    case LEO = "LEO"
    case GEO = "GEO"
    case GTO = "GTO"
}

enum RecoveryMethod: String, Codable {
    case droneship = "Droneship"
    case RTLS = "RTLS"
    case parachute = "Parachute"
    case notAvailable = "NA"
}
    
enum RecoveryStatus: String, Codable {
    case success = "Success"
    case failure = "Failure"
    case notAvailable = "NA"
}

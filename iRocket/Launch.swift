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
    let fairingRecoveryStatus: [RecoveryStatus] //If fairing half is cracked in any way - Failure | If fairing half was uncovered when broguht back - Partial Success | If fairing half was caught or covered in a tarp when it was expected to splashdown - Success | If fairing half was meant to be caught but splashed down - Partial Success
    
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
    case partial = "Partial Success"
    case failure = "Failure"
    case prelaunchExplosion = "Prelaunch Explosion"
    case upcoming = "Upcoming"
}

enum OrbitDestination: String, Codable {
    case LEO = "LEO" //Low Earth Orbit
    case GEO = "GEO" //Geostationary Equatorial Orbit
    case GTO = "GTO" //Geostationary Transfer Orbit
    case ISS = "ISS" //International Space Station
    case PLEO = "PLEO" //Polar Low Earth Orbit
    case SEL1 = "SEL1" //Sun-Earth Lagrange Point 1
    case SSO = "SSO" //Sun-Synchronous Orbit
    case HELIO = "HELIO" //Heliocentric Orbit
    case MEO = "MEO" //Medium Earth Orbit
    case HEO = "HEO" //High Earth Orbit
    case SUB = "SUB" //Suborbital Trajectory
    case TLI = "TLI" //Trans-Lunar Injection Orbit
}

enum RecoveryMethod: String, Codable {
    case parachute = "Parachute"
    case splashdown = "Splashdown"
    case droneship = "Droneship"
    case returnToLaunchSite = "Return To Launch Site"
    case netCatch = "Net Catch"
    case notAvailable = "NA"
}
    
enum RecoveryStatus: String, Codable {
    case success = "Success"
    case failure = "Failure"
    case unknown = "Unknown"
    case partial = "Partial Success"
    case aborted = "Aborted"
    case pending = "Pending"
    case notAvailable = "NA"
}

//{
//    "cosparCode" : "",
//    "name" : "",
//    "alternativeName" : "",
//    "abbreviatedName" : "",
//    "liftOffTime" : "",
//    "locationName" : "",
//    "locationPad" : "",
//    "vehicleName" : "",
//    "vehicleVariant" : "",
//    "launchProvider" : "SpaceX",
//    "customerArray" : [""],
//    "orbitDestination" : "",
//    "staticFire" : ,
//    "staticFireToLaunchWindow" : "",
//    "boosters" : [""],
//    "boosterRecoveryAttempted" : [],
//    "boosterRecoveryMethod" : [""],
//    "boosterRecoveryLocation" : [""],
//    "boosterRecoveryDistance" : [""],
//    "boosterRecoveryStatus" : [""],
//    "fairingFlights" : [, ],
//    "fairingRecoveryAttempted" : ,
//    "fairingRecoveryMethod" : [""],
//    "fairingRecoveryLocation" : [""],
//    "fairingRecoveryDistance" : "",
//    "fairingRecoveryStatus" : [""],
//    "supportShips" : [""],
//    "shipRoles" : [""],
//    "status" : "",
//},

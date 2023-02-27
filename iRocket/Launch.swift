//
//  Launch.swift
//  iRocket
//  Created by Rhys Julian-Jones on 1/19/23.
//

import Foundation

protocol Launch: Codable {
    //Identification number for each launch. Format is YYYY-### with # being the orbital launch attempt number for the year, and Y being the year of launch UTC
    var cosparCode: String { get }
    
    //The most common name used for the launch
    var name: String { get }
    
    //Alternative name for the launch
    var alternativeName: String { get }
    
    //Shortened version of the common launch name
    var abbreviatedName: String { get }
    
    //LiftOffTime of the Launch in the format YYYY-MM-DDThh:mm:ssTZD (ISO 8601). These times will be entered in UTC then coverted to the individual user's time zone. May not follow this format if exact launch time is not public information
    var liftOffTime: String { get } //Date realistically
    
    //Associated with the shortName attribute for a Location. The Location or launch site where the Vehicle will liftOff from
    var locationName: String { get }
    
    //Pad associated with Location where the Vehicle lifted off from
    var locationPad: String { get }
    
    //Associated with the name attribute for a Vehicle. The name of the Vehicle that was used on this Launch
    var vehicleName: String { get }
    
    //Variant associated with Vehicle that was used on this Launch
    var vehicleVariant: String { get }
    
    //Name of the company who owns the Vehicle used on this launch
    var launchProvider: LaunchProvider { get }
    
    //The intended orbit the Satellites will be deployed into once separating from the upper stage of the vehicle
    var orbitDestination: OrbitDestination { get }
    
    //Boolean to state whether the mission was crewed
    var crewedLaunch: String { get } //Bool realistically
    
    //Name of the booster or boosters that took part in the Launch
    var boosters: [String] { get }
    
    //States whether or not a booster was attempted to be recovered. Is an array for vehicles with more than one booster
    var boosterRecoveryAttempted: [String] { get } //Bool realistically
    
    //States the way that the booster used on this launch was recovered. Is an array for vehicles with more than one booster
    var boosterRecoveryMethod: [RecoveryMethod] { get }
    
    //Number of flights for the fairing half used on the launch. Is an array because fairings come in two halves
    var fairingFlights: [String] { get } //Int realistically
    
    //States whether or not a fairing piece was attempted to be recovered. Is an array because fairings come in two halves
    var fairingRecoveryAttempted: [String] { get }
    
    //States the way that a fairing half used on this launch was recovered. Is an array because fairings come in two halves
    var fairingRecoveryMethod: [RecoveryMethod] { get }
    
    //The most recent status or outcome of the Launch
    var status: Status { get }
    
    //Description of the Launch by the launch provider
    var description: [String] { get }
    
    //Link to the live streamed broadcast of the Launch
    var livestreamLink: String { get }
}

struct SpaceX: Launch, Codable {
    let cosparCode: String
    let name: String
    let alternativeName: String
    let abbreviatedName: String
    let liftOffTime: String
    let locationName: String
    let locationPad: String
    let vehicleName: String
    let vehicleVariant: String
    let launchProvider: LaunchProvider
    let orbitDestination: OrbitDestination
    let crewedLaunch: String
    
    //States whether or not a staic fire was performed before flight for this launch
    let staticFire: String //Bool realistically
    
    //The number of days between a static fire and actual lauch of the mission
    let staticFireToLaunchWindow: String //Int realistically
    
    let boosters: [String]
    let boosterRecoveryAttempted: [String]
    let boosterRecoveryMethod: [RecoveryMethod]
    
    //States where the booster being recovered was meant to land. Is an array for vehicles with more than one booster
    let boosterRecoveryLocation: [String]
    
    //Double value describing how far down range the booster landed in kilometers. Is an array for vehicles with more than one booster
    let boosterRecoveryDistance: [String] //Double realistically
    
    //Outcome for the booster recovery attempt. Is an array for vehicles with more than one booster
    let boosterRecoveryStatus: [Status]
    
    let fairingFlights: [String]
    let fairingRecoveryAttempted: [String]
    let fairingRecoveryMethod: [RecoveryMethod]
    
    //States where the fairing half being recovered was meant to land. Is an array because fairings come in two halves
    let fairingRecoveryLocation: [String]
    
    //Double value describing how far down range the fairing halves landed downrange in kilometers.
    let fairingRecoveryDistance: String
    
    //Outcome for the fairing half recovery attempt. Is an array because fairings come in two halves
    let fairingRecoveryStatus: [Status] //If fairing half is cracked in any way - Failure | If fairing half was uncovered when broguht back - Partial Success | If fairing half was caught or covered in a tarp when it was expected to splashdown - Success | If fairing half was meant to be caught but splashed down - Partial Success
    
    //Names of the vessels that played a part in the recovery of boosters or fairings from this launch
    let supportVessels: [String]
    
    //The different roles each vessel played during the launch
    let vesselRoles: [[VesselRole]]
    
    let status: Status
    let description: [String]
    let livestreamLink: String
    
//    {
//        "cosparCode" : "",
//        "name" : "",
//        "alternativeName" : "",
//        "abbreviatedName" : "",
//        "liftOffTime" : "YYYY-MM-DDTHH:mm:ss+0000",
//        "locationName" : "",
//        "locationPad" : "",
//        "vehicleName" : "",
//        "vehicleVariant" : "",
//        "launchProvider" : "SpaceX",
//        "orbitDestination" : "",
//        "crewedLaunch" : "",
//        "staticFire" : "",
//        "staticFireToLaunchWindow" : "",
//        "boosters" : [""],
//        "boosterRecoveryAttempted" : [""],
//        "boosterRecoveryMethod" : [""],
//        "boosterRecoveryLocation" : [""],
//        "boosterRecoveryDistance" : [""],
//        "boosterRecoveryStatus" : [""],
//        "fairingFlights" : [""],
//        "fairingRecoveryAttempted" : [""],
//        "fairingRecoveryMethod" : [""],
//        "fairingRecoveryLocation" : [""],
//        "fairingRecoveryDistance" : "",
//        "fairingRecoveryStatus" : [""],
//        "supportVessels" : [""],
//        "vesselRoles" : [[""]],
//        "status" : "",
//        "description" : [""],
//        "livestreamLink" : "",
//    },
}

struct ULA: Launch, Codable {
    let cosparCode: String
    let name: String
    let alternativeName: String
    let abbreviatedName: String
    let liftOffTime: String
    let locationName: String
    let locationPad: String
    let vehicleName: String
    let vehicleVariant: String
    
    //Number of solid rocket motors attached to the first stage of the rocket at liftOff
    let sideBoosters: String
    
    let launchProvider: LaunchProvider
    let orbitDestination: OrbitDestination
    let crewedLaunch: String
    let boosters: [String]
    let boosterRecoveryAttempted: [String]
    let boosterRecoveryMethod: [RecoveryMethod]
    let fairingFlights: [String]
    let fairingRecoveryAttempted: [String]
    let fairingRecoveryMethod: [RecoveryMethod]
    let status: Status
    let description: [String]
    let livestreamLink: String
    
//    {
//        "cosparCode" : "",
//        "name" : "",
//        "alternativeName" : "",
//        "abbreviatedName" : "",
//        "liftOffTime" : "YYYY-MM-DDTHH:mm:ss+0000",
//        "locationName" : "",
//        "locationPad" : "",
//        "vehicleName" : "",
//        "vehicleVariant" : "",
//        "sideBoosters" : "",
//        "launchProvider" : "",
//        "orbitDestination" : "",
//        "crewedLaunch" : "",
//        "boosters" : [""],
//        "boosterRecoveryAttempted" : ["false"],
//        "boosterRecoveryMethod" : ["Expended"],
//        "fairingFlights" : ["1", "1"],
//        "fairingRecoveryAttempted" : ["false", "false"],
//        "fairingRecoveryMethod" : ["Expended", "Expended"],
//        "status" : "",
//        "description" : [""],
//        "livestreamLink" : "",
//    },
}

//This class creates a global variable with all the launches contained in multiple json files denoted by the providerArray variable. Decodes the json data and creates an array of objects that conform to the Launch protocol
public class LaunchDataLoader {
    @Published var launchData = [Launch]()

    let providerArray: [String] = ["spacex", "ula"]

    init() {
        for provider in providerArray {
            if let fileLocation = Bundle.main.url(forResource: provider, withExtension: "json") {
                do {
                    let data = try Data(contentsOf: fileLocation)
                    let jsonDecoder = JSONDecoder()
                    if provider == "spacex" {
                        let dataFromJson = try jsonDecoder.decode([SpaceX].self, from: data)
                        self.launchData += dataFromJson
                    } else if provider == "ula" {
                        let dataFromJson = try jsonDecoder.decode([ULA].self, from: data)
                        self.launchData += dataFromJson
                    }
                } catch {
                    print(error)
                }
            }
        }
    }
}

enum LaunchProvider: String, Codable {
    case SpaceX = "SpaceX" //Space Exploration Technologies Corporation
    case ULA = "ULA" //United Launch Alliance
}

enum OrbitDestination: String, Codable {
    case LEO = "LEO" //Low Earth Orbit
    case GEO = "GEO" //Geostationary Equatorial Orbit
    case GTO = "GTO" //Geostationary Transfer Orbit
    case ISS = "ISS" //International Space Station
    case PLEO = "PLEO" //Polar Low Earth Orbit
    case SEL1 = "SEL1" //Sun-Earth Lagrange Point 1
    case SEL2 = "SEL2" //Sun-Earth Lagrange Point 2
    case SSO = "SSO" //Sun-Synchronous Orbit
    case HELIO = "HELIO" //Heliocentric Orbit
    case MEO = "MEO" //Medium Earth Orbit
    case HEO = "HEO" //High Earth Orbit
    case SUB = "SUB" //Suborbital Trajectory
    case TLI = "TLI" //Trans-Lunar Injection Orbit
    case Molniya = "Molniya" //Molniya Orbit
    case unknown = "Unknown" //Orbit Currently Unknown
}

enum RecoveryMethod: String, Codable {
    case parachute = "Parachute"
    case splashdown = "Splashdown"
    case droneship = "Droneship"
    case returnToLaunchSite = "Return To Launch Site"
    case netCatch = "Net Catch"
    case unknown = "Unknown"
    case expended = "Expended"
    case notAvailable = "NA"
}

enum Status: String, Codable {
    case success = "Success"
    case partial = "Partial Success"
    case failure = "Failure"
    case prelaunchExplosion = "Prelaunch Explosion"
    case upcoming = "Upcoming"
    case unknown = "Unknown"
    case aborted = "Aborted"
    case pending = "Pending"
    case notAvailable = "NA"
}

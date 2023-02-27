//
//  Universal.swift
//  iRocket
//
//  Created by Rhys Julian-Jones on 2/19/23.
//

import Foundation

extension String {
    var isNumber: Bool {
        let digitsCharacters = CharacterSet(charactersIn: "0123456789")
        return CharacterSet(charactersIn: self).isSubset(of: digitsCharacters)
    }
}

//    func validateLaunchData() {
//
//        //If a launchDate has not yet passed, some data may be allowed to be missing. The pastLaunch bool variable will determine which validation tree the function will follow
//        var calendar = Calendar(identifier: .gregorian)
//        calendar.timeZone = TimeZone(identifier: "UTC")!
//        let dateFormatter = DateFormatter()
//        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
//        dateFormatter.locale = Locale(identifier: "en-US")
//        let pastLaunch: Bool = (dateFormatter.date(from: self.liftOffTime)! < Date()) ? true : false
//
//        let launchProviders: [String] = ["SpaceX", "ULA", "Blue Origin", "Rocket Lab"]
//
//        //Mission Specific Data Validation Section
//        if(self.name == "") {
//            print("Error --- Mission Must Have a Name --- \(self.name)")
//        }
//        if(self.liftOffTime.count != 24) {
//            print("Error --- LiftOffTime is in the Wrong Format --- \(self.name)")
//        }
//        let tempVehicle = VehicleDataLoader().vehicleData.first(where: {$0.name == self.vehicleName})!
//        if(!VehicleDataLoader().vehicleData.contains(where: {$0.name == self.vehicleName})) {
//            print("Error --- Vehicle Name cannot be Found --- \(self.name)")
//        }
//        if(!launchProviders.contains(where: {$0 == self.launchProvider})) {
//            print("Error --- Launch Provider cannot be found in the list --- \(self.name)")
//        }
//        if(self.crewedLaunch != "true" && self.crewedLaunch != "false") {
//            print("Error --- Crewed Launch Attribute is not of Type Bool --- \(self.name)")
//        }
//        if(self.staticFireToLaunchWindow.isNumber != true) {
//            print("Error --- Static Fire to Launch Gap is NaN --- \(self.name)")
//        }
//        if(Bool(self.staticFire) ?? false && self.staticFireToLaunchWindow == "") {
//            print("Penis \(self.name)")
//        }
//
//        //Booster Data Validation Section
//        if(self.boosters.count != self.boosterRecoveryAttempted.count) {
//            print("Error --- Booster Count and Booster Recovery Attempt Count does not Match --- \(self.name)")
//        }
//        if(self.boosters.count != self.boosterRecoveryMethod.count) {
//            print("Error --- Booster Count and Booster Recovery Method Count does not Match --- \(self.name)")
//        }
//        if(self.boosters.count != self.boosterRecoveryLocation.count) {
//            print("Error --- Booster Count and Booster Recovery Location Count does not Match --- \(self.name)")
//        }
//        if(self.boosters.count != self.boosterRecoveryDistance.count) {
//            print("Error --- Booster Count and Booster Recovery Distance Count does not Match --- \(self.name)")
//        }
//        if(self.boosters.count != self.boosterRecoveryStatus.count) {
//            print("Error --- Booster Count and Booster Recovery Status Count does not Match --- \(self.name)")
//        }
//        for method in boosterRecoveryMethod {
//            if(!method.validateRecoveryMethodData()) {
//                print("Error --- Booster Recovery Method cannot be Found or Understood --- \(self.name)")
//            }
//        }
//
//        //Fairing Data Validation Section
//        if(self.fairingFlights.count != self.fairingRecoveryAttempted.count) {
//            print("Error --- Fairing Count and Fairing Recovery Attempt Count does not Match --- \(self.name)")
//        }
//        if(self.fairingFlights.count != self.fairingRecoveryMethod.count) {
//            print("Error --- Fairing Count and Fairing Recovery Method Count does not Match --- \(self.name)")
//        }
//        if(self.fairingFlights.count != self.fairingRecoveryLocation.count) {
//            print("Error --- Fairing Count and Fairing Recovery Location Count does not Match --- \(self.name)")
//        }
//        if(self.fairingFlights.count != self.fairingRecoveryStatus.count) {
//            print("Error --- Fairing Count and Fairing Recovery Status Count does not Match --- \(self.name)")
//        }
//
//        for fairing in self.fairingFlights {
//            if(fairing.isNumber != true) {
//                print("Error --- Fairing Flight Value is NaN --- \(self.name)")
//            }
//        }
//        if(self.fairingRecoveryDistance.isNumber != true) {
//            print("Error --- Fairing Recovery Distance is NaN --- \(self.name)")
//        }
//
//        //If Mission Date has Passed
//        if(pastLaunch) {
//            if(self.cosparCode == "") {
//                print("Error --- Missing Cospar Code --- \(self.name)")
//            }
//            if(self.cosparCode.count != 8) {
//                print("Error --- Cospar Code is Missing Characters --- \(self.name)")
//            }
//            if(!String(self.cosparCode.prefix(4)).isNumber) {
//                print("Error --- Cospar Code Year is not Numeric --- \(self.name)")
//            }
//            let start = self.cosparCode.index(self.cosparCode.startIndex, offsetBy: 4)
//            let end = self.cosparCode.index(self.cosparCode.endIndex, offsetBy: -3)
//            let range = start..<end
//            if(self.cosparCode[range] != "-") {
//                print("Error --- Cospar Code is Missing Isolation Dash --- \(self.name)")
//            }
//            if(!String(self.cosparCode.suffix(2)).isNumber) {
//                print("Error --- Cospar Code Identifier is not Numeric --- \(self.name)")
//            }
//
//            let localComponents = calendar.dateComponents([.year, .month, .day, .hour, .minute, .second, .timeZone], from: dateFormatter.date(from: self.liftOffTime)!)
//            if(localComponents.day == 1 && localComponents.hour == 0 && localComponents.minute == 0) {
//                print("Error --- Launch Date ha been been updated to Reflect Real Launch Time --- \(self.name)")
//            }
//
//            let tempLocation = LocationDataLoader().locationData.first(where: {$0.shortName == self.locationName})!
//            if(!LocationDataLoader().locationData.contains(where: {$0.shortName == self.locationName})) {
//                print("Error --- Location Name cannot be Found --- \(self.name)")
//            }
//            if(!tempLocation.launchPads.contains(where: {$0.abbreviation == self.locationPad})) {
//                print("Error --- Location Pad cannot be Found --- \(self.name)")
//            }
//
//            if(!tempVehicle.variantNames.contains(where: {$0 == self.vehicleVariant})) {
//                print("Error --- Vehicle Variant cannot be Found --- \(self.name)")
//            }
//
//            if(!self.orbitDestination.validateOrbitData()) {
//                print("Error --- Orbital Destination cannot be Found or Understood")
//            }
//
//            if(self.staticFire != "true" && self.staticFire != "false") {
//                print("Error --- Static Fired Attribute is not of Type Bool --- \(self.name)")
//            }
//
////            for attempt in self.fairingRecoveryAttempted {
////                if(attempt != "true" && attempt != "false") {
////                    print("Error --- Fairing Recovery Attempt is not of Type Bool --- \(self.name)")
////                }
////            }
//
//        } else {
//
//        }
//
//    }



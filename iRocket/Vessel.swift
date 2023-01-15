//
//  Vessel.swift
//  iRocket
//  Created by Rhys Julian-Jones on 1/9/23.
//

import Foundation

struct Vessel: Codable {
    let name: String
    let abbreviation: String
    let formerNames: [String]
    let idNumber: Int //IMONumber or MMSI Number depending on availability
    let owner: String
    let ownerWebsite: String //Double check all the json data for this key is filled out
    let employerName: String
    let employerWebsite: String
    let originalVesselPurpose: VesselPurpose
    let currentVesselPurpose: [VesselPurpose] //DoubleCheck values with launches.json from previous project
    let countryRegistration: Country
    let homePort: String
    let homePortCoordinates: [Double] //Latitude then Longitude
    let yearBuilt: Int
    let hullDimensions: [Double] //Length then Width in meters
    let serviceYears: [Int] //Starting Year then Ending Year, If Ending Year is 0 then vessel is still active within fleet
    let status: Status //Can be changed to a computed variable based on years of service
    let photographerCredit: String
    let marineFleetLink: String
    let description: [String]
}

//Class create a global variable with all the vessels contained in the vessels.json file. Decodes the json data and creates an array of Vessel objects
public class VesselDataLoader {
    @Published var vesselData = [Vessel]()
    
    init() {
        if let fileLocation = Bundle.main.url(forResource: "vessels", withExtension: "json") {
            do {
                let data = try Data(contentsOf: fileLocation)
                let jsonDecoder = JSONDecoder()
                let dataFromJson = try jsonDecoder.decode([Vessel].self, from: data)
                
                self.vesselData = dataFromJson
                
            } catch {
                print(error)
            }
        }
    }
}

enum VesselPurpose: String, Codable {
    case ASDS = "ASDS" //Autonomous Spaceport Droneship
    case BSTV = "BSTV" //Booster Splashdown Telemetry Vessel
    case OSV = "OSV" //Offshore Supply Vessel
    case DSV = "DSV" //Droneship Support Vessel
    case DRV = "DRV" //Dragon Recovery Vessel
    case BSV = "BSV" //Booster Recovery Vessel
    case FRV = "FRV" //Fairing Recovery Vessel
    case CB = "CB" //Crew Boat
    case PASSENGER = "Passenger" //Passanger
    case BARGE = "BARGE" //Barge
    case TUG = "TUG" //Tugboat
}

enum Status: String, Codable {
    case active = "Active"
    case retired = "Retired"
}

// Will need to be moved from this file into a more general .swift file. Temporary solution while other basic goals are completed first
enum Country: String, Codable {
    case AFG = "AFG" //Afghanistan
    case ALA = "ALA" //Aland Islands
    case ALB = "ALB" //Albania
    case DZA = "DZA" //Algeria
    case ASM = "ASM" //American Samoa
    case AND = "AND" //Andorra
    case AGO = "AGO" //Angola
    case AIA = "AIA" //Anguilla
    case ATA = "ATA" //Antarctica
    case ATG = "ATG" //Antigua and Barbuda
    case ARG = "ARG" //Argentina
    case ARM = "ARM" //Armenia
    case ABW = "ABW" //Aruba
    case AUS = "AUS" //Australia
    case AUT = "AUT" //Austria
    case AZE = "AZE" //Azerbaijan
    case BHS = "BHS" //Bahamas
    case BHR = "BHR" //Bahrain
    case BGD = "BGD" //Bangladesh
    case BRB = "BRB" //Barbados
    case BLR = "BLR" //Belarus
    case BEL = "BEL" //Belgium
    case BLZ = "BLZ" //Belize
    case BEN = "BEN" //Benin
    case BMU = "BMU" //Bermuda
    case BTN = "BTN" //Bhutan
    case BOL = "BOL" //Bolivia
    case BES = "BES" //Bonaire, Saint Eustatius and Saba"
    case BIH = "BIH" //Bosnia and Herzegovina
    case BWA = "BWA" //Botswana
    case BVT = "BVT" //Bouvet Island
    case BRA = "BRA" //Brazil
    case IOT = "IOT" //British Indian Ocean Territory
    case VGB = "VGB" //British Virgin Islands
    case BRN = "BRN" //Brunei
    case BGR = "BGR" //Bulgaria
    case BFA = "BFA" //Burkina Faso
    case BDI = "BDI" //Burundi
    case KHM = "KHM" //Cambodia
    case CMR = "CMR" //Cameroon
    case CAN = "CAN" //Canada
    case CPV = "CPV" //Cape Verde
    case CYM = "CYM" //Cayman Islands
    case CAF = "CAF" //Central African Republic
    case TCD = "TCD" //Chad
    case CHL = "CHL" //Chile
    case CHN = "CHN" //China
    case CXR = "CXR" //Christmas Island
    case CCK = "CCK" //Cocos Islands
    case COL = "COL" //Colombia
    case COM = "COM" //Comoros
    case COK = "COK" //Cook Islands
    case CRI = "CRI" //Costa Rica
    case HRV = "HRV" //Croatia
    case CUB = "CUB" //Cuba
    case CUW = "CUW" //Curacao
    case CYP = "CYP" //Cyprus
    case CZE = "CZE" //Czech Republic
    case COD = "COD" //Democratic Republic of the Congo
    case DNK = "DNK" //Denmark
    case DJI = "DJI" //Djibouti
    case DMA = "DMA" //Dominica
    case DOM = "DOM" //Dominican Republic
    case TLS = "TLS" //East Timor
    case ECU = "ECU" //Ecuador
    case EGY = "EGY" //Egypt
    case SLV = "SLV" //El Salvador
    case GNQ = "GNQ" //Equatorial Guinea
    case ERI = "ERI" //Eritrea
    case EST = "EST" //Estonia
    case ETH = "ETH" //Ethiopia
    case FLK = "FLK" //Falkland Islands
    case FRO = "FRO" //Faroe Islands
    case FJI = "FJI" //Fiji
    case FIN = "FIN" //Finland
    case FRA = "FRA" //France
    case GUF = "GUF" //French Guiana
    case PYF = "PYF" //French Polynesia
    case ATF = "ATF" //French Southern Territories
    case GAB = "GAB" //Gabon
    case GMB = "GMB" //Gambia
    case GEO = "GEO" //Georgia
    case DEU = "DEU" //Germany
    case GHA = "GHA" //Ghana
    case GIB = "GIB" //Gibraltar
    case GRC = "GRC" //Greece
    case GRL = "GRL" //Greenland
    case GRD = "GRD" //Grenada
    case GLP = "GLP" //Guadeloupe
    case GUM = "GUM" //Guam
    case GTM = "GTM" //Guatemala
    case GGY = "GGY" //Guernsey
    case GIN = "GIN" //Guinea
    case GNB = "GNB" //Guinea-Bissau
    case GUY = "GUY" //Guyana
    case HTI = "HTI" //Haiti
    case HMD = "HMD" //Heard Island and McDonald Islands
    case HND = "HND" //Honduras
    case HKG = "HKG" //Hong Kong
    case HUN = "HUN" //Hungary
    case ISL = "ISL" //Iceland
    case IND = "IND" //India
    case IDN = "IDN" //Indonesia
    case IRN = "IRN" //Iran
    case IRQ = "IRQ" //Iraq
    case IRL = "IRL" //Ireland
    case IMN = "IMN" //Isle of Man
    case ISR = "ISR" //Israel
    case ITA = "ITA" //Italy
    case CIV = "CIV" //Ivory Coast
    case JAM = "JAM" //Jamaica
    case JPN = "JPN" //Japan
    case JEY = "JEY" //Jersey
    case JOR = "JOR" //Jordan
    case KAZ = "KAZ" //Kazakhstan
    case KEN = "KEN" //Kenya
    case KIR = "KIR" //Kiribati
    case XXK = "XXK" //Kosovo
    case KWT = "KWT" //Kuwait
    case KGZ = "KGZ" //Kyrgyzstan
    case LAO = "LAO" //Laos
    case LVA = "LVA" //Latvia
    case LBN = "LBN" //Lebanon
    case LSO = "LSO" //Lesotho
    case LBR = "LBR" //Liberia
    case LBY = "LBY" //Libya
    case LIE = "LIE" //Liechtenstein
    case LTU = "LTU" //Lithuania
    case LUX = "LUX" //Luxembourg
    case MAC = "MAC" //Macao
    case MKD = "MKD" //Macedonia
    case MDG = "MDG" //Madagascar
    case MWI = "MWI" //Malawi
    case MYS = "MYS" //Malaysia
    case MDV = "MDV" //Maldives
    case MLI = "MLI" //Mali
    case MLT = "MLT" //Malta
    case MHL = "MHL" //Marshall Islands
    case MTQ = "MTQ" //Martinique
    case MRT = "MRT" //Mauritania
    case MUS = "MUS" //Mauritius
    case MYT = "MYT" //Mayotte
    case MEX = "MEX" //Mexico
    case FSM = "FSM" //Micronesia
    case MDA = "MDA" //Moldova
    case MCO = "MCO" //Monaco
    case MNG = "MNG" //Mongolia
    case MNE = "MNE" //Montenegro
    case MSR = "MSR" //Montserrat
    case MAR = "MAR" //Morocco
    case MOZ = "MOZ" //Mozambique
    case MMR = "MMR" //Myanmar
    case NAM = "NAM" //Namibia
    case NRU = "NRU" //Nauru
    case NPL = "NPL" //Nepal
    case NLD = "NLD" //Netherlands
    case ANT = "ANT" //Netherlands Antilles
    case NCL = "NCL" //New Caledonia
    case NZL = "NZL" //New Zealand
    case NIC = "NIC" //Nicaragua
    case NER = "NER" //Niger
    case NGA = "NGA" //Nigeria
    case NIU = "NIU" //Niue
    case NFK = "NFK" //Norfolk Island
    case PRK = "PRK" //North Korea
    case MNP = "MNP" //Northern Mariana Islands
    case NOR = "NOR" //Norway
    case OMN = "OMN" //Oman
    case PAK = "PAK" //Pakistan
    case PLW = "PLW" //Palau
    case PSE = "PSE" //Palestinian Territory
    case PAN = "PAN" //Panama
    case PNG = "PNG" //Papua New Guinea
    case PRY = "PRY" //Paraguay
    case PER = "PER" //Peru
    case PHL = "PHL" //Philippines
    case PCN = "PCN" //Pitcairn
    case POL = "POL" //Poland
    case PRT = "PRT" //Portugall
    case PRI = "PRI" //Puerto Rico
    case QAT = "QAT" //Qatar
    case COG = "COG" //Republic of the Congo
    case REU = "REU" //Reuinion
    case ROU = "ROU" //Romania
    case RUS = "RUS" //Russia
    case RWA = "RWA" //Rwanda
    case BLM = "BLM" //Saint Barthelemy
    case SHN = "SHN" //Saint Helena
    case KNA = "KNA" //Saint Kitts and Nevis
    case LCA = "LCA" //Saint Lucia
    case MAF = "MAF" //Saint Martin
    case SPM = "SPM" //Saint Pirre and Miquelon
    case VCT = "VCT" //Saint Vincent and the Grenadines
    case WSM = "WSM" //Samoa
    case SMR = "SMR" //San Marino
    case STP = "STP" //Sao Tome and Principe
    case SAU = "SAU" //Saudi Arabia
    case SEN = "SEN" //Senegal
    case SRB = "SRB" //Serbia
    case SCG = "SCG" //Serbia and Montenegro
    case SYC = "SYC" //Seychelles
    case SLE = "SLE" //Sierra Leone
    case SGP = "SGP" //Singapore
    case SXM = "SXM" //Sint Maarten
    case SVK = "SVK" //Slovakia
    case SVN = "SVN" //Slovenia
    case SLB = "SLB" //Solomon Islands
    case SOM = "SOM" //Somalia
    case ZAF = "ZAF" //South Africa
    case SGS = "SGS" //South Georgia and the South Sandwhich Islands
    case KOR = "KOR" //South Korea
    case SSD = "SSD" //South Sudan
    case ESP = "ESP" //Spain
    case LKA = "LKA" //Sri Lanka
    case SDN = "SDN" //Sudan
    case SUR = "SUR" //Suriname
    case SJM = "SJM" //Svalbard and Jan Mayen
    case SWZ = "SWZ" //Swaziland
    case SWE = "SWE" //Sweden
    case CHE = "CHE" //Switzerland
    case SYR = "SYR" //Syria
    case TWN = "TWN" //Taiwan
    case TJK = "TJK" //Tajikistan
    case TZA = "TZA" //Tanzania
    case THA = "THA" //Thailand
    case TGO = "TGO" //Togo
    case TKL = "TKL" //Tokelau
    case TON = "TON" //Tonga
    case TTO = "TTO" //Trinidad and Tobago
    case TUN = "TUN" //Tunisia
    case TUR = "TUR" //Turkey
    case TKM = "TKM" //Turkmenistan
    case TCA = "TCA" //Turks and Caicos Islands
    case TUV = "TUV" //Tuvalu
    case VIR = "VIR" //U.S. Virgin Islands
    case UGA = "UGA" //Uganda
    case UKR = "UKR" //Ukraine
    case ARE = "ARE" //United Arab Emirates
    case GBR = "GBR" //United Kingdom
    case USA = "USA" //United States
    case UMI = "UMI" //United States Minor Outlying Islands
    case URY = "URY" //Uruguay
    case UZB = "UZB" //Uzbekistan
    case VUT = "VUT" //Vanuatu
    case VAT = "VAT" //Vatican
    case VEN = "VEN" //Venezuela
    case VNM = "VNM" //Vietnam
    case WLF = "WLF" //Wallis and Futuna
    case ESH = "ESH" //Western Sahara
    case YEM = "YEM" //Yemen
    case ZMB = "ZMB" //Zambia
    case ZWE = "ZWE" //Zimbabwe
}

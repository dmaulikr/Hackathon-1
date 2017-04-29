//
//  Constants.swift

import Foundation
import UIKit

/* Callbacks */
// Typealias for callbacks used in Data Service
typealias callback = (_ success: Bool) -> ()

// Base URL
// Get information about the availability of a product using latitude and longitude.
let BASE_API_URL = "https://www.cannabisreports.com/api/v1.0/strains/VUJCJ4TYMG000000000000000/availability/geo/37.7749295/-122.4194155/10"

// Gets a paginated list of producer
let COMPANY_API_URL = "https://www.cannabisreports.com/api/v1.0/producers/0000000000VU7TG0000000000/extracts"

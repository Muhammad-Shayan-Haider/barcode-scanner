//
//  Alert.swift
//  BarcodeScanner
//
//  Created by Muhammad Shayan on 30/11/2024.
//

import SwiftUI


struct AlertItem: Identifiable {
    let id = UUID()
    let title: String
    let message: String
    let dismissButton: Alert.Button
}

struct AlertContext {
    static let invalidDeviceInput = AlertItem(title: "Invalid Device Input",
                                              message: "Something is wrong with the camera. We are unable to capture the input.",
                                              dismissButton: .default(Text("OK")))
    static let invalidDScannedType = AlertItem(title: "Invalid Scan Type",
                                              message: "The value scanned is not valid. The app scans EAN-8 and EAN-13 barcodes.",
                                              dismissButton: .default(Text("OK")))
}

//
//  Alert.swift
//  BarcodeScanner
//
//  Created by Muhammad Shayan on 30/11/2024.
//

import SwiftUI


struct AlertItem: Identifiable {
    let id = UUID()
    let title: Text
    let message: Text
    let dismissButton: Alert.Button
}

struct AlertContext {
    static let invalidDeviceInput = AlertItem(title: Text("Invalid Device Input"),
                                              message: Text("Something is wrong with the camera. We are unable to capture the input."),
                                              dismissButton: .default(Text("OK")))
    static let invalidDScannedType = AlertItem(title: Text("Invalid Scan Type"),
                                              message: Text("The value scanned is not valid. The app scans EAN-8 and EAN-13 barcodes."),
                                              dismissButton: .default(Text("OK")))
}

//
//  BarcodeScannerViewModel.swift
//  BarcodeScanner
//
//  Created by Muhammad Shayan on 30/11/2024.
//

import SwiftUI

final class BarcodeScannerViewModel: ObservableObject {
    
    @Published var scannedBarcode = ""
    @Published var alertItem: AlertItem?
    
    var statusText: String {
        scannedBarcode.isEmpty ? "Not yet scanned": scannedBarcode
    }
    
    var statusTextColor: Color {
        scannedBarcode.isEmpty ? .red:  .green
    }
}

//
//  ScannerView.swift
//  BarcodeScanner
//
//  Created by Muhammad Shayan on 30/11/2024.
//

import SwiftUI

struct ScannerView: UIViewControllerRepresentable {
    
    @Binding var scannedBarcode: String
    
    func makeUIViewController(context: Context) -> ScannerVC {
        ScannerVC(scannerDelegate: context.coordinator)
    }
    
    func updateUIViewController(_ uiViewController: ScannerVC, context: Context) {
        
    }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(scannerView: self)
    }
    
    // UIViewController talks to Coordinator and Coordinator
    // talks to SwiftUI View.
    final class Coordinator: NSObject, ScannerVCDelegate {
        
        private let scannerView: ScannerView
        
        init(scannerView: ScannerView) {
            self.scannerView = scannerView
        }
        
        func didFind(barcode: String) {
            self.scannerView.scannedBarcode = barcode
        }
        
        func didSurface(error: CameraError) {
            print(error.rawValue)
        }
    }
    
}

#Preview {
    ScannerView(scannedBarcode: .constant("123456"))
}

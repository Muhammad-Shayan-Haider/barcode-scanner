//
//  ScannerView.swift
//  BarcodeScanner
//
//  Created by Muhammad Shayan on 30/11/2024.
//

import SwiftUI

struct ScannerView: UIViewControllerRepresentable {
    
    func makeUIViewController(context: Context) -> ScannerVC {
        ScannerVC(scannerDelegate: context.coordinator)
    }
    
    func updateUIViewController(_ uiViewController: ScannerVC, context: Context) {
        
    }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator()
    }
    
    // UIViewController talks to Coordinator and Coordinator
    // talks to SwiftUI View.
    final class Coordinator: NSObject, ScannerVCDelegate {
        
        func didFind(barcode: String) {
            print(barcode)
        }
        
        func didSurface(error: CameraError) {
            print(error.rawValue)
        }
    }
    
}

#Preview {
    ScannerView()
}

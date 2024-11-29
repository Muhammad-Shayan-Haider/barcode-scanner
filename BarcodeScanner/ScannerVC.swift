//
//  ScannerVC.swift
//  BarcodeScanner
//
//  Created by Muhammad Shayan on 29/11/2024.
//

import UIKit
import AVFoundation

// UIViewController talks to Coordinator and Coordinator
// talks to SwiftUI View.

protocol ScannerVCDelegate: AnyObject {
    func didFind(barcode: String)
}

final class ScannerVC: UIViewController {
    
    let captureSession = AVCaptureSession()
    var previewLayer: AVCaptureVideoPreviewLayer?
    weak var scannerDelegate: ScannerVCDelegate?
    
    init(scannerDelegate: ScannerVCDelegate) {
        super.init(nibName: nil, bundle: nil)
        
        self.scannerDelegate = scannerDelegate
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupCaptureSession() {
        captureSession.sessionPreset = .photo
        
        guard let backCamera = AVCaptureDevice.default(for: .video) else { return }
        let viewInput: AVCaptureDeviceInput
        
        do {
            viewInput = try AVCaptureDeviceInput(device: backCamera)
        } catch {
            return
        }
        
        if captureSession.canAddInput(viewInput) {
            captureSession.addInput(viewInput)
        } else {
            return
        }
        
        let metadataOutput = AVCaptureMetadataOutput()
        
        if captureSession.canAddOutput(metadataOutput) {
            captureSession.addOutput(metadataOutput)
            metadataOutput.setMetadataObjectsDelegate(self, queue: .main)
            metadataOutput.metadataObjectTypes = [.ean8, .ean13]
        } else {
            return
        }
        
        let previewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
        previewLayer.videoGravity = .resizeAspectFill
        view.layer.addSublayer(previewLayer)
        self.previewLayer = previewLayer
        
        captureSession.startRunning()
    }
}


extension ScannerVC: AVCaptureMetadataOutputObjectsDelegate {
    
    func metadataOutput(_ output: AVCaptureMetadataOutput, didOutput metadataObjects: [AVMetadataObject], from connection: AVCaptureConnection) {
        guard let metadataObject = metadataObjects.first else { return }
        
        guard let readableObject = metadataObject as? AVMetadataMachineReadableCodeObject else { return }
        
        guard let barcode = readableObject.stringValue else { return }
        
        scannerDelegate?.didFind(barcode: barcode)
    }
}

        
        

//
//  CameraVC.swift
//  DevChat
//
//  Created by Mario Alberto Barragán Espinosa on 07/12/16.
//  Copyright © 2016 mario. All rights reserved.
//

import UIKit

class CameraVC: CameraViewController {

    @IBOutlet weak var previewView: PreviewView!
    @IBOutlet weak var cameraButton: UIButton!
    @IBOutlet weak var recordButton: UIButton!
    @IBOutlet weak var photoButton: UIButton!
    
    override func viewDidLoad() {
        
        _previewView = previewView
        _cameraButton = cameraButton
        _recordButton = recordButton
        _photoButton = photoButton
        
        super.viewDidLoad()
        
        toggleCaptureMode()
    }

    @IBAction func recordButtonPressed(_ sender: UIButton) {
        
        toggleMovieRecording()
    }
    
    @IBAction func photoButtonPressed(_ sender: UIButton) {
        
        capturePhoto()
    }
    @IBAction func changeCameraPressed(_ sender: UIButton) {
        
        changeCamera()
    }
    
}

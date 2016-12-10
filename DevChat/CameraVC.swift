//
//  CameraVC.swift
//  DevChat
//
//  Created by Mario Alberto Barragán Espinosa on 07/12/16.
//  Copyright © 2016 mario. All rights reserved.
//

import UIKit
import FirebaseAuth

class CameraVC: CameraViewController, CameraVCDelegate {

    @IBOutlet weak var previewView: PreviewView!
    @IBOutlet weak var cameraButton: UIButton!
    @IBOutlet weak var recordButton: UIButton!
    @IBOutlet weak var photoButton: UIButton!
    
    override func viewDidLoad() {
        
        delegate = self
        _previewView = previewView
        //_cameraButton = cameraButton
        //_recordButton = recordButton
        //_photoButton = photoButton
        
        super.viewDidLoad()
        
        toggleCaptureMode()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
        guard FIRAuth.auth()?.currentUser != nil else {
            performSegue(withIdentifier: "LoginVC", sender: nil)
            return
            //load login vc
        }
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
    
    func shouldEnableCameraUI(enabled: Bool) {
        
        cameraButton.isEnabled = enabled
        print("Should enable camera UI \(enabled)")
    }
    
    func shouldEnableRecordUI(enabled: Bool) {
        
        recordButton.isEnabled = enabled
        print("Should enable record UI \(enabled)")
    }
    
    func shouldEnablePhotoUI(enabled: Bool) {
        
        photoButton.isEnabled = enabled
        print("Should enable photo UI \(enabled)")
    }
    
    func recordingHasStarted() {
        
        print("Recording has started")
    }
    
    func canStartRecording() {
        
        print("Can start recording")
    }
    
}

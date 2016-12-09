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
    
    override func viewDidLoad() {
        
        self._previewView = previewView
        super.viewDidLoad()
    }

}

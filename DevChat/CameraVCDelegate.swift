//
//  CameraVCDelegate.swift
//  DevChat
//
//  Created by Mario Alberto Barragán Espinosa on 09/12/16.
//  Copyright © 2016 mario. All rights reserved.
//

import Foundation

protocol CameraVCDelegate {
    func shouldEnableRecordUI(enabled: Bool)
    func shouldEnableCameraUI(enabled: Bool)
    func shouldEnablePhotoUI(enabled: Bool)
    func canStartRecording()
    func recordingHasStarted()
    func videoRecordingComplete(videoURL: URL)
    func videoRecordingFailed()
}

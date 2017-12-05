//
//  ReplayKitRecording.swift
//  AR-Portal
//
//  Created by Quentin Faure on 05/12/2017.
//  Copyright © 2017 Quentin Faure. All rights reserved.
//
import UIKit
import ReplayKit

extension UIViewController {
    func startRecording(completionHandler:@escaping (_ result:Bool) -> Void) {
        if RPScreenRecorder.shared().isAvailable {
            RPScreenRecorder.shared().startRecording() { (error) in
                if error == nil {
                    print("started recording")
                    DispatchQueue.main.async { completionHandler(true) }
                    
                } else {
                    print("error starting screen recording")
                    DispatchQueue.main.async { completionHandler(false) }
                    
                }
            }
        } else {
            print("screen recorder not available")
            completionHandler(false)
            
        }
    }
    
    func stopRecording() {
        RPScreenRecorder.shared().stopRecording { (previewController, error) in
            if let previewController = previewController {
                DispatchQueue.main.async {
                    self.present(previewController, animated: true, completion: nil)
                }
            } else {
                print("error stopping recording (was it running?)")
                
            }
        }
    }
}

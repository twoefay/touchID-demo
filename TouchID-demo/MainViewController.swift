//
//  ViewController.swift
//  TouchID-demo
//
//  Created by Chris Orcutt on 4/20/16.
//  Copyright © 2016 Twoefay. All rights reserved.
//

import UIKit
import LocalAuthentication

class ViewController: UIViewController {

    let context = LAContext()
    let policy = LAPolicy.DeviceOwnerAuthenticationWithBiometrics
    let error = NSErrorPointer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func touchIDNotAvailable(){
        print("TouchID not available on this device.")
    }
    
    func authenticationSucceeded(){
        print("Authentication successful")
    }
    
    func authenticationFailed(error: NSError){
        print("Error occurred: \(error)")
    }
    
    @IBAction func buttonTapped(sender: AnyObject) {
        if context.canEvaluatePolicy(policy, error: error){
            context.evaluatePolicy(policy, localizedReason: "Pleace authenticate using TouchID"){ status, error in
                status ? self.authenticationSucceeded() : self.authenticationFailed(error!)
            }
        } else {
            touchIDNotAvailable()
        }
    }
    
}

//
//  AlertHandler.swift
//  AirWatch-SDK-iOS-Swift-Sample
//
//  Copyright © 2017 VMware, Inc.  All rights reserved
//
//  The BSD-2 license (the ìLicenseî) set forth below applies to all parts of the AirWatch-SDK-iOS-Swift
//  project.  You may not use this file except in compliance with the License.
//
//  BSD-2 License
//
//  Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:
//	  * Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.
//	  * Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the
//      documentation and/or other materials provided with the distribution.
//
//  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO,
//  THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS
//  BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
//  SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
//  WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE,
//  EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.


import Foundation
import UIKit


class AlertHandler{

    // MARK:- Messages / Dialogs
  
    typealias cancelButtonCompletionHandler = ((UIAlertAction) -> Void)?
    typealias okButtonCompletionHandler = ((UIAlertAction) -> Void)?

    
    
    

    public static func displayLoginError(requestingViewController : UIViewController) -> Void {
        print("Log In error with Int Auth")
        GeneralUtils.hideLoadingIndicator()
        displayAlert(requestingViewController: requestingViewController,withTitle: "Autentication Failed", withMessage: "Please make sure your enrollment credentials have access to this endpoint")
    }
    
    public static func tryAgain(requestingViewController : UIViewController) -> Void {
        print("Credentials Updated...try again")
        GeneralUtils.hideLoadingIndicator()
        displayAlert(requestingViewController: requestingViewController,withTitle: "Credentials Updated", withMessage: "Credentials Updated successfully, Please try again!")
    }
    
    public static func displayFetchUserInfoError(requestingViewController : UIViewController) -> Void {
        print("Log In error :: unable to fetch server information")
        GeneralUtils.hideLoadingIndicator()
        displayAlert(requestingViewController: requestingViewController,withTitle: "SDK Error", withMessage: "An Error Occured while SDK was trying to fetch user infor from AW backed. Please make sure your device is enrolled")
    }
    
    public static func displayInvalidURL(requestingViewController : UIViewController) -> Void{
        print("Log in Error :: invalid URL")
        GeneralUtils.hideLoadingIndicator()
        displayAlert(requestingViewController: requestingViewController,withTitle: "Invalid URL", withMessage: "Please confirm the formatting of the URL")
    }
    
    public static func displayNotSupportedAlert(requestingViewController : UIViewController) -> Void{
        print("Log In error :: Not supported")
        GeneralUtils.hideLoadingIndicator()
        displayAlert(requestingViewController: requestingViewController,withTitle: "Authentication Required", withMessage: "This type of Authentication challenge is not supported by the SDK")
    }
    
    

    
    public static func displayAlert(requestingViewController : UIViewController,withTitle title: String, withMessage message: String) {
        print("Log In error :: Not supported")
        GeneralUtils.hideLoadingIndicator()

        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Dismiss", style: .default, handler: {
            _ in
            print("Dismiss")
        })
        
        alert.addAction(okAction)
        OperationQueue.main.addOperation {
            requestingViewController.present(alert, animated: true, completion: nil)
        }
    }
    
    
    
    
    public static func displayAlertWithCompletionHandler(requestingViewController: UIViewController,withTitle title : String, withMessage message: String, okHandler : okButtonCompletionHandler, cancelHandler : cancelButtonCompletionHandler) -> Void {
        GeneralUtils.hideLoadingIndicator()
        let alert = UIAlertController(title: "AirWatch SDK Account", message: message, preferredStyle: .alert)
        

        let okAction = UIAlertAction(title: "Update", style: .default, handler: okHandler)
        let cancel = UIAlertAction(title: "Cancel", style: .default, handler: cancelHandler)

        
        alert.addAction(okAction)
        alert.addAction(cancel)
        
        OperationQueue.main.addOperation {
            requestingViewController.present(alert, animated: true, completion: nil)
            
        }
    }
    
}

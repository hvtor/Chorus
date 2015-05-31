//
//  ViewController.swift
//  Chorus
//
//  Created by Hemant V. Torsekar on 2015-05-29.
//  Copyright (c) 2015 Hemant V. Torsekar. All rights reserved.
//

import UIKit
import Parse
import ParseUI


class ViewController: UIViewController, PFLogInViewControllerDelegate, PFSignUpViewControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
            if (PFUser.currentUser()==nil) {
                var logInViewController = PFLogInViewController()
                var signUpViewController = PFSignUpViewController()
            
                logInViewController.fields = PFLogInFields.UsernameAndPassword | PFLogInFields.LogInButton | PFLogInFields.SignUpButton | PFLogInFields.PasswordForgotten | PFLogInFields.Facebook | PFLogInFields.Twitter

                logInViewController.logInView?.backgroundColor = UIColor .blackColor()
            
            
                logInViewController.delegate = self
            
                signUpViewController.delegate = self
                
                logInViewController.signUpController = signUpViewController
            
                var logoImage = UIImageView()
                logoImage.image = UIImage(named: "chorus")
                logoImage.contentMode = UIViewContentMode.ScaleAspectFill
            
                logInViewController.logInView?.logo = logoImage

                var logoImageSignUp = UIImageView()
                logoImageSignUp.image = UIImage(named: "chorus")
                logoImageSignUp.contentMode = UIViewContentMode.ScaleAspectFill
            
            
                signUpViewController.signUpView?.logo = logoImageSignUp
                signUpViewController.signUpView?.backgroundColor = UIColor .blackColor()
            
            
                self.presentViewController(logInViewController, animated: true, completion: nil)
            }
            println(PFUser.currentUser())
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


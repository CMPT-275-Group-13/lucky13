//
//  LoginViewController.swift
//  PAPER Planes
//
//  Created by Marco Liang on 2019-11-20.
//  Copyright © 2019 Angus Kan. All rights reserved.
//

import UIKit
import FirebaseUI

//TODO: Edit firebaseUI
class LoginViewController: UIViewController, FUIAuthDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let authUI = FUIAuth.defaultAuthUI()
        authUI?.delegate = self
        
        let providers: [FUIAuthProvider] = [
          FUIEmailAuth(),
          FUIGoogleAuth(),
        ]
        authUI?.providers = providers
        
        let authViewController = authUI!.authViewController()
        authViewController.modalPresentationStyle = .fullScreen
//        authViewController.popToRootViewController(animated: false)
        self.present(authViewController, animated: true, completion: nil)
        
    }
    
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any]) -> Bool {
        let sourceApplication = options[UIApplication.OpenURLOptionsKey.sourceApplication] as! String?
        if FUIAuth.defaultAuthUI()?.handleOpen(url, sourceApplication: sourceApplication) ?? false {
            return true
        }
        return false
    }
    
    func authUI(_ authUI: FUIAuth, didSignInWith user: User?, error: Error?) {
        switch error {
            case .some(let error as NSError) where UInt(error.code) == FUIAuthErrorCode.userCancelledSignIn.rawValue:
                print("User cancelled sign-in")
            case .some(let error as NSError) where error.userInfo[NSUnderlyingErrorKey] != nil:
                print("Login error: \(error.userInfo[NSUnderlyingErrorKey]!)")
            case .some(let error):
                print("Login error: \(error.localizedDescription)")
            case .none:
            if let user = user {
                //TODO: Login User
                self.dismiss(animated: true, completion: nil)
                self.performSegue(withIdentifier: "goHome", sender: self)
            }
            
        }
    }
    


}

extension FUIAuthBaseViewController{
    open override func viewWillAppear(_ animated: Bool) {
        self.navigationItem.leftBarButtonItem = nil
        self.navigationItem.title = "Login"
    }
}

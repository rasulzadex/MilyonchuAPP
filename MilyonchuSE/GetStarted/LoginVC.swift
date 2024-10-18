//
//  LoginVC.swift
//  MilyonchuSE
//
//  Created by Javidan on 05.10.24.
//

import UIKit

class LoginVC: UIViewController {

    @IBOutlet weak var continueLabel: UILabel!
    @IBOutlet weak var emailLbl: UILabel!
    @IBOutlet weak var pwdTf: UITextField!
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var pwdLbl: UILabel!
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var dontHaveLbl: UILabel!
    @IBOutlet weak var mainLoginButton: UIButton!
    @IBOutlet weak var welcomeBackLbl: UILabel!

    var userData: UserData?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let user = userData {
            emailTF.text = user.username
            pwdTf.text = user.password
        }
    }
    
    @IBAction func login(_ sender: Any) {
        guard let email = emailTF.text, !email.isEmpty else {
            showAlert(message: "Please enter your email.")
            return
        }
        guard let password = pwdTf.text, !password.isEmpty else {
            showAlert(message: "Please enter your password.")
            return
        }

        let storyboard = UIStoryboard(name: "Body", bundle: nil)
        if let newRootVC = storyboard.instantiateViewController(withIdentifier: "StartVC") as? StartVC {
            let sceneDelegate = UIApplication.shared.connectedScenes.first!.delegate as! SceneDelegate
            
            
            if let scene = UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate {
                scene.switchToMain()
            }
//            sceneDelegate.window?.rootViewController = newRootVC
//            sceneDelegate.window?.makeKeyAndVisible()
        }
    }


    @IBAction func clickSignUpButton(_ sender: UIButton) {
        let nextVC = storyboard?.instantiateViewController(withIdentifier: "SignUpVC") as! SignUpVC
        navigationController?.pushViewController(nextVC, animated: true)
    }
    
    func showAlert(message: String) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
}

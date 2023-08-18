//
//  LoginViewController.swift
//  Presentation Helper
//
//  Created by 서정덕 on 2023/08/19.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet var idTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var tryLoginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
        // Do any additional setup after loading the view.
    }
    
    func initUI() {
        tryLoginButton.layer.cornerRadius = 8
    }
    
    
    
    @IBAction func closeButtonClicked(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    @IBAction func tryLoginClicked(_ sender: Any) {
        let defaults = UserDefaults.standard
        defaults.set(idTextField.text!, forKey: "idKey")
        defaults.set(passwordTextField.text, forKey: "passwordKey")
        self.presentingViewController!.modalTransitionStyle = .crossDissolve
        let presentingVC = self.presentingViewController! as! WelcomeViewController
        presentingVC.tryLogin()
        self.dismiss(animated: true)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

//
//  WelcomeViewController.swift
//  Presentation Helper
//
//  Created by 서정덕 on 2023/08/19.
//

import UIKit

class WelcomeViewController: UIViewController {

    @IBOutlet var loginButton: UIButton!
    @IBOutlet var signupButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initUI()
        // Do any additional setup after loading the view.
    }
    
    func initUI() {
        loginButton.layer.cornerRadius = 8
        signupButton.layer.cornerRadius = 8
    }

    
    @IBAction func loginButtonClicked(_ sender: Any) {
        let loginVC = self.storyboard?.instantiateViewController(identifier: "LoginViewController") as! LoginViewController
        loginVC.modalPresentationStyle = .overFullScreen
        self.present(loginVC, animated: true)
    }
    
    @IBAction func signupButtonClicked(_ sender: Any) {
        let signupVC = self.storyboard?.instantiateViewController(identifier: "SignUpViewController") as! SignUpViewController
        signupVC.modalPresentationStyle = .overFullScreen
        self.present(signupVC, animated: true)
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

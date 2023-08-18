//
//  SignUpViewController.swift
//  Presentation Helper
//
//  Created by 서정덕 on 2023/08/19.
//

import UIKit

class SignUpViewController: UIViewController {

    @IBOutlet var trySignupButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
    }
    
    func initUI() {
        trySignupButton.layer.cornerRadius = 8
    }
    
    @IBAction func closeButtonClicked(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    @IBAction func trySignupClicked(_ sender: Any) {
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

//
//  MyPageViewController.swift
//  Presentation Helper
//
//  Created by 서정덕 on 2023/08/19.
//

import UIKit

class MyPageViewController: UIViewController {

    @IBOutlet var myIDLabel: UIStackView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func logoutButtonClicked(_ sender: Any) {
        // TODO: 로그인 정보 초기화
        let welcomeVC = storyboard?.instantiateViewController(identifier: "WelcomeViewController") as! WelcomeViewController
        welcomeVC.modalPresentationStyle = .overFullScreen
        present(welcomeVC, animated: true)
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

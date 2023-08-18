//
//  MyPageViewController.swift
//  Presentation Helper
//
//  Created by 서정덕 on 2023/08/19.
//

import UIKit

class MyPageViewController: UIViewController {

    @IBOutlet var myIDLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
        // Do any additional setup after loading the view.
    }
    
    func initUI() {
        guard let username = UserDefaults.standard.string(forKey: "idKey") else {
            print("idKey 없음")
            return
        }
        myIDLabel.text = username
        
        
    }
    
    @IBAction func closeButtonClicked(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    @IBAction func logoutButtonClicked(_ sender: Any) {
        // TODO: 로그인 정보 초기화
        UserDefaults.standard.set("", forKey: "idKey")
        UserDefaults.standard.set("", forKey: "passwordKey")
        self.presentingViewController?.presentingViewController?.dismiss(animated: true, completion: nil)
    }

}

//
//  addScriptViewController.swift
//  Presentation Helper
//
//  Created by 서정덕 on 2023/08/18.
//

import UIKit

class CreateScriptViewController: UIViewController {

    @IBOutlet var findTXTButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        initUI()
        // Do any additional setup after loading the view.
    }
    
    func initUI() {

        // addButton
        findTXTButton.layer.cornerRadius = findTXTButton.frame.height / 2
        findTXTButton.layer.shadowColor = UIColor.black.cgColor
        findTXTButton.layer.masksToBounds = false
        findTXTButton.layer.shadowOffset = CGSize(width: 0, height: 4)
        findTXTButton.layer.shadowRadius = 5
        findTXTButton.layer.shadowOpacity = 0.4
    }
    
    @IBAction func backButtonClicked(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    @IBAction func createFinishButtonClicked(_ sender: Any) {
        //
    }

    @IBAction func findTXTButtonClicked(_ sender: Any) {
    }
    
}

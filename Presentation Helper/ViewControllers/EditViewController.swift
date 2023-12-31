//
//  EditViewController.swift
//  Presentation Helper
//
//  Created by 서정덕 on 2023/08/18.
//

import UIKit

class EditViewController: UIViewController {
    @IBOutlet var titleTextField: UITextField!
    @IBOutlet var scriptTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func setData(script: ScriptModel) {
        titleTextField.text = script.title
        scriptTextView.text = script.script
    }
    
    @IBAction func backButtonClicked(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func EditfinishButtonClicked(_ sender: Any) {
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

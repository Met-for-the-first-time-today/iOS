//
//  DetailViewController.swift
//  Presentation Helper
//
//  Created by 서정덕 on 2023/08/18.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var scriptLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
        // Do any additional setup after loading the view.
    }
    
    func initUI(){
//        // titleTextField
//        titleTextField.layer.cornerRadius = 8
//        // scriptTextView
//        scriptTextView.layer.cornerRadius = 8
    }
    
    @IBAction func backButtonClicked(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func editButtonClicked(_ sender: Any) {
        let editVC = self.storyboard?.instantiateViewController(identifier: "EditViewController") as! EditViewController
        self.navigationController?.pushViewController(editVC, animated: true)
    }
}


extension DetailViewController: UITextViewDelegate {
    func textViewDidChange(_ textView: UITextView) {
            
            let size = CGSize(width: view.frame.width, height: .infinity)
            let estimatedSize = textView.sizeThatFits(size)
            
            textView.constraints.forEach { (constraint) in
            
              /// 180 이하일때는 더 이상 줄어들지 않게하기
                if estimatedSize.height <= 200 {
                
                }
                else {
                    if constraint.firstAttribute == .height {
                        constraint.constant = estimatedSize.height
                    }
                }
            }
        }
}

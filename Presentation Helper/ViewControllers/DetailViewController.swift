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
    
    var scriptData: ScriptModel?
    var titleValue: String = ""
    var scriptValue: String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
        // Do any additional setup after loading the view.
    }
    
    func initUI(){
        
        // titleLabel
        titleLabel.layer.cornerRadius = 8
        // scriptTextView
        scriptLabel.layer.cornerRadius = 8
        titleLabel.text = titleValue
        scriptLabel.text = scriptValue
    }
    
    @IBAction func backButtonClicked(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func editButtonClicked(_ sender: Any) {
        print("DetailViewController - editButtonClicked")
        let editVC = self.storyboard?.instantiateViewController(identifier: "EditViewController") as! EditViewController
        if scriptData == nil {
            print("scriptData 없음")
            return
        }
        editVC.setData(script: scriptData!)
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

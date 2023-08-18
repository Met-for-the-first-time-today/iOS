//
//  ListTableViewCell.swift
//  Presentation Helper
//
//  Created by 서정덕 on 2023/08/18.
//

import UIKit

class ListTableViewCell: UITableViewCell {
    @IBOutlet var rootView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        initUI()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    func initUI() {
        rootView.layer.cornerRadius = 8
        // 눌렸을때 색상 변함 없게
        self.selectionStyle = .none
    }
    
}

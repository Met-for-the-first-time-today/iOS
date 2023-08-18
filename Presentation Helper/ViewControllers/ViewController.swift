//
//  ViewController.swift
//  Presentation Helper
//
//  Created by 서정덕 on 2023/08/18.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var listTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        initUI()
    }
    
    func initUI() {
        
        // listTableView
        listTableView.dataSource = self
        listTableView.delegate = self
        listTableView.estimatedRowHeight = 100
        listTableView.rowHeight = UITableView.automaticDimension
        listTableView.contentInset = UIEdgeInsets(top: 16, left: 0, bottom: 0, right: 0)
        let listTableViewCell = UINib(nibName: "ListTableViewCell", bundle: nil)
        listTableView.register(listTableViewCell, forCellReuseIdentifier: "ListTableViewCell")
        // 네비게이션 바
        self.navigationController?.navigationBar.isHidden = true
        
    }


}
extension ViewController: UITableViewDataSource , UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = listTableView.dequeueReusableCell(withIdentifier: "ListTableViewCell") as! ListTableViewCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVC = self.storyboard?.instantiateViewController(identifier: "DetailViewController") as! DetailViewController
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
}


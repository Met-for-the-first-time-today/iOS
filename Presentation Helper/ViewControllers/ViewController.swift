//
//  ViewController.swift
//  Presentation Helper
//
//  Created by 서정덕 on 2023/08/18.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var listTableView: UITableView!
    @IBOutlet var addButton: UIButton!
    
    var scriptList: [ScriptModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
        fetchScripts()
        //로그인 정보 확인
        
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
        // addButton
        addButton.layer.cornerRadius = addButton.frame.height / 2
        addButton.layer.shadowColor = UIColor.black.cgColor
        addButton.layer.masksToBounds = false
        addButton.layer.shadowOffset = CGSize(width: 0, height: 4)
        addButton.layer.shadowRadius = 5
        addButton.layer.shadowOpacity = 0.4
    }
    
    func fetchScripts() {
        print("ViewController - fetchScripts")
        let headers = ["Content-Type": "application/json"]
        let defaults = UserDefaults.standard
        
        guard let token = defaults.string(forKey: "token") else {
            print("Token 없음")
            return
        }

        let urlString = "http://52.78.48.244:53330/script/search?token=\(token)"
        if let url = URL(string: urlString) {
            var request = URLRequest(url: url)
            request.httpMethod = "GET"
            request.allHTTPHeaderFields = headers
            
            let session = URLSession.shared
            let dataTask = session.dataTask(with: request) { data, response, error in
                if let error = error {
                    print("Error: \(error)")
                    return
                }
                
                guard let httpResponse = response as? HTTPURLResponse,
                      (200...299).contains(httpResponse.statusCode),
                      let data = data else {
                    print("Invalid response or data")
                    return
                }

                if let jsonObject = try? JSONSerialization.jsonObject(with: data, options: []),
                   let json = jsonObject as? [String: Any],
                   let status = json["status"] as? String,
                   status == "success",
                   let dataArray = json["data"] as? [[String: Any]] {
                    for scriptData in dataArray {
                        if let title = scriptData["title"] as? String,
                           let date = scriptData["createdAt"] as? String {
                            let script = ScriptModel()
                            script.title = title
                            script.date = date
                            self.scriptList.append(script)
//                            print("Title: \(title)")
//                            print("Date: \(date)")
//                            print("-----")
                        }
                    }
                } else {
                    print("Failed to decode JSON")
                }
                
                DispatchQueue.main.async {
                    self.listTableView.reloadData()
                }
            }
            dataTask.resume()
        } else {
            print("Invalid URL")
        }
    }



    
    @IBAction func myPageButtonClicked(_ sender: Any) {
        let myPageVC = self.storyboard?.instantiateViewController(identifier: "MyPageViewController") as! MyPageViewController
        myPageVC.modalPresentationStyle = .overFullScreen
        self.present(myPageVC, animated: true)
    }
    @IBAction func addButtonClicked(_ sender: Any) {
        let addScriptVC = self.storyboard?.instantiateViewController(identifier: "AddScriptViewController") as! CreateScriptViewController
        addScriptVC.modalPresentationStyle = .overFullScreen
        self.present(addScriptVC, animated: true)
    }
    
}
extension ViewController: UITableViewDataSource , UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return scriptList.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = listTableView.dequeueReusableCell(withIdentifier: "ListTableViewCell") as! ListTableViewCell
        cell.titleLabel.text = scriptList[indexPath.row].title
        cell.dateLabel.text = scriptList[indexPath.row].date
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVC = self.storyboard?.instantiateViewController(identifier: "DetailViewController") as! DetailViewController
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
}


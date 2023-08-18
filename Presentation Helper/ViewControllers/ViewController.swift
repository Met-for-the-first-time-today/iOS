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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
        //로그인 정보 확인
        // TODO: tryLogin() == false
        if tryLogin() != false {
            let welcomVC = self.storyboard?.instantiateViewController(identifier: "WelcomeViewController") as! WelcomeViewController
            welcomVC.modalPresentationStyle = .overFullScreen
            self.present(welcomVC, animated: false)
        }
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
    
    func tryLogin() -> Bool{
        let headers = ["Content-Type": "application/json"]
        let defaults = UserDefaults.standard
        
        guard let username = defaults.string(forKey: "idKey") else {
            print("username 없음")
            return false
        }
        guard let password = defaults.string(forKey: "passwordKey") else {
            print("passwordKey 없음")
            return false
        }
        // TODO: 로그인 시도
        // HTTP 요청 파라미터 설정
        let loginParameters = [
            "id": username,
            "password": password
        ] as [String: Any]
        // 로그인 파라미터를 JSON 데이터로 변환
        let postData = try? JSONSerialization.data(withJSONObject: loginParameters, options: [])
        
        let request = NSMutableURLRequest(url: NSURL(string: "http://localhost:3000/login")! as URL)
        request.httpMethod = "POST"
        request.allHTTPHeaderFields = headers
        request.httpBody = postData as Data?
        
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            if let error = error {
                print("Error: \(error)")
            } else if let httpResponse = response as? HTTPURLResponse {
                print("Response Code: \(httpResponse.statusCode)")
                
                if let data = data {
                    do {
                        let jsonResponse = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
                        print("JSON Response: \(jsonResponse ?? [:])")
                    } catch {
                        print("Error parsing JSON: \(error)")
                    }
                }
            }
        })

        return true
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


//
//  LoginViewController.swift
//  Presentation Helper
//
//  Created by 서정덕 on 2023/08/19.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet var idTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var tryLoginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
        // Do any additional setup after loading the view.
    }
    
    func initUI() {
        tryLoginButton.layer.cornerRadius = 8
    }
    
    func tryLogin() {
        print("WelcomeViewController - tryLogin")
        let headers = ["Content-Type": "application/json"]
        let defaults = UserDefaults.standard
        
        guard let username = defaults.string(forKey: "idKey") else {
            print("idKey 없음")
            return
        }
        guard let password = defaults.string(forKey: "passwordKey") else {
            print("passwordKey 없음")
            return
        }
        
        // HTTP 요청 파라미터 설정
        let loginParameters = [
            "id": username,
            "password": password
        ] as [String: Any]
        // 로그인 파라미터를 JSON 데이터로 변환
        guard let postData = try? JSONSerialization.data(withJSONObject: loginParameters, options: []) else {
            print("JSON 데이터 변환 오류")
            return
        }

        // TODO: 실제로 로그인 시도하는 코드 추가
        let request = NSMutableURLRequest(url: URL(string: "http://52.78.48.244:53330/login")!)
        request.httpMethod = "POST" // 로그인 시 POST 요청으로 변경
        request.allHTTPHeaderFields = headers
        request.httpBody = postData
        
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest) { (data, response, error) in
            if let error = error {
                print("Error: \(error)")
                return
            } else if let httpResponse = response as? HTTPURLResponse {
                print("Response Code: \(httpResponse.statusCode)")
                if let data = data {
                    DispatchQueue.global().async {
                        do {
                            if let jsonResponse = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any],
                               let status = jsonResponse["status"] as? String,
                               status == "success" {
                                print("로그인 성공!")
                                DispatchQueue.main.sync{
                                    let rootNavVC = self.storyboard?.instantiateViewController(identifier: "RootNavViewController") as! UINavigationController
                                    rootNavVC.modalPresentationStyle = .overFullScreen
                                    self.present(rootNavVC, animated: false)
                                }
                                // 토큰 정보 파싱 및 활용 가능
                                if let token = jsonResponse["data"] as? String {
                                    print("토큰: \(token)")
                                    // TODO: 토큰을 다음 요청에 사용하거나 저장할 수 있음
                                }
                            } else {
                                print("로그인 실패 또는 응답 형식 오류")
                            }
                        } catch {
                            print("Error parsing JSON: \(error)")
                        }
                    }
                }
            }
        }
        dataTask.resume()
    }
    
    @IBAction func closeButtonClicked(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    @IBAction func tryLoginClicked(_ sender: Any) {
        let defaults = UserDefaults.standard
        defaults.set(idTextField.text!, forKey: "idKey")
        defaults.set(passwordTextField.text, forKey: "passwordKey")
        self.presentingViewController!.modalTransitionStyle = .crossDissolve
        let presentingVC = self.presentingViewController! as! WelcomeViewController
        presentingVC.tryLogin()
        self.dismiss(animated: true)
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

//
//  ViewController.swift
//  57
//
//  Created by 築山朋紀 on 2019/03/23.
//  Copyright © 2019 tomoki. All rights reserved.
//

import UIKit
import Alamofire

struct HomeModel: Codable {
    let body: String
    let user: UserModel
    
    enum CodingKeys: String, CodingKey {
        case body = "content"
        case user = "account"
    }
}

struct UserModel: Codable {
    let name: String
    let iconURL: String
    
    enum CodingKeys: String, CodingKey {
        case name = "display_name"
        case iconURL = "avatar_static"
    }
}

protocol NibInitializable {}

extension NibInitializable where Self: UIView {    
    static var nib: UINib {
        return UINib(nibName: String(describing: self), bundle: nil)
    }
    
    static var name: String {
        return String(describing: self)
    }
}

extension UIView: NibInitializable {}

class ViewController: UIViewController, UITableViewDataSource {
    
    private var homeModel = [HomeModel]()
    @IBOutlet private weak var tableView: UITableView! {
        didSet {
            tableView.tableFooterView = UIView()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.tableFooterView = UIView()
        tableView.register(HomeTableViewCell.nib, forCellReuseIdentifier: HomeTableViewCell.name)
        request()
    }
    
    private func request() {
        Alamofire.request("https://qiitadon.com/api/v1/timelines/public?local=something").responseJSON { response in
            switch response.result {
            case .success:
                do {
                    guard let data = response.data else { return }
                    let decoder = JSONDecoder()
                    let decoded = try decoder.decode([HomeModel].self, from: data)
                    self.homeModel = decoded
                    self.tableView.reloadData()
                } catch {
                    print("失敗しました")
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: HomeTableViewCell.name, for: indexPath) as? HomeTableViewCell else {
            assertionFailure("error")
            return UITableViewCell()
        }
        cell.update(with: homeModel[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return homeModel.count
    }
}


//
//  ViewController.swift
//  30
//
//  Created by 築山朋紀 on 2019/02/24.
//  Copyright © 2019 tomoki. All rights reserved.
//

import UIKit
import Alamofire
import SafariServices

class ViewController: UIViewController {
    
    private let cellID = "articleCell"
    private var articles = [ArticleModel]()
    
    @IBOutlet private weak var tableView: UITableView! {
        didSet {
            tableView.delegate = self
            tableView.dataSource = self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        send()
    }
    
    private func send() {
        Alamofire.request("https://qiita.com/api/v2/items?page=1&per_page=20").responseJSON { response in
            guard let data = response.data else { return }
            let result = try! JSONDecoder().decode([ArticleModel].self, from: data)
            self.articles += result
            self.tableView.reloadData()
        }
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath)
        cell.textLabel?.text = articles[indexPath.row].title
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let safariView = SFSafariViewController(url: articles[indexPath.row].URL)
        present(safariView, animated: true)
    }
}

struct ArticleModel: Codable {
    /// 投稿のタイトル
    let title: String
    
    /// 投稿のURL
    let URL: Foundation.URL
}

extension ArticleModel {
    
    enum CodingKeys: String, CodingKey {
        case title        = "title"
        case URL          = "url"
    }
    
}

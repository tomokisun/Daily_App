//
//  ViewController.swift
//  90
//
//  Created by 築山朋紀 on 2019/04/25.
//  Copyright © 2019 tomoki. All rights reserved.
//

import UIKit
import SafariServices

class ViewController: UITableViewController {
    
    private var searchController = UISearchController()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setLayoutSearchBar()
        tableView.tableFooterView = UIView()
        tableView.register(ArticleTableViewCell.nib, forCellReuseIdentifier: ArticleTableViewCell.name)
    }
    
    private func setLayoutSearchBar() {
        let resultController = SearchResultViewController()
        searchController = UISearchController(searchResultsController: resultController)
        searchController.hidesNavigationBarDuringPresentation = true
        searchController.dimsBackgroundDuringPresentation = true
        self.definesPresentationContext = true
        let searchBar = searchController.searchBar
        searchBar.placeholder = "Search"
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        searchBar.sizeToFit()
        searchController.searchResultsUpdater = resultController
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let url = URL(string: "https://github.com/tomoki69386/Daily_App/blob/master/\(indexPath.row + 1)/README.md") else { return }
        print(url)
        let target = SFSafariViewController(url: url)
        self.present(target, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articleModel.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ArticleTableViewCell.name) as? ArticleTableViewCell else {
            return UITableViewCell()
        }
        cell.update(with: articleModel[indexPath.row])
        return cell
    }
}

class SearchResultViewController: UITableViewController {
    
    private var resultModel = [ArticleModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.tableFooterView = UIView()
        tableView.register(ArticleTableViewCell.nib, forCellReuseIdentifier: ArticleTableViewCell.name)
    }
    
}

extension SearchResultViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        guard let text = searchController.searchBar.text else { return }
        print(text)
        /// 検索する
    }
}

extension SearchResultViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return resultModel.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ArticleTableViewCell.name) as? ArticleTableViewCell else {
            return UITableViewCell()
        }
        cell.update(with: resultModel[indexPath.row])
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(resultModel[indexPath.row])
    }
}


struct ArticleModel {
    let gifURL: String
    let day: String
    let name: String
    
    init(gifURL: String, day: String, name: String) {
        self.gifURL = gifURL
        self.day = day
        self.name = name
    }
}


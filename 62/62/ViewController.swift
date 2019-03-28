//
//  ViewController.swift
//  62
//
//  Created by 築山朋紀 on 2019/03/28.
//  Copyright © 2019 tomoki. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import Template

extension UILabel {
    static func label() -> UILabel {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.init(name: "HiraginoSans-W6", size: 10)
        return label
    }
}

struct AppSubject {
    private init() {}
    
    static let frappucino = PublishSubject<(Bool, Int)>()
}

class ViewController: UIViewController {
    
    private let disposeBag = DisposeBag()
    private let sections = ["select Frappucino", "select customize"]
    private let frappucino = ["キャラメルフラペチーノ", "コーヒーフラペチーノ", "ダークモカチップフラペチーノ", "抹茶クリームフラペチーノ", "バニラクリームフラペチーノ", "マンゴーパッションティーフラペチーノ"]
    private let customize = ["エクストラホイップ", "キャラメルソース追加", "チョコチップ追加", "バニラシロップ追加", "キャラメルシロップ追加", "モカシロップ追加", "ホワイトモカシロップ追加", "ヘーゼルナッツシロップ追加", "アーモンドトフィーシロップ追加", "クラシックシロップ追加", "チャイシロップ追加", "バレンシアシロップ追加", "ジンジャーシロップ追加"]
    private var items = [String]() {
        didSet {
            for _view in stackView.subviews {
                self.stackView.removeArrangedSubview(_view)
                _view.removeFromSuperview()
            }
            for item in items {
                let label = UILabel.label()
                label.text = item
                self.stackView.addArrangedSubview(label)
            }
        }
    }
    
    @IBOutlet private weak var frappucinoLabel: UILabel!
    @IBOutlet private weak var stackView: UIStackView!
    
    @IBOutlet private weak var tableView: UITableView! {
        didSet {
            tableView.allowsMultipleSelection = false
            tableView.register(FrappucinoTableViewCell.nib, forCellReuseIdentifier: FrappucinoTableViewCell.name)
            tableView.register(ToppingTableViewCell.nib, forCellReuseIdentifier: ToppingTableViewCell.name)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        AppSubject.frappucino.subscribe(onNext: { [weak self] index in
            if index.0 {
                self?.applend(with: index.1)
            } else {
                self?.remove(with: index.1)
            }
        }).disposed(by: disposeBag)
    }
    
    private func remove(with index: Int) {
        items.remove(element: customize[index])
    }
    
    private func applend(with index: Int) {
        items.append(customize[index])
    }
}

extension ViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sections[section]
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return frappucino.count
        } else {
            return customize.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: FrappucinoTableViewCell.name) as? FrappucinoTableViewCell else {
                fatalError()
            }
            cell.label.text = frappucino[indexPath.row]
            return cell
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: ToppingTableViewCell.name) as? ToppingTableViewCell else {
                fatalError()
            }
            cell.label.text = customize[indexPath.row]
            cell.switchButton.tag = indexPath.row
            return cell
        }
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0 {
            let cell = tableView.cellForRow(at:indexPath)
            cell?.accessoryType = .checkmark
            frappucinoLabel.text = frappucino[indexPath.row]
        }
    }
    
    // セルの選択が外れた時に呼び出される
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        if indexPath.section == 0 {
            let cell = tableView.cellForRow(at:indexPath)
            cell?.accessoryType = .none
        }
    }
}

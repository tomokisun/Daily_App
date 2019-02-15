//
//  ViewController.swift
//  21
//
//  Created by 築山朋紀 on 2019/02/15.
//  Copyright © 2019 tomoki. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet private weak var myCollectionView : UICollectionView!
    
    private var calendar = Calendar.current
    private var currentDate = Date()
    private var numberOfItems: Int!
    private var daysPerWeek = 7
    private var currntMonthOfDates = [Date]()
    private var selectedDate = Date()
    private var days = 0
    private var Array = [String]()
    private var index: IndexPath!
    private var row = 0
    
    private var y = 0
    private var m = 0
    private var d = 0
    
    private var doneView: DoneAddView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //今の年月日を取得
        let date = Date()
        let year = calendar.component(.year, from: date)
        let month = calendar.component(.month, from: date)
        let day = calendar.component(.day, from: date)
        y = year
        m = month
        d = day
        
        doneView = UINib(nibName: "DoneAddView", bundle: nil).instantiate(withOwner: self, options: nil)[0] as? DoneAddView
        doneView.frame = CGRect(x: 0, y: view.frame.height, width: view.frame.width, height: 367)
        doneView.delegate = self
        view.addSubview(doneView)
        
        self.navigationItem.title = "\(year)年\(month)月"
        
        firstWeek(year: year, month: month)
        
        myCollectionView.dataSource = self
        myCollectionView.delegate = self
    }
    
    private func setDoneTaskhidden(_ hidden: Bool) {
        if hidden {
            UIView.animate(withDuration: 0.5) {
                self.doneView.frame.origin.y = self.view.frame.height - 367
            }
        } else {
            UIView.animate(withDuration: 0.5) {
                self.doneView.frame.origin.y = self.view.frame.height
            }
        }
    }
    
    func firstWeek(year: Int, month: Int) {
        guard let august2017 = calendar.date(from: DateComponents(year: year, month: month)) else { return }
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "d"
        dateFormatter.calendar = calendar
        let yearMonthFomatter = DateFormatter()
        yearMonthFomatter.dateFormat = "yyyy 年 M 月"
        yearMonthFomatter.calendar = calendar
        Array.removeAll()
        self.navigationItem.title = "\(y)年\(month)月"
        
        var components = calendar.dateComponents([.year, .month], from: august2017)
        for i in 1...6 {
            components.weekOfMonth = i
            for weekDay in 1...7 {
                components.weekday = weekDay
                guard let date = calendar.date(from: components) else { return }
                Array.append(dateFormatter.string(from: date))
            }
        }
        myCollectionView.reloadData()
    }
}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 42
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyCell", for: indexPath) as! CalendarCollectionViewCell
        cell.update(day: Array[indexPath.row], indexPath: indexPath)
        let cellSelectedBgView = UIView()
        cellSelectedBgView.backgroundColor = .green
        cell.selectedBackgroundView = cellSelectedBgView
        return cell
    }
    
    
}

class CalendarCollectionViewCell: UICollectionViewCell {
    @IBOutlet private weak var Label: UILabel!
    
    func update(day: String, indexPath: IndexPath) {
        Label.text = day
        
        //Colorの設定
        if (indexPath.row == 0) {
            //indexPath.rowが0のときは日曜日
            self.Label.textColor = UIColor.red
        }else if (indexPath.row == 6 || indexPath.row == 13 || indexPath.row == 20 || indexPath.row == 27 || indexPath.row == 34 || indexPath.row == 41) {
            //土曜日
            self.Label.textColor = UIColor.blue
        }else if (indexPath.row % 7 == 0) {
            //Cell番号が7の倍数の時(日曜日)
            self.Label.textColor = UIColor.red
        }else {
            self.Label.textColor = UIColor.black
        }
        
        if (indexPath.row <= 5) {
            //当月以外の日にちのカラーをグレーに変更する
            if (self.Label.text == "25" || self.Label.text == "26" || self.Label.text == "27" || self.Label.text == "28" || self.Label.text == "29" || self.Label.text == "30" || self.Label.text == "31") {
                self.Label.textColor = UIColor.gray
            }
        }else if (indexPath.row >= 28) {
            //当月以外の日にちのカラーをグレーに変更する
            if (self.Label.text == "1" || self.Label.text == "2" || self.Label.text == "3" || self.Label.text == "4" || self.Label.text == "5" || self.Label.text == "6" || self.Label.text == "7" || self.Label.text == "8" || self.Label.text == "9" || self.Label.text == "10" || self.Label.text == "11" || self.Label.text == "12" || self.Label.text == "13" || self.Label.text == "14") {
                self.Label.textColor = UIColor.gray
            }
        }
    }
    
    func updateColor(row: Int) {
        self.backgroundColor = UIColor.green
        self.contentView.backgroundColor = UIColor.green
    }
}

extension ViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.row)
        index = indexPath
        row = indexPath.row
//        setDoneTaskhidden(true)
    }
}

extension ViewController: DoneAddViewDelegate {
    func textField(_ view: DoneAddView, text: String) {
        print(text)
//        setDoneTaskhidden(false)
        let cell = myCollectionView.dequeueReusableCell(withReuseIdentifier: "MyCell", for: index) as! CalendarCollectionViewCell
        cell.updateColor(row: row)
        myCollectionView.reloadData()
    }
}

extension UIColor {
    convenience init(hex: String, alpha: CGFloat) {
        let v = hex.map { String($0) } + Array(repeating: "0", count: max(6 - hex.count, 0))
        let r = CGFloat(Int(v[0] + v[1], radix: 16) ?? 0) / 255.0
        let g = CGFloat(Int(v[2] + v[3], radix: 16) ?? 0) / 255.0
        let b = CGFloat(Int(v[4] + v[5], radix: 16) ?? 0) / 255.0
        self.init(red: r, green: g, blue: b, alpha: alpha)
    }
    
    convenience init(hex: String) {
        self.init(hex: hex, alpha: 1.0)
    }
}

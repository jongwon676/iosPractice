//
//  TableViewController.swift
//  temp2
//
//  Created by 성용강 on 09/11/2018.
//  Copyright © 2018 성용강. All rights reserved.
//
import SnapKit
import UIKit

struct Message{
    let text: String
    let isInComig: Bool
    let date: Date
}
extension Date{
    static func dateFromCustomString(customString: String) -> Date{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy"
        return dateFormatter.date(from: customString) ?? Date()
    }
}

class TableViewController: UITableViewController {
    
    
    class DateHeaderLabel: UILabel{
        override init(frame: CGRect) {
            super.init(frame: frame)
            backgroundColor = UIColor.black
            textColor = .white
            textAlignment = .center
        }
        required init?(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        override var intrinsicContentSize: CGSize{
            let height = super.intrinsicContentSize.height
            let width = super.intrinsicContentSize.width
            self.layer.cornerRadius = height / 2
            self.layer.masksToBounds = true
            return CGSize(width: width + 12, height: height + 12)
        }
    }
    
    var db = [[Message]]()
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Message"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        let Msgs = [
            Message(text: "asdfasfasdfasd;fasdfaadfadfadsfjdk;fadf", isInComig: true, date: Date.dateFromCustomString(customString: "03/11/2018")),
            Message(text: "asdfasfasdfasd;fasdfaasdfasdfasdfjdk;fadf", isInComig: false, date: Date.dateFromCustomString(customString: "03/11/2018")),
            Message(text: "asdfasfasdfasd;fasdffasdfasdfasdfajdk;fadf", isInComig: true, date: Date.dateFromCustomString(customString: "03/11/2018")),
            Message(text: "asdfasfasdfasd;fasdfajdk;fadf", isInComig: true, date: Date.dateFromCustomString(customString: "03/11/2018")),
            Message(text: "asdfasfasdfasd;fasadsfasdfdfadfsasdfasdajdk;fadf", isInComig: false, date: Date.dateFromCustomString(customString: "02/11/2018")),
            Message(text: "asdfasfasdfasd;fasadfdfajdk;fadasdfasdfasdfasdff", isInComig: true, date: Date.dateFromCustomString(customString: "04/11/2018")),
            Message(text: "asdfasfasdfasd;fazxcvzxcvsdfajdk;fadf", isInComig: false, date: Date.dateFromCustomString(customString: "02/11/2018")),
            Message(text: "asdfasfazxcvzcvxsdfasd;fasdfajdk;fadf", isInComig: false, date: Date.dateFromCustomString(customString: "04/11/2018")),
            Message(text: "asdzxcvzvxfasfasdfasd;fasdfajdk;fadf", isInComig: false, date: Date.dateFromCustomString(customString: "04/11/2018"))
        ]
        
        let dateList = Array(Set(Msgs.map({ $0.date }))).sorted()
        for x in 0..<dateList.count{
            db.append([Message]())
        }
        
        Msgs.map({
            let idx = dateList.firstIndex(of: $0.date)!
            db[idx].append($0)
        })
        
        
        
        
        
  
        tableView.register(TableViewCell.self, forCellReuseIdentifier: TableViewCell.cellId)
        self.tableView.backgroundColor = #colorLiteral(red: 0.7427546382, green: 0.8191892505, blue: 0.8610599637, alpha: 1)
        self.tableView.separatorStyle = .none
        self.tableView.allowsSelection = false
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        return db.count
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return db[section].count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.cellId, for: indexPath) as! TableViewCell
        cell.message = db[indexPath.section][indexPath.row]
        return cell
    }
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let container = UIView()
        let dateLabel = DateHeaderLabel()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy"
        dateLabel.text = dateFormatter.string(from: db[section].first?.date ?? Date())
        container.addSubview(dateLabel)
        dateLabel.snp.makeConstraints { (mk) in
            mk.centerX.equalTo(container)
            mk.centerY.equalTo(container)
        }
        
        return container
    }
}

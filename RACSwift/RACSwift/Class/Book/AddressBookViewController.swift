//
//  AddressBookViewController.swift
//  RACSwift
//
//  Created by hanbo on 2019/3/13.
//  Copyright © 2019 hanbo. All rights reserved.
//

import UIKit

class AddressBookViewController: BaseViewController {
    
    static let CellIdentifien = "CellIdentifi"
    @objc dynamic var rawCount: Int = 20
    
    // MARK: - 懒加载
    lazy var tableView: UITableView = {
       let tableView = getTableView()
        tableView.dataSource = addressViewModel
        tableView.delegate = addressViewModel
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: AddressBookViewController.CellIdentifien)
        return tableView
    }()
    
    lazy var addressViewModel: AddressViewModel = {
        let addressViewModel = AddressViewModel()
        
        return addressViewModel
    }()
    
    func getTableView()->UITableView{
        return UITableView.init(frame: CGRect.init(x: 0, y: 0, width: kScreenWidth, height: kScreenHeight), style: .plain)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createrSubViews()
       
        
        // KVO
        tableView.reactive.signal(forKeyPath: "contentOffset").observeValues { (contentOffset) in
            guard let contenOffset = contentOffset else {return}
            print("contentSize: \(contenOffset)")
        }
        
        
        reactive.signal(forKeyPath: "rawCount").observeValues { [weak self] (value) in
            guard let value = value else {return}
            self?.addressViewModel.rawCount = value as! Int
            self?.tableView .reloadData()
        }
        
        addressViewModel.sectionCount = 1
        addressViewModel.rawCount = rawCount
        addressViewModel.cellRowHeight = 60
        
//        addressViewModel.formattedHomeGoals <~ reactive.signal(forKeyPath: "rawCount").filterMap({ $0 })
//        let name = MutableProperty(0)
//        name.value = r
//        name.value = addressViewModel.rawCount
        
//        let a = Property(initial: 0, then: reactive.signal(forKeyPath: "rawCount"))
//         self.rawCount <~ a
//        self.reactive.rawCount <~ a
        
//        self.rawCount <~ a
//        self.rawCount <~ name
    }
    
    // 创建子View
    func createrSubViews() {
        view.backgroundColor = UIColor.cyan
        view.addSubview(tableView)
        tableView.backgroundColor = UIColor.lightGray
        
        // 配置cell
        addressViewModel.cellRander = {indexPath,tableView in
            let cell = tableView.dequeueReusableCell(withIdentifier: AddressBookViewController.CellIdentifien, for: indexPath)
            cell.textLabel?.text = "测试\(indexPath.row)"
            return cell
        }
        
        // cell点击事件
        addressViewModel.cellSlect = { [weak self] indexPath,tableView in
            print("select: \(indexPath.row)")
            
            guard let strongSelf = self else { return }
            
//            strongSelf.rawCount += 1
            strongSelf.addressViewModel.rawCount += 1
            
            strongSelf.tableView .reloadData()
            
            let index = IndexPath(row: strongSelf.rawCount, section: 0)
            strongSelf.tableView.scrollToRow(at: index, at: UITableView.ScrollPosition.middle, animated: true)
        }
    }
    
   override func configureNavigationBar() {
        navigationItem.title = "地址"
    }
}


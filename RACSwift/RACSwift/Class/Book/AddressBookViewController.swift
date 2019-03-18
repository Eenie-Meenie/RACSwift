//
//  AddressBookViewController.swift
//  RACSwift
//
//  Created by hanbo on 2019/3/13.
//  Copyright © 2019 hanbo. All rights reserved.
//

import UIKit

class AddressBookViewController: UIViewController {
    

    // MARK: - 懒加载
    lazy var tableView: UITableView = {
        let tableView = UITableView.init(frame: UIScreen.main.bounds, style: .grouped)
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createrSubViews()
        configureNavigationBar()
        // Do any additional setup after loading the view.
    }
    
    // 创建子View
    func createrSubViews() {
        view.backgroundColor = UIColor.cyan
        view.addSubview(tableView)
        tableView.backgroundColor = UIColor.lightGray
    }
    
    func configureNavigationBar() {
        navigationItem.title = "通讯录"
    }
}

extension AddressBookViewController {
    
}

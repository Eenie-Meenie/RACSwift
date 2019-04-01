//
//  MessageDetailViewController.swift
//  RACSwift
//
//  Created by hanbo on 2019/4/1.
//  Copyright © 2019 hanbo. All rights reserved.
//

import UIKit

class MessageDetailViewController: CustomNavBarViewController {
    
  

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.yellow
        // Do any additional setup after loading the view.
    }
    
    override func configureNavigationBar() {

        navBar.title = "消息详情"
        navBar.wr_setLeftButton(title: "<<", titleColor: UIColor.white)
        navBar.barBackgroundColor = UIColor.red
    }
}

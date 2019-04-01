//
//  CustomNavBarViewController.swift
//  RACSwift
//
//  Created by hanbo on 2019/4/1.
//  Copyright © 2019 hanbo. All rights reserved.
//

import UIKit

class CustomNavBarViewController: BaseViewController {
    
    // 自定义导航栏
    lazy var navBar: WRCustomNavigationBar = {
        let navBar = WRCustomNavigationBar.CustomNavigationBar()
        // 设置自定义导航栏标题颜色
        navBar.titleLabelColor = .white
        // 设置自定义导航栏左右按钮字体颜色
        navBar.wr_setTintColor(color: .white)
        return navBar
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = true
        view.addSubview(navBar)
        // Do any additional setup after loading the view.
    }

}

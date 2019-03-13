//
//  HomeViewController.swift
//  GIFImageCompress
//
//  Created by hanbo on 2019/2/26.
//  Copyright © 2019 hanbo. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        createrSubViews()
        configureNavigationBar()
    }
    
    // 创建子View
    func createrSubViews() {
        view.backgroundColor = UIColor.red
    }
    
    func configureNavigationBar() {
        
       navigationItem.title = "首页"
        
    }
}

extension HomeViewController {
    
}

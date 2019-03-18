//
//  SecondViewController.swift
//  RACSwift
//
//  Created by hanbo on 2019/3/18.
//  Copyright © 2019 hanbo. All rights reserved.
//

import UIKit
import ReactiveSwift
import ReactiveCocoa
import Result
import enum Result.NoError


class SecondViewController: UIViewController {
    
    // 代理信号
    let (signalDelegate, observeDelegate) = Signal<String,NoError>.pipe()

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        observeDelegate.send(value: "123")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        createrSubViews()
        configureNavigationBar()
        // Do any additional setup after loading the view.
    }
    
    // 创建子View
    func createrSubViews() {
        view.backgroundColor = UIColor.cyan
    }
    
    func configureNavigationBar() {
        navigationItem.title = "第二页"
    }

}

//
//  SecondViewController.swift
//  RACSwift
//
//  Created by hanbo on 2019/3/18.
//  Copyright © 2019 hanbo. All rights reserved.
//

import UIKit

class SecondViewController: BaseViewController {
    
    // 代理信号
    let (signalDelegate, observeDelegate) = Signal<String,NoError>.pipe()

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        observeDelegate.send(value: "123")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createrSubViews()
        // Do any additional setup after loading the view.
    }
    
    // 创建子View
    func createrSubViews() {
        view.backgroundColor = UIColor.cyan
        
        view.addSubview(button)
        button.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
            make.width.equalTo(100)
            make.height.equalTo(50)
        }
    }
    
  override  func configureNavigationBar() {
        navigationItem.title = "第二页"
        
        // 设置导航栏颜色
        navBarBarTintColor = UIColor.init(red: 247/255.0, green: 247/255.0, blue: 247/255.0, alpha: 1.0)
        
        // 设置初始导航栏透明度
        navBarBackgroundAlpha = 0
        
        // 设置导航栏按钮和标题颜色
        navBarTintColor = .white
        
        // 标题白色
        navBarTitleColor = .white
        
        
        
    }
    
    /// 跳转按钮
    lazy var button: UIButton = {
        let button = UIButton.init(type: .custom)
        button.setTitle("通知", for: .normal)
        button.backgroundColor = UIColor.white
        button.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        button.setTitleColor(UIColor.darkText, for: .normal)
        button.layer.cornerRadius = 5
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.lightGray.cgColor
        button.reactive.controlEvents(.touchUpInside).observeValues({ [weak self] (button)  in
            NotificationCenter.default.post(name: RacNotificationName, object: "abc")
        })
        return button
    }()
}

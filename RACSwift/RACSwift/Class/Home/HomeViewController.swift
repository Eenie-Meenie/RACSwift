//
//  HomeViewController.swift
//  GIFImageCompress
//
//  Created by hanbo on 2019/2/26.
//  Copyright © 2019 hanbo. All rights reserved.
//

import UIKit
@_exported import ReactiveSwift
@_exported import ReactiveCocoa
@_exported import Result
@_exported import enum Result.NoError

class HomeViewController: BaseViewController {
    
    @objc dynamic var someValue = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        createrSubViews()
        configureNavigationBar()
        // 创建热信号
        createrHotSignal()
        createrKVO()
        // 通知
        createrNotification()
        
        someValue = 1
    }
    
    // MARK - lazy load
    /// 跳转按钮
    lazy var button: UIButton = {
        let button = UIButton.init(type: .custom)
        button.setTitle("跳转", for: .normal)
        button.backgroundColor = UIColor.white
        button.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        button.setTitleColor(UIColor.darkText, for: .normal)
        button.layer.cornerRadius = 5
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.lightGray.cgColor
        button.reactive.controlEvents(.touchUpInside).observeValues({ [weak self] (button)  in
            self?.pushSecondViewController()
        })
        return button
    }()
    
    /**
     *  跳转到下个界面
     */
    func pushSecondViewController() {
        let secondVC = SecondViewController()
        secondVC.signalDelegate.observeValues({ (value) in
            print("delegate: \(value)")
        })
        self.navigationController?.pushViewController(secondVC, animated: true)
    }
}

extension HomeViewController {
    
    func createrHotSignal() {
        // 通过管道创建热信号
        
        let (signalA, observeA) = Signal<String,NoError>.pipe()
        let (signalB, observeB) = Signal<String,NoError>.pipe()

        // 信号合并
        Signal.combineLatest(signalA,signalB).observeValues({ (a,b) in
             print("收到的值\(a) + \(b)")
        })

        // 处理事件
        signalB.observe { (value) in
            print("signalB: \(value.value ?? "0")")
        }
        
        // 只处理value事件
        signalA.observeValues { (value) in
            print("siganlA: \(value)")
        }
        
        // 处理所有事件
        signalA.observeResult { (result) in
            print("处理所有事件")
        }
    
        
        observeA.send(value: "1")
        observeA.sendCompleted()

        observeB.send(value: "2")
        observeB.sendCompleted()
    }
    
    /// KVO
    func createrKVO() {
        // KVO 对于NSObject的子类可以直接使用, 对于Swift的原生类需要加上dynamic修饰.
        reactive.signal(forKeyPath: "someValue").observeValues { [weak self] (value) in
            guard let value = value else {return}
            print("someValue: \(value)")
        }
    }
    
    
    // 注册通知
    func createrNotification() {
        NotificationCenter.default.reactive.notifications(forName: RacNotificationName, object: nil).observeValues { (value) in

            guard let object = value.object else {return}
            print("notifation: \(object)")
        }
    }
    
    // 创建子View
    func createrSubViews() {
        view.backgroundColor = UIColor.red
        view.addSubview(button)
        button.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
            make.width.equalTo(100)
            make.height.equalTo(50)
        }
    }
    
    func configureNavigationBar() {
        navigationItem.title = "首页"
    }
}

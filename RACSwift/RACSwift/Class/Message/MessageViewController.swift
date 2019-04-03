//
//  MessageViewController.swift
//  RACSwift
//
//  Created by hanbo on 2019/3/13.
//  Copyright © 2019 hanbo. All rights reserved.
//

import UIKit

class MessageViewController: CustomNavBarViewController {
    
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
            let secondVC = MessageDetailViewController()
            self?.navigationController?.pushViewController(secondVC, animated: true)
        })
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        createrSubViews()
        netWorking()  // 网络请求
        // Do any additional setup after loading the view.
    }
    
    // 创建子View
    func createrSubViews() {
    
        view.backgroundColor = UIColor.green
        view.addSubview(button)
        button.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
            make.width.equalTo(100)
            make.height.equalTo(50)
        }
    }
    
    override func configureNavigationBar() {
        navBar.title = "消息"
//        navBar.wr_setLeftButton(title: "<<", titleColor: UIColor.white)
        navBar.barBackgroundColor = UIColor.purple
    }
    
    // 模拟添加2个网络请求
    func netWorking() {
        
        let (signalA, observerA) = Signal<String, NoError>.pipe()
        
        let (signalB, observerB) = Signal<String, NoError>.pipe()
        
        Signal.combineLatest(signalA, signalB).observeValues { (str1, str2) in
            print("----\(str1) --- + ---\(str2)---")
        }
        
        
        
        DispatchQueue.global().asyncAfter(deadline: .now() + 2) {
            
            DispatchQueue.main.async {
                 print("1111")
                observerA.send(value: "1")
                observerA.sendCompleted()
            }
        }

        DispatchQueue.global().asyncAfter(deadline: .now() + 5) {
            
            DispatchQueue.main.async {
                print("2222")
                observerB.send(value: "2")
                observerB.sendCompleted()
            }
        }
    }

}

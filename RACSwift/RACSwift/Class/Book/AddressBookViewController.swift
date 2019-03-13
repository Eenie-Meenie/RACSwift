//
//  AddressBookViewController.swift
//  RACSwift
//
//  Created by hanbo on 2019/3/13.
//  Copyright © 2019 hanbo. All rights reserved.
//

import UIKit

class AddressBookViewController: UIViewController {

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
        
        navigationItem.title = "通讯录"
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
//
//  PublishViewController.swift
//  RACSwift
//
//  Created by hanbo on 2019/3/13.
//  Copyright © 2019 hanbo. All rights reserved.
//

import UIKit

class PublishViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        createrSubViews()
    }
    

    // 创建子View
    func createrSubViews() {
        view.backgroundColor = UIColor.purple
    }
    
    override func configureNavigationBar() {
        navigationItem.title = "新闻"
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

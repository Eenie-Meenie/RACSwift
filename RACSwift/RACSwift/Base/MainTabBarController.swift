//
//  MainTabBarController.swift
//  RACSwift
//
//  Created by hanbo on 2019/3/13.
//  Copyright © 2019 hanbo. All rights reserved.
//

import UIKit

class MainTabBarController: CYLTabBarController {
    
    // 创建tabbarController
    class func createrMainTabVC() -> MainTabBarController? {
        
        let tabBarItemOne = [CYLTabBarItemTitle:"首页",
                             CYLTabBarItemImage:"home_normal",
                             CYLTabBarItemSelectedImage:"home_highlight"]
        
        let tabBarItemTwo = [CYLTabBarItemTitle:"同城",
                             CYLTabBarItemImage:"mycity_normal",
                             CYLTabBarItemSelectedImage:"mycity_highlight"]
        
        let tabBarItemThree = [CYLTabBarItemTitle:"消息",
                               CYLTabBarItemImage:"message_normal",
                               CYLTabBarItemSelectedImage:"message_highlight"]
        
        let tabBarItemFour = [CYLTabBarItemTitle:"我的",
                              CYLTabBarItemImage:"account_normal",
                              CYLTabBarItemSelectedImage:"account_highlight"]
        
        let tabBarItemsAttributes = [tabBarItemOne,tabBarItemTwo,tabBarItemThree,tabBarItemFour]
        
        let home = UINavigationController(rootViewController: HomeViewController())
        let connection = UINavigationController(rootViewController: AddressBookViewController())
        let message = UINavigationController(rootViewController: MessageViewController())
        let personal =   UINavigationController(rootViewController: MineViewController())
        let viewControllers = [home, connection, message, personal]
        
        let tabBarVC = MainTabBarController.init(viewControllers: viewControllers, tabBarItemsAttributes: tabBarItemsAttributes)
        
        return tabBarVC
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    /// 设置控制器
    func setupViewControllers() {

        let navc1 = UINavigationController.init(rootViewController: HomeViewController())
        
        let navc2 = UINavigationController.init(rootViewController: AddressBookViewController())
        
        let navc3 = UINavigationController.init(rootViewController: MessageViewController())
        
        let navc4 = UINavigationController.init(rootViewController: MineViewController())
        
        self.viewControllers = [navc1,navc2,navc3,navc4]
    }
    
    func setupCustomControllers() {
        
        let tabBarItemOne = [CYLTabBarItemTitle:"首页",
                             CYLTabBarItemImage:"home_normal",
                             CYLTabBarItemSelectedImage:"home_highlight"]
        
        let tabBarItemTwo = [CYLTabBarItemTitle:"同城",
                             CYLTabBarItemImage:"mycity_normal",
                             CYLTabBarItemSelectedImage:"mycity_highlight"]
        
        let tabBarItemThree = [CYLTabBarItemTitle:"消息",
                               CYLTabBarItemImage:"message_normal",
                               CYLTabBarItemSelectedImage:"message_highlight"]
        
        let tabBarItemFour = [CYLTabBarItemTitle:"我的",
                              CYLTabBarItemImage:"account_normal",
                              CYLTabBarItemSelectedImage:"account_highlight"]
        
        let tabBarItemsAttributes = [tabBarItemOne,tabBarItemTwo,tabBarItemThree,tabBarItemFour]
        
        self.tabBarItemsAttributes = tabBarItemsAttributes
        
    }
    
 
}

extension MainTabBarController:UITabBarControllerDelegate{

    
    
    
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        self.updateSelectionStatusIfNeeded(for: tabBarController, shouldSelect: viewController)
        return true
    }
    
}

//
//  CYCustomTabBarButton.swift
//  RACSwift
//
//  Created by hanbo on 2019/3/13.
//  Copyright © 2019 hanbo. All rights reserved.
//

import UIKit

import CYLTabBarController

class CYCustomTabBarButton: CYLPlusButton,CYLPlusButtonSubclassing {

    static func plusButton() -> Any! {
        
        let button = CYCustomTabBarButton()
        button.setImage(UIImage(named: "post_normal"), for: .normal)
        button.titleLabel?.textAlignment = .center
        
        button.titleLabel?.font = UIFont.systemFont(ofSize: 10)
        
//        button.setTitle("发布", for: .normal)
//        button.setTitleColor(UIColor.gray, for: .normal)
        
//        button.setTitle("选中", for: .selected)
        //        button.setTitleColor(UIColor(r: 255, g: 102, b: 0), for: .selected)
        
//        button.setTitleColor(UIColor.init(red: 255, green: 102, blue: 0, alpha: 1.0), for: .selected)
//        button.setTitleColor(UIColor.red, for: .selected)
        
       button.frame = CGRect.init(x: 0, y: 0, width: 200, height: 200)
        
        button.adjustsImageWhenHighlighted = false
        button.sizeToFit()
        return button
    }
    
    static func indexOfPlusButtonInTabBar() -> UInt {
        return 2
    }
    
//    static func multiplier(ofTabBarHeight tabBarHeight: CGFloat) -> CGFloat {
//        return 0.3
//    }
    
    static func constantOfPlusButtonCenterYOffset(forTabBarHeight tabBarHeight: CGFloat) -> CGFloat {
        return -10
    }
    
    static func plusChildViewController() -> UIViewController! {
        let vc = PublishViewController()
        let nav = UINavigationController(rootViewController: vc)
        return nav
    }
    
    static func shouldSelectPlusChildViewController() -> Bool {
        return true
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        // tabbar UI layout setup
        let imageViewEdgeWidth:CGFloat  = self.bounds.size.width 
        let imageViewEdgeHeight:CGFloat = imageViewEdgeWidth * 0.9
        
        let centerOfView    = self.bounds.size.width * 0.5
        let labelLineHeight = self.titleLabel!.font.lineHeight
        let verticalMargin = (self.bounds.size.height - labelLineHeight - imageViewEdgeHeight ) * 0.5
        
        let centerOfImageView = verticalMargin + imageViewEdgeHeight * 0.5
        let centerOfTitleLabel = imageViewEdgeHeight + verticalMargin * 2  + labelLineHeight * 0.5 + 10
        
        //imageView position layout
        self.imageView!.bounds = CGRect(x:0, y:0, width:imageViewEdgeWidth, height:imageViewEdgeHeight)
        self.imageView!.center = CGPoint(x:centerOfView, y:centerOfImageView)
        
        //title position layout
        self.titleLabel!.bounds = CGRect(x:0, y:0, width:self.bounds.size.width,height:labelLineHeight)
        self.titleLabel!.center = CGPoint(x:centerOfView, y:centerOfTitleLabel)
    }
    
}


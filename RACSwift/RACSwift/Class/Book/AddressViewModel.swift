//
//  AddressControllerConfigure.swift
//  RACSwift
//
//  Created by hanbo on 2019/3/18.
//  Copyright © 2019 hanbo. All rights reserved.
//

import UIKit


typealias CellSelectBlock = (_ indexPath:IndexPath,_ tableView:UITableView) -> Void
typealias CellRenderBlock = (_ indexPath:IndexPath,_ tablleView:UITableView) -> UITableViewCell

class AddressViewModel: NSObject {
    
    /// cell点击事件
    var cellSlect:CellSelectBlock?
    
    /// cell渲染
    var cellRander:CellRenderBlock?
    
    /// 预估高度
    var estimatedHeight:CGFloat = 50
    
    /// 行高
    var cellRowHeight:CGFloat = UITableView.automaticDimension
    
    /// 分区数
    var sectionCount:Int = 0
    
    /// 行数
    var rawCount:Int = 0
}

// MARK: - UITableViewDataSource,UITableViewDelegate
extension AddressViewModel:UITableViewDataSource,UITableViewDelegate {
    
    /**
     *  分区数
     */
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionCount
    }
    
    /**
     *  行数
     */
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rawCount
    }
    
    /**
     *  cell配置
     */
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = cellRander?(indexPath, tableView)
        return cell ?? UITableViewCell()
    }
    
    /**
     *  行高
     */
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return  cellRowHeight
    }
    
    /**
     *  点击事件
     */
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        cellSlect?(indexPath,tableView)
    }
}

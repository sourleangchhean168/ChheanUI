//
//  DynamicTableView.swift
//  Listing
//
//  Created by andrewcls on 2/16/20.
//  Copyright © 2020 Mac. All rights reserved.
//

import Foundation
import UIKit

public class DynamicTableView: UITableView {
    
    private let defaultforCellReuseIdentifier = "menu_cell_default"
    public var datasouce:(titles: [String], subTitle: [String])? = nil
    public var didSelectedIndex: ((_ index: Int) -> Void)?
    public var isCellHasTitle: Bool = true
    public var titleCellColor:UIColor = .black
    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        self.register(DynamicTableViewCell.self, forCellReuseIdentifier: self.defaultforCellReuseIdentifier)
        self.delegate = self
        self.dataSource = self
        self.contentInset = UIEdgeInsets.zero
        self.separatorStyle = .none
        self.isScrollEnabled = true
        self.estimatedRowHeight = 50
//        self.rowHeight = UITableView.automaticDimension

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    class DynamicTableViewCell: UITableViewCell {
        
        fileprivate var titleConstraint:NSLayoutConstraint?
        
        lazy var icon:UIImageView = {
            var img = UIImageView(frame: CGRect(x: 30, y: 0, width: 50, height: 50 ))
            img.translatesAutoresizingMaskIntoConstraints = false
            img.contentMode = UIView.ContentMode.scaleAspectFit
            return img
        }()
        
        lazy var title:UILabel = {
            var lbl = UILabel(frame: CGRect(x: 45, y: 0, width: self.frame.width, height: 40 ))
            lbl.font = UIFont.boldSystemFont(ofSize: 14.0)
            lbl.translatesAutoresizingMaskIntoConstraints = false
            return lbl
        }()
        
        lazy var subTitle:UILabel = {
            var lbl = UILabel(frame: CGRect(x: 45, y: 0, width: self.frame.width, height: 40 ))
            lbl.textColor = .black
            lbl.text = "10 new feeds"
            lbl.textColor = .black
            lbl.sizeToFit()
            lbl.numberOfLines = 0
            lbl.font = UIFont.systemFont(ofSize: 14.0)
            lbl.translatesAutoresizingMaskIntoConstraints = false
            return lbl
        }()
        
        override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
            super.init(style: style, reuseIdentifier: reuseIdentifier)
            
            [
                self.title,
                self.subTitle
                
            ].forEach({self.addSubview($0)})
            
            self.selectionStyle = .none
            self.backgroundColor = .white
            
//            self.title.anchor(top: self.topAnchor, leading: self.trailingAnchor, bottom: nil, trailing: self.trailingAnchor, pedding: UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 0), size: CGSize.init(width: 0, height: 50))
            
            
            
            self.title.anchor(top: self.topAnchor, leading: self.leadingAnchor, bottom: nil, trailing: self.trailingAnchor, pedding: UIEdgeInsets(top: 5, left: 10, bottom: 5, right: 10), size: .init(width: 0, height: 30))
            
            self.titleConstraint = self.title.heightAnchor.constraint(equalToConstant: 0)
//            self.titleConstraint?.isActive = true
            
            
            self.subTitle.anchor(top: self.title.bottomAnchor, leading: self.leadingAnchor, bottom: self.bottomAnchor, trailing: self.trailingAnchor, pedding: UIEdgeInsets(top: 0, left: 10, bottom: 5, right: 10), size: .zero)


        }
        
        required init?(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        override func awakeFromNib() {
            super.awakeFromNib()
            // Initialization code
        }
        
        func isCellHasInformation(_ isNoTitle:Bool){
            self.titleConstraint?.isActive = isNoTitle != true ? true : false
        }
        
        override func setSelected(_ selected: Bool, animated: Bool) {
            super.setSelected(selected, animated: animated)
            
            // Configure the view for the selected state
        }
        
    }

}


extension DynamicTableView: UITableViewDataSource, UITableViewDelegate{
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let data = datasouce{
            return data.titles.count == 0 ? data.subTitle.count : data.titles.count
        }else{
            return 0
        }
    }
    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:DynamicTableViewCell = tableView.dequeueReusableCell(withIdentifier: self.defaultforCellReuseIdentifier) as! DynamicTableView.DynamicTableViewCell
        
        if let source = datasouce{
            cell.title.text = source.titles.count != 0 ? source.titles[indexPath.row] : ""
            cell.subTitle.text = source.subTitle.count != 0 ? source.subTitle[indexPath.row] : ""
        }else{
            cell.title.text = "No data"
            cell.subTitle.text = "No Data"
        }
        
        if self.isCellHasTitle == false{
            cell.isCellHasInformation(false)
        }else{
            cell.isCellHasInformation(true)
            cell.title.textColor = self.titleCellColor
        }
        
        
        return cell
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("hello\(indexPath.row)")
        self.didSelectedIndex!(indexPath.row)
    }
    
}

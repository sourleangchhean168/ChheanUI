//
//  UIViewAutoLayout.swift
//  gdtApp
//
//  Created by Mac on 5/1/19.
//  Copyright © 2019 Mac. All rights reserved.
//

import Foundation
import UIKit

public extension UIView{
    func fillSuperView(){
        anchor(top: superview?.topAnchor, leading: superview?.leadingAnchor, bottom: superview?.bottomAnchor, trailing: superview?.trailingAnchor)
    }
    
    func fillSuperView(view: UIView){
        anchor(top: view.topAnchor, leading: view.leadingAnchor, bottom: view.bottomAnchor, trailing: view.trailingAnchor)
    }
    
    func fillSuperView(pedding: UIEdgeInsets = .zero){
        translatesAutoresizingMaskIntoConstraints = false
        topAnchor.constraint(equalTo: superview!.topAnchor, constant: pedding.top).isActive = true
        leadingAnchor.constraint(equalTo: superview!.leadingAnchor, constant: pedding.left).isActive = true
        bottomAnchor.constraint(equalTo: superview!.bottomAnchor, constant: -pedding.bottom).isActive = true
        trailingAnchor.constraint(equalTo: superview!.trailingAnchor, constant: -pedding.right).isActive = true
    }
    
    func anchorSize(to view: UIView){
        translatesAutoresizingMaskIntoConstraints = false
        widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
    }
    
    func anchorCenter(to view: UIView){
        translatesAutoresizingMaskIntoConstraints = false
        centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
    func anchorCenterX(to view: UIView){
        translatesAutoresizingMaskIntoConstraints = false
        centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    func anchorTopCenterX(to view: UIView, top: CGFloat){
        translatesAutoresizingMaskIntoConstraints = false
        if #available(iOS 11.0, *) {
            topAnchor.constraint(equalToSystemSpacingBelow: view.topAnchor, multiplier: top).isActive = true
        } else {
            // Fallback on earlier versions
        }
        centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
    }
    
    func anchorCenterXPedding(to view: UIView,constant: CGFloat){
        translatesAutoresizingMaskIntoConstraints = false
        centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: constant).isActive = true
        centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
    func anchorCenterY(to view: UIView){
        translatesAutoresizingMaskIntoConstraints = false
        centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
    func anchorCenterYPedding(to view: UIView,constant: CGFloat){
        translatesAutoresizingMaskIntoConstraints = false
        centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: constant).isActive = true
        centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    func anchorSize(size: CGSize = .zero){
        translatesAutoresizingMaskIntoConstraints = false
        if size.width != 0{
            widthAnchor.constraint(equalToConstant: size.width).isActive = true
        }
        
        if size.height != 0{
            heightAnchor.constraint(equalToConstant: size.height).isActive = true
        }
    }
    
    func anchor(top: NSLayoutYAxisAnchor?, leading: NSLayoutXAxisAnchor?, bottom: NSLayoutYAxisAnchor?, trailing: NSLayoutXAxisAnchor?, pedding: UIEdgeInsets = .zero, size: CGSize = .zero){
        
        translatesAutoresizingMaskIntoConstraints = false
        if let top = top{
            topAnchor.constraint(equalTo: top, constant: pedding.top).isActive = true
        }
        
        if let leading = leading{
            leadingAnchor.constraint(equalTo: leading, constant: pedding.left).isActive = true
        }
        
        if let bottom = bottom{
            bottomAnchor.constraint(equalTo: bottom, constant: -pedding.bottom).isActive = true
        }
        
        if let trailing = trailing{
            trailingAnchor.constraint(equalTo: trailing, constant: -pedding.right).isActive = true
        }
        
        if size.width != 0{
            widthAnchor.constraint(equalToConstant: size.width).isActive = true
        }
        
        if size.height != 0{
            heightAnchor.constraint(equalToConstant: size.height).isActive = true
        }
    }
    
    func anchorTop(at view:UIView){
        
        translatesAutoresizingMaskIntoConstraints = false
        topAnchor.constraint(equalTo: view.topAnchor).isActive = true
    }
    
    func anchorTop(at view:UIView, top: CGFloat){
        
        translatesAutoresizingMaskIntoConstraints = false
        topAnchor.constraint(equalTo: view.topAnchor, constant: top).isActive = true
    }
    
    func anchorTop(from view:UIView, top: CGFloat){
        
        translatesAutoresizingMaskIntoConstraints = false
        topAnchor.constraint(equalTo: view.bottomAnchor, constant: top).isActive = true
    }
    
    func anchorTop(anchor: NSLayoutYAxisAnchor, top: CGFloat){
        
        translatesAutoresizingMaskIntoConstraints = false
        topAnchor.constraint(equalTo: anchor, constant: top).isActive = true
    }
    
    func anchorLeft(anchor: NSLayoutXAxisAnchor){
        
        translatesAutoresizingMaskIntoConstraints = false
        leadingAnchor.constraint(equalTo: anchor).isActive = true
    }
    
    func anchorLeft(anchor: NSLayoutXAxisAnchor, left: CGFloat){
        
        translatesAutoresizingMaskIntoConstraints = false
        leadingAnchor.constraint(equalTo: anchor, constant: left).isActive = true
    }
    
    func anchorRight(at view:UIView){
        
        translatesAutoresizingMaskIntoConstraints = false
        trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }
    
    func anchorRight(anchor: NSLayoutXAxisAnchor, right: CGFloat){
        
        translatesAutoresizingMaskIntoConstraints = false
        trailingAnchor.constraint(equalTo: anchor, constant: -right).isActive = true
    }
    
    func anchorBottom(anchor: NSLayoutYAxisAnchor, bottom: CGFloat){
        
        translatesAutoresizingMaskIntoConstraints = false
        bottomAnchor.constraint(equalTo: anchor, constant: -bottom).isActive = true
    }
    
    func anchorPedding(pedding:UIEdgeInsets = .zero){
        translatesAutoresizingMaskIntoConstraints = false
        if pedding.top != 0{
            topAnchor.constraint(equalTo: topAnchor, constant: pedding.top).isActive = true
        }
        
        if pedding.left != 0{
            leadingAnchor.constraint(equalTo: leadingAnchor, constant: pedding.left).isActive = true
        }
        
        if pedding.bottom != 0{
            bottomAnchor.constraint(equalTo: bottomAnchor, constant: -pedding.bottom).isActive = true
        }
        
        if pedding.right != 0{
            trailingAnchor.constraint(equalTo: trailingAnchor, constant: -pedding.right).isActive = true
        }
    }
    
    func setContentScroll(_ view: UIView) -> CGFloat{
        
        var height: CGFloat = 0
        let elements = view.subviews as [UIView]
        
        if elements.count > 0{
            let lastView = elements.last
            height = (lastView!.frame.origin.y) + 60
        }
        
        return height 
    }
    
    func equalHeight(to view: UIView){
        translatesAutoresizingMaskIntoConstraints = false
        heightAnchor.constraint(equalTo: view.heightAnchor,multiplier: 1).isActive = true
    }
    
    func equalWidth(to view: UIView){
        translatesAutoresizingMaskIntoConstraints = false
        widthAnchor.constraint(equalTo: view.widthAnchor,multiplier: 1).isActive = true
    }
    
    func equalHeight(to view: UIView, multiplier: CGFloat){
        translatesAutoresizingMaskIntoConstraints = false
        heightAnchor.constraint(equalTo: view.heightAnchor,multiplier: multiplier).isActive = true
    }
    
    func equalWidth(to view: UIView, multiplier: CGFloat){
        translatesAutoresizingMaskIntoConstraints = false
        widthAnchor.constraint(equalTo: view.widthAnchor,multiplier: multiplier).isActive = true
    }
    

}


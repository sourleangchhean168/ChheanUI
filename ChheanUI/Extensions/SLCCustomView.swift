//
//  SLCCustomView.swift
//  Listing
//
//  Created by andrewcls on 2/16/20.
//  Copyright © 2020 Mac. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable
public class SLCCustomView: UIView{
    
    func dropShadow(color: UIColor, opacity: Float = 0.5, offSet: CGSize, radius: CGFloat = 1, scale: Bool = true) {
            layer.masksToBounds = false
            layer.shadowColor = color.cgColor
            layer.shadowOpacity = opacity
            layer.shadowOffset = offSet
            layer.shadowRadius = radius
    }
    
    @IBInspectable var cornerRadius: Double {
         get {
           return Double(self.layer.cornerRadius)
         }set {
           self.layer.cornerRadius = CGFloat(newValue)
         }
    }
    @IBInspectable var borderWidth: Double {
          get {
            return Double(self.layer.borderWidth)
          }
          set {
           self.layer.borderWidth = CGFloat(newValue)
          }
    }
    @IBInspectable var borderColor: UIColor? {
         get {
            return UIColor(cgColor: self.layer.borderColor!)
         }
         set {
            self.layer.borderColor = newValue?.cgColor
         }
    }
    @IBInspectable var shadowColor: UIColor? {
        get {
           return UIColor(cgColor: self.layer.shadowColor!)
        }
        set {
           self.layer.shadowColor = newValue?.cgColor
        }
    }
    @IBInspectable var shadowOpacity: Float {
        get {
           return self.layer.shadowOpacity
        }
        set {
           self.layer.shadowOpacity = newValue
       }
    }
}

public class SLCCustomButton: UIButton{

    
    func dropShadow(color: UIColor, opacity: Float = 0.5, offSet: CGSize, radius: CGFloat = 1, scale: Bool = true) {
            layer.masksToBounds = false
            layer.shadowColor = color.cgColor
            layer.shadowOpacity = opacity
            layer.shadowOffset = offSet
            layer.shadowRadius = radius
    }
    
    @IBInspectable var cornerRadius: Double {
         get {
            return Double(7.0)//Double(self.layer.cornerRadius)
         }set {
           self.layer.cornerRadius = CGFloat(newValue)
         }
    }
    @IBInspectable var borderWidth: Double {
          get {
            return Double(self.layer.borderWidth)
          }
          set {
           self.layer.borderWidth = CGFloat(newValue)
          }
    }
    @IBInspectable var borderColor: UIColor? {
         get {
            return UIColor(cgColor: self.layer.borderColor!)
         }
         set {
            self.dropShadow(color: .shadowGray, opacity: 0.2, offSet: CGSize (width: 0.2, height: 0.2) , radius: 20, scale: true)
            self.layer.borderColor = newValue?.cgColor
         }
    }
    @IBInspectable var shadowColor: UIColor? {
        get {
           return UIColor(cgColor: self.layer.shadowColor!)
        }
        set {
           self.layer.shadowColor = newValue?.cgColor
        }
    }
    @IBInspectable var shadowOpacity: Float {
        get {
           return self.layer.shadowOpacity
        }
        set {
           self.layer.shadowOpacity = newValue
       }
    }
}




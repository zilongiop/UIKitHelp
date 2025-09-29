//
//  File.swift
//  UIExtensionCloseure
//
//  Created by OuLu on 2025/8/27.
//

import Foundation
import UIKit

public extension UIView {
    
    var oX: CGFloat {get{return self.frame.origin.x} set(x){self.frame.origin.x = x}}
    var oY: CGFloat {get{return self.frame.origin.y} set(y){self.frame.origin.y = y}}
    var width: CGFloat {get{return self.frame.size.width} set(width){self.frame.size.width = width}}
    var height:CGFloat {get{return self.frame.size.height} set(height){self.frame.size.height = height}}
    var centerX:CGFloat {get{return self.center.x} set(centerX){self.center.x = centerX}}
    var centerY:CGFloat {get{return self.center.y} set(centerY){self.center.y = centerY}}

    
    func border(color: UIColor, width: CGFloat) -> Self {
        layer.borderColor = color.cgColor
        layer.borderWidth = width
        return self
    }
    
    func borderRadius(radius: CGFloat) -> Self {
        layer.masksToBounds = true
        layer.cornerRadius = radius
        return self
    }
    
    func backgroundColor(color: UIColor) -> Self {
        self.backgroundColor = color
        return self
    }
    func shadow(color: UIColor, offset: CGSize, radius: CGFloat, opacity: Float) -> Self {
        layer.shadowColor = color.cgColor
        layer.shadowOffset = offset
        layer.shadowRadius = radius
        layer.shadowOpacity = opacity
        return self
    }
    
    private struct ObjcEventKeys {
        @MainActor static var tapGestureActionKey = "UIView.GestureTapAction"
    }
    func onGestureClick(_ action: @escaping () -> Void) -> Self {
        if (self.isUserInteractionEnabled == false) {
            self.isUserInteractionEnabled = true
        }
        let tapGesture =  UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
        tapGesture.numberOfTapsRequired = 1
        self.addGestureRecognizer(tapGesture)
        tapAction = action
        return self
    }
    private var tapAction: (() -> Void)? {
        get {
            return objc_getAssociatedObject(self, &ObjcEventKeys.tapGestureActionKey) as? (() -> Void)
        }
        set {
            objc_setAssociatedObject(self, &ObjcEventKeys.tapGestureActionKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    @objc private func handleTap(_ gesture: UITapGestureRecognizer) {
        guard gesture.state == .ended else { return }
        
        tapAction?()
    }
    
    
    
}




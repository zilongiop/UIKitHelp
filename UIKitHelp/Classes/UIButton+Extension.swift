//
//  UIButton+Extension.swift
//  PodTwst
//
//  Created by OuLu on 2025/8/26.
//

import Foundation
import UIKit

public extension UIButton {
    func title(title: String) -> Self {
        setTitle(title, for: .normal)
        return self
    }
    
    func title(_ title: String, _ state: UIControl.State) -> Self {
        setTitle(title, for: state)
        return self
    }
    
    func titleColor(color: UIColor) -> Self {
        setTitleColor(color, for: .normal)
        return self
    }
    
    func titleColor(_ color: UIColor, _ state: UIControl.State) -> Self {
        setTitleColor(color, for: state)
        return self
    }
    
    func font(_ font: UIFont) -> Self {
        titleLabel?.font = font
        return self
    }
     
    func imageNormal(_ image: UIImage?) -> Self {
        setImage(image, for: .normal)
        return self
    }
    
    func image(_ image: UIImage, _ state: UIControl.State) -> Self {
        setImage(image, for: state)
        return self
    }
    
    func imageBackground(_ image: UIImage, _ state: UIControl.State) -> Self {
        setBackgroundImage(image, for: state)
        return self
    }
    
    private struct ButtonKeys {
        @MainActor static var tapActionKey = "UIButton.tapAction"
    }
    func onClick(_ action: @escaping () -> Void) -> Self {
        addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        tapAction = action
        return self
    }
    private var tapAction: (() -> Void)? {
        get {
            return objc_getAssociatedObject(self, &ButtonKeys.tapActionKey) as? (() -> Void)
        }
        set {
            objc_setAssociatedObject(self, &ButtonKeys.tapActionKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    @objc private func buttonTapped() {
        tapAction?()
    }
    
   
    
  
}

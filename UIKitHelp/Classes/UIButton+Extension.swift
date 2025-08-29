//
//  UIButton+Extension.swift
//  PodTwst
//
//  Created by OuLu on 2025/8/26.
//

import Foundation
import UIKit

public extension UIButton {
    func title(title:String) -> Self {
        setTitle(title, for: .normal)
        return self
    }
    
    func titleColor(color:UIColor) -> Self {
        setTitleColor(color, for: .normal)
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

//
//  UITextfield+Extension.swift
//  PodTwst
//
//  Created by OuLu on 2025/8/27.
//

import UIKit
public extension UITextField {
    
    /// 设置文本内容（链式）
    /// - Parameter text: 文本内容
    /// - Returns: 当前 UITextField 实例
    func text(_ text: String?) -> Self {
        self.text = text
        return self
    }
    
    /// 设置占位符（链式）
    /// - Parameter placeholder: 占位符文本
    /// - Returns: 当前 UITextField 实例
    func placeholder(_ placeholder: String?) -> Self {
        self.placeholder = placeholder
        return self
    }
    
    /// 设置字体（链式）
    /// - Parameter font: 字体
    /// - Returns: 当前 UITextField 实例
    func font(_ font: UIFont) -> Self {
        self.font = font
        return self
    }
    
    /// 设置文本颜色（链式）
    /// - Parameter color: 文本颜色
    /// - Returns: 当前 UITextField 实例
    func textColor(_ color: UIColor) -> Self {
        self.textColor = color
        return self
    }
    
    /// 设置边框样式（链式）
    /// - Parameter style: 边框样式（如 .roundedRect）
    /// - Returns: 当前 UITextField 实例
    func borderStyle(_ style: UITextField.BorderStyle) -> Self {
        self.borderStyle = style
        return self
    }
    
    /// 设置清除按钮模式（链式）
    /// - Parameter mode: 清除按钮模式（如 .whileEditing）
    /// - Returns: 当前 UITextField 实例
    func clearButtonMode(_ mode: UITextField.ViewMode) -> Self {
        self.clearButtonMode = mode
        return self
    }
    
    func maxLength(_ maxLength: Int) -> Self {
           addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
           self.maxLength = maxLength
           return self
       }
       
       // 私有属性：存储最大长度（需使用关联对象）
       private struct TextfieldKeys {
           @MainActor static var maxLengthKey = "UITextField_maxLengthKey"
       }
       
       private var maxLength: Int {
           get {
               return objc_getAssociatedObject(self, &TextfieldKeys.maxLengthKey) as? Int ?? 0
           }
           set {
               objc_setAssociatedObject(self, &TextfieldKeys.maxLengthKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
           }
       }
       
       // 私有方法：监听输入变化并截断超长文本
       @objc private func textFieldDidChange(_ textField: UITextField) {
           guard maxLength > 0, let text = textField.text, text.count > maxLength else { return }
           textField.text = String(text.prefix(maxLength))
       }
}

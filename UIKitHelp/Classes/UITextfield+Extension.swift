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
    
    /// 设置键盘样式（链式）
    /// - Parameter style: 键盘样式（如 .roundedRect）
    /// - Returns: 当前 UITextField 实例
    func keyboardType(_ style: UIKeyboardType) -> Self {
        self.keyboardType = style
        return self
    }
    
    /// 设置内容左边距
    func leftSpace(_ space: Double) -> Self {
        let leftSpacer = UIView(frame: CGRect(x: 0, y: 0, width: space, height: self.bounds.height))
        leftSpacer.backgroundColor = .clear
        self.leftView = leftSpacer
        self.leftViewMode = .always
        return self
    }
    
    /// 设置内容右边距
    func rightSpace(_ space: Double) -> Self {
        let rightSpacer = UIView(frame: CGRect(x: 0, y: 0, width: space, height: self.bounds.height))
        rightSpacer.backgroundColor = .clear
        self.rightView = rightSpacer
        self.rightViewMode = .always
        return self
    }
    
    /// 设置回车键样式
    func returnType(_ style: UIReturnKeyType) -> Self {
        self.returnKeyType = style
        return self
    }
    /// 设置清除按钮模式（链式）
    /// - Parameter mode: 清除按钮模式（如 .whileEditing）
    /// - Returns: 当前 UITextField 实例
    func clearButtonMode(_ mode: UITextField.ViewMode) -> Self {
        self.clearButtonMode = mode
        return self
    }
    
    func tintColor(_ color: UIColor) -> Self {
        self.tintColor = color
        return self
    }
    
    func showDefaultClearButton(_ show: Bool) -> Self {
        if show == false {
            self.rightView = nil
            return self
        }
        let clearButton = UIButton(type: .system)
        print(UIKitHelpManager.podBundle.bundlePath)  // 输出类似：/path/to/PodName.bundle

        let clearButtonImage = UIImage(
                    named: "clearButton",
                    in: Bundle.assetBundle,
                    compatibleWith: nil
                )
        clearButton.imageBackground(clearButtonImage!, .normal)
        clearButton.frame = CGRect(x: 0, y: 0, width: 30, height: 20)
        clearButton.backgroundColor(color: .clear)
        clearButton.addTarget(self, action: #selector(clearText), for: .touchUpInside)
        self.rightView = clearButton
        self.rightViewMode = .whileEditing // 与清除按钮模式同步

        return self
    }
    
    @objc func clearText() {
        self.text = ""
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

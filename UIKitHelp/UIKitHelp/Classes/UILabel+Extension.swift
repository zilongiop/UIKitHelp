//
//  UILabel+Extension.swift
//  PodTwst
//
//  Created by OuLu on 2025/8/26.
//

import Foundation
import UIKit
public extension UILabel {
       func text(_ text: String?) -> Self {
           self.text = text ?? ""
           return self
       }
       
       /** 设置标签文本颜色
       * - Parameter color: 颜色（默认系统黑色）
       * - Returns: 当前标签实例
        */
       func textColor(_ color: UIColor) -> Self {
           self.textColor = color
           return self
       }
       
       /// 设置标签字体
       /// - Parameter font: 字体（默认系统字体 17 号）
       /// - Returns: 当前标签实例
       func font(_ font: UIFont) -> Self {
           self.font = font
           return self
       }
       
       /// 设置标签行数（0 表示无限制）
       /// - Parameter lines: 行数（默认 1）
       /// - Returns: 当前标签实例
       func numberOfLines(_ lines: Int) -> Self {
           self.numberOfLines = lines
           return self
       }
       
       /// 设置标签行间距（需配合 `lineBreakMode` 使用）
       /// - Parameter spacing: 行间距
       /// - Returns: 当前标签实例
       func lineSpacing(_ spacing: CGFloat) -> Self {
           let paragraphStyle = NSMutableParagraphStyle()
           paragraphStyle.lineSpacing = spacing
           attributedText = NSAttributedString(
               string: text ?? "",
               attributes: [.paragraphStyle: paragraphStyle]
           )
           return self
       }
}

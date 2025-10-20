//
//  UIColor+Extension.swift
//  UIKitHelp
//
//  Created by 马园园 on 2025/10/16.
//

import UIKit


public extension UIColor {
    func alpha(_ alpha: CGFloat) -> UIColor {
        return self.withAlphaComponent(alpha)
    }
    static func rgbHexAlphaColor(_ hexString: String,_ alpha: CGFloat) -> UIColor {
        return UIColor.rgbHexColor(hexString).withAlphaComponent(alpha)
    }
    static func rgbHexColor(_ hexString: String) -> UIColor {
        // 1. 清理输入字符串（去除空格、换行符和 # 符号）
        let cleanedHex = hexString.trimmingCharacters(in: .whitespacesAndNewlines).lowercased()
            .replacingOccurrences(of: "#", with: "")
        // 2. 验证长度（6位：RGB；8位：RGBA）
        guard cleanedHex.count == 6 || cleanedHex.count == 8 else {
            print("⚠️ 无效的十六进制颜色长度（需6位或8位）")
            return .clear
        }
        // 3. 解析十六进制字符为字节数组（每两位为一个颜色通道）
        var bytes = [UInt8](repeating: 0, count: cleanedHex.count / 2)
        for i in 0 ..< bytes.count {
            // 提取当前两位字符的子串
            let startIndex = cleanedHex.index(cleanedHex.startIndex, offsetBy: i * 2)
            let endIndex = cleanedHex.index(startIndex, offsetBy: 2)
            let substring = cleanedHex[startIndex ..< endIndex]
            // 转换为 UInt8（十六进制）
            guard let byte = UInt8(substring, radix: 16) else {
                print("⚠️ 无效的十六进制字符：\(substring)")
                return .clear
            }
            bytes[i] = byte
        }
        // 4. 分配 RGB 和 Alpha 通道值
        let (r, g, b, a): (UInt8, UInt8, UInt8, UInt8)
        if cleanedHex.count == 6 {
            // 6位：RGB（Alpha 默认 100%）
            r = bytes[0]
            g = bytes[1]
            b = bytes[2]
            a = 255
        } else {
            // 8位：RGBA
            r = bytes[0]
            g = bytes[1]
            b = bytes[2]
            a = bytes[3]
        }
        // 5. 创建 UIColor（分量转换为 0-1 范围）
        return UIColor(
            red: CGFloat(r) / 255.0, green: CGFloat(g) / 255.0, blue: CGFloat(b) / 255.0,
            alpha: CGFloat(a) / 255.0
        )
    }
}

//
//  UIKitHelp.swift
//  UIKitHelp
//
//  Created by 马园园 on 2025/9/12.
//

import Foundation

class UIKitHelpManager {
    public static var podBundle: Bundle {
        let bundle = Bundle(for: UIKitHelpManager.self)
        return bundle
    }
}

extension Bundle {
    static var assetBundle: Bundle? = {
        let bundlePod = UIKitHelpManager.podBundle
        let path = UIKitHelpManager.podBundle.path(forResource: "UIKitHelpAssets", ofType: "bundle")
        if path == nil {
            return nil
        }
        return Bundle(path: path!)
    }()
}

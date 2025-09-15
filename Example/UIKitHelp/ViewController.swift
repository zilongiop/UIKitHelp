//
//  ViewController.swift
//  UIKitHelp
//
//  Created by mayuanyuan on 08/27/2025.
//  Copyright (c) 2025 mayuanyuan. All rights reserved.
//

import UIKit
import UIKitHelp
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let btn = UIButton(type: .custom)
        btn.backgroundColor(color: .green).title(title: "点击我").onClick {[weak self] in
            self?.handleBtnClick()
        }
        
        btn.title("被撞了", .highlighted).titleColor(.red, .highlighted).font(.systemFont(ofSize: 30))
        btn.frame = CGRect(x: 50, y: 200, width: 200, height: 50)
        view.addSubview(btn)
        
        let lab = UILabel()
        lab.backgroundColor(color: .green).text("我是一个Label").textColor(.red).font(.systemFont(ofSize: 15)).numberOfLines(1).onGestureClick {[weak self] in
            self?.handleBtnClick()
            lab.width = lab.width - 20
            lab.centerX = (self?.view.width ?? 0)*0.5
        }
        lab.frame = CGRectMake(0, 100, self.view.width, 20)
        view.addSubview(lab)
        
        let txfv = UITextField(frame: CGRect(x: 50, y: 250, width: 200, height: 45))
        txfv.placeholder("请输入您的幸运数字")
        txfv.border(color: .black, width: 1.5).borderRadius(radius: 15).keyboardType(.numberPad).returnType(.done).leftSpace(15).rightSpace(15)
        txfv.clearButtonMode(.whileEditing).tintColor(.red).showDefaultClearButton(true)
        view.addSubview(txfv)
//        let clearButtonImage = UIImage(named: "clearButton", in: UIKitHelpManager.podBundle, compatibleWith: nil)
       
        // Do any additional setup after loading the view, typically from a nib.
    }
    func handleBtnClick() {
        print("btn has been tap")
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}


//
//  TextFieldImageView.swift
//  Logindemo
//
//  Created by mac on 16/4/13.
//  Copyright © 2016年 wyq. All rights reserved.
//

import UIKit

class TextFieldImageView: UIView {

    /**
     *  输入框
     */
    var inputTextField: UITextField? {
        didSet{
            inputTextField!.placeholder = "user"//这里要写个不写没有效果，不知为啥
            let color = UIColor.whiteColor().colorWithAlphaComponent(0.5)
            inputTextField!.setValue(color, forKeyPath: "_placeholderLabel.textColor")
        }
    }
    /**
     *  左边图片
     */
    var leftImage: UIImageView?

    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpUI()
    }

    func setUpUI() {

        let bgImage: UIImageView = UIImageView(frame: self.bounds)
        bgImage.image = UIImage(named: "bg_input_down")
        bgImage.userInteractionEnabled = true
        bgImage.layer.cornerRadius = 5.0
        bgImage.layer.borderWidth = 1.0
        bgImage.layer.borderColor = UIColor.clearColor().CGColor
        bgImage.layer.masksToBounds = true
        self.addSubview(bgImage)
        leftImage = UIImageView(frame: CGRectMake(0, 0, self.bounds.size.height, self.bounds.size.height))
        leftImage!.contentMode = .Center
        bgImage.addSubview(leftImage!)
        self.inputTextField = UITextField(frame: CGRectMake(leftImage!.frame.origin.x + leftImage!.frame.size.width + 5, 0, self.bounds.size.width - leftImage!.frame.size.width, leftImage!.frame.size.height))
        self.inputTextField!.textColor = UIColor.whiteColor()
        self.inputTextField!.clearButtonMode = .WhileEditing
        bgImage.addSubview(inputTextField!)

    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


}

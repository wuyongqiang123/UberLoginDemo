//
//  LoginView.swift
//  Logindemo
//
//  Created by mac on 16/4/13.
//  Copyright © 2016年 wyq. All rights reserved.
//

import UIKit

class LoginView: UIView {

    /**
     *  账号
     */
    var userNameTextView: TextFieldImageView?
    /**
     *  密码
     */
    var passwordTextView: TextFieldImageView?
    /**
     *  顶部文字
     */
    var topTitleLable: UILabel?
    /**
     *  login button
     */
    var loginBtn: UIButton?
    /**
     *  regist button
     */
    var registBtn: UIButton?
    /**
     *  确定登录
     */
    var makesureRegistBtn: UIButton?

    override init(frame: CGRect) {
        super.init(frame: frame)
        setLoginUI()
    }
    func setLoginUI() {

        self.topTitleLable = UILabel(frame: CGRectMake(0, 0, kWindowWidth, kLabelHeight))
        self.topTitleLable!.center = CGPointMake(kWindowWidth / 2, kWindowHeigth / 4)
        self.topTitleLable!.text = "Hey,iOSer"
        self.topTitleLable!.font = UIFont(name: "Helvetica-Oblique", size: 28)
        self.topTitleLable!.textAlignment = .Center
        self.topTitleLable!.textColor = UIColor.blackColor()
        self.addSubview(topTitleLable!)
        let btnWidth: CGFloat = (kWindowWidth - 4 * x_OffSet) / 2
        self.registBtn = UIButton(frame: CGRectMake(x_OffSet * 2, kWindowHeigth - 100, btnWidth - x_OffSet / 2, 44))
        self.registBtn!.setTitle("注册", forState:UIControlState.Normal)
        self.registBtn!.layer.cornerRadius = 5.0
        registBtn!.setTitleColor(UIColor.darkGrayColor(), forState:UIControlState.Normal)
        registBtn!.backgroundColor = UIColor.whiteColor().colorWithAlphaComponent(0.8)
        self.addSubview(registBtn!)

        self.loginBtn = UIButton(frame: CGRectMake(CGRectGetMaxX(registBtn!.frame) + x_OffSet, kWindowHeigth - 100, btnWidth - x_OffSet / 2, 44))
        self.loginBtn!.setTitle("登录", forState:UIControlState.Normal)
        self.loginBtn!.layer.cornerRadius = 5.0
        loginBtn!.setTitleColor(UIColor.darkGrayColor(), forState:UIControlState.Normal)
        loginBtn!.backgroundColor = UIColor.whiteColor().colorWithAlphaComponent(0.8)
        self.addSubview(loginBtn!)
        self.userNameTextView = TextFieldImageView(frame: CGRectMake(x_OffSet, kWindowWidth * 2 / 3, kWindowWidth - x_OffSet * 2, 47))
        self.userNameTextView?.inputTextField?.placeholder = "请输入手机号或者邮箱"
        self.userNameTextView?.leftImage?.image = UIImage(named: "icon_phone_select@2x")
        self.addSubview(userNameTextView!)

        self.passwordTextView = TextFieldImageView(frame: CGRectMake(x_OffSet, CGRectGetMaxY(userNameTextView!.frame) + 5, kWindowWidth - x_OffSet * 2, 47))
        self.passwordTextView?.inputTextField?.placeholder = "请输入密码"
        self.passwordTextView!.inputTextField?.secureTextEntry = true
        self.passwordTextView!.leftImage?.image = UIImage(named: "icon_code_select@2x")
        self.addSubview(passwordTextView!)
        self.makesureRegistBtn = UIButton(frame: CGRectMake(x_OffSet, CGRectGetMaxY(passwordTextView!.frame) + x_OffSet, kWindowWidth - x_OffSet * 2, 44))
        //    [_makesureRegistBtn setTitle:@"注册" forState:0];
        makesureRegistBtn!.setTitleColor(UIColor.whiteColor(), forState:UIControlState.Normal)
        makesureRegistBtn!.backgroundColor = UIColor(red: 0, green: 0.71, blue: 0.54, alpha: 1)
        self.makesureRegistBtn!.layer.cornerRadius = 5.0
        self.makesureRegistBtn!.layer.borderWidth = 1.0
        self.makesureRegistBtn!.layer.borderColor = UIColor.clearColor().CGColor
        self.addSubview(makesureRegistBtn!)


    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

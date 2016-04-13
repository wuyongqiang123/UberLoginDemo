//
//  ViewController.swift
//  Logindemo
//
//  Created by mac on 16/4/13.
//  Copyright © 2016年 wyq. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    /**
     *  全屏播放器
     */
    lazy var player: AVPlayer? = {
        var playerItem: AVPlayerItem = self.getPlayItem()
        var player = AVPlayer.init(playerItem: playerItem)
        player.actionAtItemEnd = AVPlayerActionAtItemEnd.None
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(ViewController.playerItemDidPlayToEndTimeNotification), name: AVPlayerItemDidPlayToEndTimeNotification, object: nil)

        return player
    }()
    /**
     *  登录 view
     */
    var loginView: LoginView?

    func playVideos() {
        self.player!.play()
    }

    func getPlayItem()-> AVPlayerItem {
        let filePath: String = NSBundle.mainBundle().pathForResource("BridgeLoop-640p", ofType: "mp4")!
        let url: NSURL = NSURL.fileURLWithPath(filePath)
        let playerItem: AVPlayerItem = AVPlayerItem.init(URL:url)
        return playerItem
    }

    func setupForAVplayerView() {
        //创建播放图层
        let playerLayer: AVPlayerLayer = AVPlayerLayer.init(player:self.player)
        playerLayer.frame = self.view.bounds
        self.view.layer.addSublayer(playerLayer)
    }

    //重播
    func playerItemDidPlayToEndTimeNotification() {
        player?.seekToTime(kCMTimeZero)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        setupForAVplayerView()

        playVideos()


        //毛玻璃
        var blurEffect: UIVisualEffect
        blurEffect = UIBlurEffect.init(style:.Dark)
        let visualEffectView = UIVisualEffectView(effect: blurEffect)
        UIView.beginAnimations(nil, context: nil)
        UIView.setAnimationDuration(1.5)
        visualEffectView.alpha = 0.4
        UIView.commitAnimations()
        visualEffectView.frame = self.view.bounds
        self.view!.addSubview(visualEffectView)
        self.loginView = LoginView(frame: self.view.bounds)
        self.loginView!.alpha = 0.0
        UIView.beginAnimations(nil, context: nil)
        UIView.setAnimationDuration(2.5)
        self.loginView!.alpha = 1.0
        UIView.commitAnimations()
        self.view!.addSubview(loginView!)
        //注册
        loginView!.registBtn!.addTarget(self, action: #selector(ViewController.registUser), forControlEvents: .TouchUpInside)
        //登录
        loginView!.loginBtn!.addTarget(self, action: #selector(ViewController.loginUser), forControlEvents: .TouchUpInside)

        setTextFieldTransform()
    }

    /**
     *  设置登陆框 transform
     */

    func setTextFieldTransform() {
        self.loginView!.userNameTextView!.transform = CGAffineTransformMakeTranslation(400, 0)
        self.loginView!.passwordTextView!.transform = CGAffineTransformMakeTranslation(400, 0)
        self.loginView!.makesureRegistBtn!.transform = CGAffineTransformMakeTranslation(400, 0)
    }

    /**
     *  注册 登录两个消失
     */

    func dismissFirstLoginView() {
        //原来页面的消失
        UIView.beginAnimations(nil, context: nil)
        UIView.setAnimationDuration(1.0)
        self.loginView!.registBtn!.alpha = 0.001
        self.loginView!.loginBtn!.alpha = 0.001
        self.loginView?.userNameTextView?.inputTextField?.text = ""
        self.loginView?.passwordTextView?.inputTextField?.text = ""
        UIView.commitAnimations()
    }

    /**
     *  注册按钮方法
     */

    func registUser() {
        self.dismissFirstLoginView()
        //注册出现
        UIView.animateWithDuration(1.0, animations: {() -> Void in
            self.loginView!.userNameTextView!.transform = CGAffineTransformIdentity
            self.loginView!.passwordTextView!.transform = CGAffineTransformIdentity
            self.loginView!.makesureRegistBtn!.transform = CGAffineTransformIdentity
            self.loginView!.makesureRegistBtn!.setTitle("注册", forState:UIControlState.Normal)
        })
    }

    func goToRegistUser() {
        self.view!.endEditing(true)
        WYQLoadView.shareLoadView.showLoadingViewWithBlur()
        self.performSelector(#selector(ViewController.removeLoadingView), withObject: self, afterDelay: 1.5)
    }

    func removeLoadingView() {
        WYQLoadView.shareLoadView.dismissLoadingViewWithBlur()
        //    NSLog(@"%@",_loginView.userNameTextView.inputTextField.text);
        //    NSLog(@"%@",_loginView.passwordTextView.inputTextField.text);
        let str: String = "\(loginView!.userNameTextView!.inputTextField!.text!) \(loginView!.passwordTextView!.inputTextField!.text!)"
        let alert: UIAlertController = UIAlertController.init(title: nil, message: str, preferredStyle: .Alert)
        let action: UIAlertAction = UIAlertAction.init(title: "sure", style: .Cancel, handler: nil)
        alert.addAction(action)
        self.presentViewController(alert, animated: true, completion: { _ in })
    }


    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)

        UIView.animateWithDuration(1.5, animations: {() -> Void in
            self.setTextFieldTransform()
        })
        UIView.beginAnimations(nil, context: nil)
        UIView.setAnimationDuration(1.0)
        self.loginView!.registBtn!.alpha = 1
        self.loginView!.loginBtn!.alpha = 1
        UIView.commitAnimations()
    }

    /**
     *  登录按钮方法
     */

    func loginUser() {
        self.dismissFirstLoginView()
        //注册出现
        UIView.animateWithDuration(1.0, animations: {() -> Void in
            self.loginView!.userNameTextView!.transform = CGAffineTransformIdentity
            self.loginView!.passwordTextView!.transform = CGAffineTransformIdentity
            self.loginView!.makesureRegistBtn!.transform = CGAffineTransformIdentity
            self.loginView!.makesureRegistBtn!.setTitle("登录", forState:UIControlState.Normal)
        })
        /**
         *  提交注册信息
         */
        self.loginView!.makesureRegistBtn!.addTarget(self, action: #selector(ViewController.goToRegistUser), forControlEvents: .TouchUpInside)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


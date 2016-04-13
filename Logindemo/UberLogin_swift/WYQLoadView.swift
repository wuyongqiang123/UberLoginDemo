//
//  WYQLoadView.swift
//  Logindemo
//
//  Created by mac on 16/4/13.
//  Copyright © 2016年 wyq. All rights reserved.
//

import UIKit



class WYQLoadView: UIView {

    var blurView: UIVisualEffectView?

    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
    }

    func setUI() {
        // 底部的灰色layer
        let bottomShapeLayer: CAShapeLayer = CAShapeLayer()
        bottomShapeLayer.strokeColor = UIColor(red: 229 / 255.0, green: 229 / 255.0, blue: 229 / 255.0, alpha: 1).CGColor
        bottomShapeLayer.fillColor = UIColor.clearColor().CGColor
        bottomShapeLayer.lineWidth = KShapelayerLineWidth
        //    bottomShapeLayer.lineDashPattern = @[@6,@3];
        bottomShapeLayer.path = UIBezierPath(roundedRect: CGRectMake(KShapeLayerMargin, 0, KShapeLayerWidth, KShapeLayerWidth), cornerRadius: KShapeLayerRadius).CGPath
        self.layer.addSublayer(bottomShapeLayer)
        /// 橘黄色的layer
        let ovalShapeLayer: CAShapeLayer = CAShapeLayer()
        ovalShapeLayer.strokeColor = UIColor(red: 0.984, green: 0.153, blue: 0.039, alpha: 1.000).CGColor
        ovalShapeLayer.fillColor = UIColor.clearColor().CGColor
        ovalShapeLayer.lineWidth = KShapelayerLineWidth
        ovalShapeLayer.lineDashPattern = [6, 3]
        ovalShapeLayer.path = UIBezierPath(roundedRect: CGRectMake(KShapeLayerMargin, 0, KShapeLayerWidth, KShapeLayerWidth), cornerRadius: KShapeLayerRadius).CGPath
        self.layer.addSublayer(ovalShapeLayer)

        /// 起点动画
        let strokeStartAnimation: CABasicAnimation = CABasicAnimation(keyPath: "strokeStart")
        strokeStartAnimation.fromValue = -1
        strokeStartAnimation.toValue = 1.0
        /// 终点动画
        let strokeEndAnimation: CABasicAnimation = CABasicAnimation(keyPath: "strokeEnd")
        strokeEndAnimation.fromValue = 0.0
        strokeEndAnimation.toValue = 1.0
        /// 组合动画
        let animationGroup: CAAnimationGroup = CAAnimationGroup()
        animationGroup.animations = [strokeStartAnimation, strokeEndAnimation]
        animationGroup.duration = KAnimationDurationTime
        animationGroup.repeatCount = Float(CGFloat.max)
        animationGroup.fillMode = kCAFillModeForwards
        animationGroup.removedOnCompletion = false
        ovalShapeLayer.addAnimation(animationGroup, forKey: nil)

        let label: UILabel = UILabel()
        label.text = "正在加载..."
        label.textColor = UIColor(red: 153 / 255.0, green: 153 / 255.0, blue: 153 / 255.0, alpha: 1.0)
        label.font = UIFont.systemFontOfSize(14)
        label.frame = CGRectMake(0, KShapeLayerWidth + 5, KLoadingViewWidth + 10, 20)
        label.textAlignment = .Center
        self.addSubview(label)

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //单例
    static let sharedInstance: WYQLoadView = WYQLoadView()

    convenience init(TopTitle: String,BottomTitle: String) {
        self.init()
        print("走了几次了")
        setUI()
    }


    /**
     *  显示加载动画
     */
    func showLoadingView() {

        /// 拿到主窗口
        let window: UIWindow! = UIApplication.sharedApplication().keyWindow
        /// view的X
        let viewCenterX: CGFloat = CGRectGetWidth(UIScreen.mainScreen().bounds) / 2
        /// view的Y
        let viewCenterY: CGFloat = CGRectGetHeight(UIScreen.mainScreen().bounds) / 2
        self.frame = CGRectMake(0, 0, KLoadingViewWidth, KLoadingViewWidth)
        self.center = CGPointMake(viewCenterX, viewCenterY)
        /// 添加到主窗口中
        window.addSubview(self)


    }
    /**
     *  关闭加载动画
     */
    func dismissLoadingView() {

        self.removeFromSuperview()

    }

    /**
     *  显示加载动画(带毛玻璃效果)
     */
    func showLoadingViewWithBlur() {

        /// 拿到主窗口
        let window: UIWindow! = UIApplication.sharedApplication().keyWindow
        /// view的X
        let viewCenterX: CGFloat = CGRectGetWidth(UIScreen.mainScreen().bounds) / 2
        /// view的Y
        let viewCenterY: CGFloat = CGRectGetHeight(UIScreen.mainScreen().bounds) / 2
        self.frame = CGRectMake(0, 0, KLoadingViewWidth, KLoadingViewWidth)
        self.center = CGPointMake(viewCenterX, viewCenterY)
        /// 添加到主窗口中
        window.addSubview(self)
        blurView = UIVisualEffectView(effect: UIBlurEffect.init(style:.ExtraLight))
        blurView!.layer.cornerRadius = 10
        blurView!.layer.masksToBounds = true
        blurView!.frame = CGRectMake(0, 0, 100, 100)
        blurView!.center = CGPointMake(viewCenterX, viewCenterY)
        /// 添加毛玻璃效果
        window.insertSubview(blurView!, belowSubview: self)

    }

    /**
     *  关闭加载动画(带毛玻璃效果)
     */
    func dismissLoadingViewWithBlur() {

        blurView!.removeFromSuperview()
        self.removeFromSuperview()
        
    }

}

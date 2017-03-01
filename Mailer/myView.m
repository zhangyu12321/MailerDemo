//
//  myView.m
//  Mailer
//
//  Created by MAC15 on 2017/2/21.
//  Copyright © 2017年 MAC15. All rights reserved.
//

#import "myView.h"

@implementation myView
- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        
        self.backgroundColor = [UIColor colorWithRed:246/255.0 green:240/255.0 blue:229/255.0 alpha:1];
    
        [self two];

        [self three];
        
        [self one];

    }
    return self;
}

- (void)three{
    self.textView = [[UILabel alloc]initWithFrame:CGRectMake(10, 0, self.frame.size.width-20, self.frame.size.height)];
    self.textView.hidden = YES;
    self.textView.textAlignment = NSTextAlignmentCenter;
    self.textView.backgroundColor = [UIColor colorWithRed:246/255.0 green:240/255.0 blue:229/255.0 alpha:1];
    self.textView.text = @"欢迎使用信封打开Demo！";
    [self addSubview:self.textView];
    
}
- (void)one{
   CAShapeLayer * leftbarLayer = [CAShapeLayer new];
    [self.layer addSublayer:leftbarLayer];
    leftbarLayer.fillColor = [UIColor colorWithRed:54/255.0 green:115/255.0 blue:150/255.0 alpha:1].CGColor;
    UIBezierPath* aPath = [UIBezierPath bezierPath];
    // 起点
    [aPath moveToPoint:CGPointMake(0, 0)];
    
    // 绘制线条
    [aPath addLineToPoint:CGPointMake(100, 100)];
    [aPath addLineToPoint:CGPointMake(0, 200)];
    [aPath closePath];//第五条线通过调用closePath方法得到的
    //根据坐标点连线
    [aPath stroke];
    [aPath fill];
    leftbarLayer.path = aPath.CGPath;
    
    
    
    CAShapeLayer * rightbarLayer = [CAShapeLayer new];
    [self.layer addSublayer:rightbarLayer];
    rightbarLayer.fillColor =[UIColor colorWithRed:54/255.0 green:115/255.0 blue:150/255.0 alpha:1].CGColor;
    UIBezierPath* rightbarLayerPath = [UIBezierPath bezierPath];
    // 起点
    [rightbarLayerPath moveToPoint:CGPointMake(300, 0)];
    
    // 绘制线条
    [rightbarLayerPath addLineToPoint:CGPointMake(200, 100)];
    [rightbarLayerPath addLineToPoint:CGPointMake(300, 200)];
    [rightbarLayerPath closePath];//第五条线通过调用closePath方法得到的
    //根据坐标点连线
    [rightbarLayerPath stroke];
    [rightbarLayerPath fill];
    rightbarLayer.path = rightbarLayerPath.CGPath;

    
    
    CAShapeLayer * bottomBarLayer = [CAShapeLayer new];
    [self.layer addSublayer:bottomBarLayer];
    bottomBarLayer.fillColor = [UIColor colorWithRed:54/255.0 green:115/255.0 blue:150/255.0 alpha:1].CGColor;
    UIBezierPath* bottomBarLayerPath = [UIBezierPath bezierPath];
    // 起点
    [bottomBarLayerPath moveToPoint:CGPointMake(0, 200)];
    
    // 绘制线条
    [bottomBarLayerPath addLineToPoint:CGPointMake(150, 55)];
    [bottomBarLayerPath addLineToPoint:CGPointMake(300, 200)];
    [bottomBarLayerPath closePath];//第五条线通过调用closePath方法得到的
    //根据坐标点连线
    [bottomBarLayerPath stroke];
    [bottomBarLayerPath fill];
    bottomBarLayer.path = bottomBarLayerPath.CGPath;

    
}
- (void)two{
    
    barLayer = [CAShapeLayer new];
    [self.layer addSublayer:barLayer];
    barLayer.fillColor = [UIColor colorWithRed:54/255.0 green:115/255.0 blue:150/255.0 alpha:1].CGColor;
    UIBezierPath* aPath = [UIBezierPath bezierPath];
    aPath.lineWidth = 5.0;
    
    aPath.lineCapStyle = kCGLineCapRound;
    aPath.lineJoinStyle = kCGLineCapRound;
    
    // 起点
    [aPath moveToPoint:CGPointMake(0, 0)];
    
    // 绘制线条
    [aPath addLineToPoint:CGPointMake(300, 0)];
    [aPath addLineToPoint:CGPointMake(150, 150)];
    [aPath addLineToPoint:CGPointMake(0, 0)];
    [aPath closePath];//第五条线通过调用closePath方法得到的
    
    //根据坐标点连线
    [aPath stroke];
    [aPath fill];
    barLayer.path = aPath.CGPath;
    
}
- (void)strat{
    CABasicAnimation *anima = [CABasicAnimation animationWithKeyPath:@"transform.rotation.x"];//绕着z轴为矢量，进行旋转(@"transform.rotation.z"==@@"transform.rotation")
    anima.toValue = [NSNumber numberWithFloat:M_PI];
    anima.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    anima.delegate = self;
    // 防止回到初始化
    anima.removedOnCompletion = NO;
    anima.fillMode = kCAFillModeForwards;
    anima.autoreverses = NO;
    
    anima.duration = 2.0f;
    
    [barLayer addAnimation:anima forKey:@"rotateAnimation"];
    
}

- (void)animationDidStart:(CAAnimation *)anim{
    
    
}
- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag{
    
    [UIView animateWithDuration:1.0 animations:^{
        self.backgroundColor = [UIColor colorWithRed:54/255.0 green:115/255.0 blue:150/255.0 alpha:1];
        self.textView.hidden = NO;
        self.frame = CGRectMake(0, 300, 300, 200);
        self.textView.frame = CGRectMake(10, -200, 300 - 20, 380);
    }];

}



@end











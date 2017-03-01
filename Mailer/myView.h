//
//  myView.h
//  Mailer
//
//  Created by MAC15 on 2017/2/21.
//  Copyright © 2017年 MAC15. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface myView : UIView<CAAnimationDelegate>
{
    CAShapeLayer *barLayer; //柱状层
    
    UIBezierPath *barPath; //柱状赛贝尔路径
}
@property (nonatomic, strong) UILabel * textView;

- (void)strat;
@end

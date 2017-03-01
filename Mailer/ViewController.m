//
//  ViewController.m
//  Mailer
//
//  Created by MAC15 on 2017/2/21.
//  Copyright © 2017年 MAC15. All rights reserved.
//

#import "ViewController.h"

#define SCREEN_WIDTH ([[UIScreen mainScreen] bounds].size.width)
#define SCREEN_HEIGHT ([[UIScreen mainScreen] bounds].size.height)
#import "myView.h"
@interface ViewController ()<CAAnimationDelegate>
@property (nonatomic, strong) myView * myview;
@property (nonatomic, strong) UIView * demoView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor colorWithRed:197/255.0 green:192/255.0 blue:177/255.0 alpha:1];
    
    
    UIView * demoView = [[UIView alloc]initWithFrame:CGRectMake(50, 150, 300, 200)];
    [self.view addSubview:demoView];
    self.demoView = demoView;
    
    myView * view = [[myView alloc]initWithFrame:CGRectMake(0, 0, 300, 200)];
    [demoView addSubview:view];
    self.myview = view;
    [self groupAnimation1];
    

}
- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag{
    [self.myview strat];
}

-(void)groupAnimation1{
    //    //位移动画
    CAKeyframeAnimation *anima1 = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    NSValue *value0 = [NSValue valueWithCGPoint:CGPointMake(0, SCREEN_HEIGHT/2-50)];
    NSValue *value1 = [NSValue valueWithCGPoint:CGPointMake(SCREEN_WIDTH/3, SCREEN_HEIGHT/2-50)];
    NSValue *value2 = [NSValue valueWithCGPoint:CGPointMake(SCREEN_WIDTH/3, SCREEN_HEIGHT/2+50)];
    NSValue *value3 = [NSValue valueWithCGPoint:CGPointMake(SCREEN_WIDTH*2/3, SCREEN_HEIGHT/2+50)];
    NSValue *value4 = [NSValue valueWithCGPoint:CGPointMake(SCREEN_WIDTH*2/3, SCREEN_HEIGHT/2-50)];
    NSValue *value5 = [NSValue valueWithCGPoint:CGPointMake(SCREEN_WIDTH, SCREEN_HEIGHT/2-50)];
    anima1.values = [NSArray arrayWithObjects:value0,value1,value2,value3,value4,value5, nil];
    
    //缩放动画
    CABasicAnimation *anima2 = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    anima2.fromValue = [NSNumber numberWithFloat:0.0f];
    anima2.toValue = [NSNumber numberWithFloat:1.0f];
    
    //旋转动画
    CABasicAnimation *anima3 = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    anima3.toValue = [NSNumber numberWithFloat:M_PI*4];
    
    //组动画
    CAAnimationGroup *groupAnimation = [CAAnimationGroup animation];
    groupAnimation.animations = [NSArray arrayWithObjects:anima2, nil];
    groupAnimation.duration = 1.0f;
    groupAnimation.delegate = self;

    [_demoView.layer addAnimation:groupAnimation forKey:@"groupAnimation"];
    
   
}


@end

//
//  MainViewController.h
//  TextDemo
//
//  Created by DAWEI FAN on 07/03/2014.
//  Copyright (c) 2014 huiztech. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreMotion/CoreMotion.h>
#import "AppDelegate.h"
@interface MainViewController : UIViewController<UIScrollViewDelegate,UIAccelerometerDelegate>
{
    AppDelegate *app;
    UIButton *goBack;//返回按钮
    UIImageView *imageView;
    UIImageView *imageViewTwo;
    UIImageView *baby;
    CGRect f ;
    
    CMMotionManager * motionManager;
    UILabel *label_rotation;//角度 最后为0
    BOOL isOpen;
    
    UIView *view_Ready;//准备开始的子视图；
    UILabel *label_scroll;//对应滚动视图的label
    NSArray *array;//临时数组 以后删除
    BOOL isStop;//临时判断 是否gameOVer
    
    NSString *startTime;//开始时间日期
    NSString *startTime_Second;//开始的秒时间
    NSString *endTime_second;//结束秒时间
    UILabel *label_totalTime;//计时标签
    
    //第二种方法尝试
    double accelerationX2;
    double accelerationY2;
    double accelerationZ2;
    
    NSArray *arrary_Person;
    NSArray *arrary_People;
    NSArray *arrary_Person_Test;
    NSArray *arrary_People_Test;
    
    BOOL isNextPlayer;
   
}

@end

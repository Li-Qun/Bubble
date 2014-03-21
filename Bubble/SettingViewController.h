//
//  SettingViewController.h
//  Bubble
//
//  Created by DAWEI FAN on 19/03/2014.
//  Copyright (c) 2014 huiztech. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
@interface SettingViewController : UIViewController
{
    AppDelegate *app;
    BOOL isTimerY;
    BOOL isTimerN;
    BOOL isChineseY;
    BOOL isChineseN;
    
    UIButton *button_Time_Y;
    UIButton *button_Time_N;
    UIButton *button_Chinese_Y;
    UIButton *button_Chinese_N;
    
    UILabel *label_Time_Y;
    UILabel *label_Time_N;
    UILabel *label_Chinese_Y;
    UILabel *label_Chinese_N;
    
    
    
}

@end

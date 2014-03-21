//
//  AppDelegate.h
//  Bubble
//
//  Created by DAWEI FAN on 19/03/2014.
//  Copyright (c) 2014 huiztech. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RootViewController;

@interface AppDelegate : UIResponder <UIApplicationDelegate>
{
    BOOL isShowTimer;
    BOOL isChooseChinese;
}


@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) RootViewController *rootViewController;

@property (nonatomic) BOOL isShowTimer;
@property (nonatomic) BOOL isChooseChinese;

@property (nonatomic) int account_play;

@end

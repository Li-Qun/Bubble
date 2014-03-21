//
//  RootViewController.h
//  Bubble
//
//  Created by DAWEI FAN on 19/03/2014.
//  Copyright (c) 2014 huiztech. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RootViewController : UIViewController
{
    UIButton *btn_playDirectly;
    UILabel *label_playDirectly;
    
    UIButton *btn_challenge;
    UILabel *label_challenge;
    
    UIButton *btn_settings;
    UILabel *label_settings;
    
    BOOL isOpen_Play;
    BOOL isOpen_challenge;
    BOOL isOpen_settings;
    
}

@end

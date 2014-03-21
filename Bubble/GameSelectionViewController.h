//
//  GameSelectionViewController.h
//  Bubble
//
//  Created by DAWEI FAN on 20/03/2014.
//  Copyright (c) 2014 huiztech. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GameSelectionViewController : UIViewController
{
    NSMutableArray *array_button_gameSelect;
    NSMutableArray *array_label_gameSelect;
    
    UIView *view_gameSelect;//玩法选择视图
    NSArray *array_button_Name;//三个按钮的名称
    NSArray *array_textView_content;//三个说明文本
}

@end

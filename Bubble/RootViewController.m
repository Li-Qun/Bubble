//
//  RootViewController.m
//  Bubble
//
//  Created by DAWEI FAN on 19/03/2014.
//  Copyright (c) 2014 huiztech. All rights reserved.
//

#import "RootViewController.h"
#import "MainViewController.h"
#import "SettingViewController.h"
#import "ChallengeViewController.h"
@interface RootViewController ()

@end

@implementation RootViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        //self.view.transform=CGAffineTransformMakeRotation(M_PI/2*3);//顺时针旋转
    }
    return self;
}
- (BOOL)prefersStatusBarHidden//隐藏状态栏
{
    return YES;
}

- (void)viewDidLoad
{
    for (id obj in self.view.subviews) {
        if ([obj isKindOfClass:[UIView class]] ) {
            [obj removeFromSuperview];
        }
    }
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor blackColor];
//    UIView *ad_View=[[UIView alloc]initWithFrame:CGRectMake(0, 0,Height, 40)];
//    ad_View.backgroundColor=[UIColor blueColor];
//    [self.view addSubview:ad_View];
    UIImageView *welcome=[[UIImageView alloc]initWithFrame:CGRectMake(Height/6,50, Height/3*2, 100)];
    welcome.image=[UIImage imageNamed:@"flat&hand.png"];
    welcome.backgroundColor=[UIColor clearColor];
    [self.view addSubview: welcome];
    btn_playDirectly=[UIButton buttonWithType:UIButtonTypeCustom];
    btn_playDirectly.frame=CGRectMake(Height/9, 220, 80, 80);
    btn_playDirectly.tag=100;
    [btn_playDirectly addTarget:self action:@selector(Btns:) forControlEvents:UIControlEventTouchUpInside];
 //   [btn_playDirectly setBackgroundImage: [UIImage imageNamed:@"white_button.png"] forState:UIControlStateHighlighted];
    label_playDirectly=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, 80, 80)];
    label_playDirectly.backgroundColor=[UIColor clearColor];
    label_playDirectly.text=@"Quick play";
    label_playDirectly.font=[UIFont fontWithName:@"Arial" size:17];
    label_playDirectly.textAlignment= NSTextAlignmentCenter;
    label_playDirectly.textColor=[UIColor whiteColor];
    [btn_playDirectly addSubview:label_playDirectly];
    [self.view addSubview:btn_playDirectly];
    
    btn_challenge=[UIButton buttonWithType:UIButtonTypeCustom];
    btn_challenge.frame=CGRectMake(Height/9*3+50, 220, 80, 80);//原来+80
    btn_challenge.tag=101;
    [btn_challenge addTarget:self action:@selector(Btns:) forControlEvents:UIControlEventTouchUpInside];
//    [btn_challenge setBackgroundImage: [UIImage imageNamed:@"white_button.png"] forState:UIControlStateHighlighted];
    label_challenge=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, 80, 80)];
    label_challenge.backgroundColor=[UIColor clearColor];
    label_challenge.text=@"Challenge";
    label_challenge.textAlignment=NSTextAlignmentCenter;
    label_challenge.textColor=[UIColor whiteColor];
    [btn_challenge addSubview:label_challenge];
    [self.view addSubview:btn_challenge];
    
    btn_settings=[UIButton buttonWithType:UIButtonTypeCustom];
    btn_settings.frame=CGRectMake(Height/9*5+80, 220, 80, 80);
    btn_settings.tag=102;
    [btn_settings addTarget:self action:@selector(Btns:) forControlEvents:UIControlEventTouchUpInside];
 //   [btn_settings setBackgroundImage: [UIImage imageNamed:@"white_button.png"] forState:UIControlStateHighlighted];
    label_settings=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, 80, 80)];
    label_settings.backgroundColor=[UIColor clearColor];
    label_settings.text=@"Settings";
    label_settings.textAlignment=NSTextAlignmentCenter;
    label_settings.textColor=[UIColor whiteColor];
    [btn_settings addSubview:label_settings];
    [self.view addSubview:btn_settings];

}
-(void)Btns:(id)sender
{
    UIButton *btn=(UIButton *)sender;
    if(btn.tag==100)//play str
    {
       // [btn_playDirectly setBackgroundImage: [UIImage imageNamed:@"white_button.png"] forState:UIControlStateNormal];
        label_playDirectly.textColor=Green;
        MainViewController * mainVC = [[MainViewController alloc] initWithNibName:@"MainViewController" bundle:nil];
        [self presentModalViewController  :mainVC animated:YES];
        
    }
    if(btn.tag==101)
    {
       // [btn_challenge setBackgroundImage: [UIImage imageNamed:@"white_button.png"] forState:UIControlStateNormal];
        label_challenge.textColor=Green;
        ChallengeViewController * mainVC = [[ChallengeViewController alloc] initWithNibName:@"ChallengeViewController" bundle:nil];
        [self presentModalViewController  :mainVC animated:YES];
    }
    if(btn.tag==102)
    {
       // [btn_settings setBackgroundImage: [UIImage imageNamed:@"white_button.png"] forState:UIControlStateNormal];
        
        label_settings.textColor=Green;
        
        SettingViewController * mainVC = [[SettingViewController alloc] initWithNibName:@"SettingViewController" bundle:nil];
        [self presentModalViewController  :mainVC animated:YES];

    }
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

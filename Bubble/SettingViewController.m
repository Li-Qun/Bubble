//
//  SettingViewController.m
//  Bubble
//
//  Created by DAWEI FAN on 19/03/2014.
//  Copyright (c) 2014 huiztech. All rights reserved.
//

#import "SettingViewController.h"

@interface SettingViewController ()

@end

@implementation SettingViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.view.backgroundColor=[UIColor blackColor];
    }
    return self;
}
- (BOOL)prefersStatusBarHidden//隐藏状态栏
{
    return YES;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    app=(AppDelegate *)[[UIApplication sharedApplication] delegate];
    UILabel *label_Time=[[UILabel alloc]initWithFrame:CGRectMake(Height/6-20, 80, 200, 50)];
    label_Time.font=[UIFont fontWithName:@"Arial" size:20];
    label_Time.text=@"Show The Timer";
    label_Time.textColor=[UIColor whiteColor];
    label_Time.backgroundColor=[UIColor clearColor];
    [self.view addSubview:label_Time];
    
    button_Time_Y=[UIButton buttonWithType:UIButtonTypeCustom];
    button_Time_Y.frame=CGRectMake(Height/6-10, 150, 50, 50);
    button_Time_Y.tag=100;
    [button_Time_Y addTarget:self action:@selector(Buttons:) forControlEvents:UIControlEventTouchUpInside];
    [button_Chinese_Y setBackgroundImage: [UIImage imageNamed:@"white_button.png"] forState:UIControlStateHighlighted];
    [self.view addSubview:button_Time_Y];
    label_Time_Y=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, 50, 50)];
    label_Time_Y.textColor=[UIColor whiteColor];
    label_Time_Y.textAlignment=NSTextAlignmentCenter;
    label_Time_Y.text=@"YES";
    label_Time_Y.backgroundColor=[UIColor clearColor];
    label_Time_Y.font=[UIFont fontWithName:@"Arial" size:15];
    [button_Time_Y addSubview:label_Time_Y];
    
    button_Time_N=[UIButton buttonWithType:UIButtonTypeCustom];
    button_Time_N.frame=CGRectMake(Height/6+60, 150, 50, 50);
    button_Time_N.tag=101;
    [button_Time_N addTarget:self action:@selector(Buttons:) forControlEvents:UIControlEventTouchUpInside];
    [button_Time_N setBackgroundImage: [UIImage imageNamed:@"white_button.png"] forState:UIControlStateHighlighted];
    [self.view addSubview:button_Time_N];
    label_Time_N=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, 50, 50)];
    label_Time_N.textColor=[UIColor whiteColor];
    label_Time_N.textAlignment=NSTextAlignmentCenter;
    label_Time_N.text=@"NO";
    label_Time_N.backgroundColor=[UIColor clearColor];
    label_Time_N.font=[UIFont fontWithName:@"Arial" size:15];
    [button_Time_N addSubview:label_Time_N];
    
    UILabel *label_Language=[[UILabel alloc]initWithFrame:CGRectMake(Height/2, 80, 200, 50)];
    label_Language.font=[UIFont fontWithName:@"Arial" size:18];
    label_Language.text=@"Choose The Language";
    label_Language.textColor=[UIColor whiteColor];
    label_Language.backgroundColor=[UIColor clearColor];
    [self.view addSubview:label_Language];
    
    button_Chinese_Y=[UIButton buttonWithType:UIButtonTypeCustom];
    button_Chinese_Y.frame=CGRectMake(Height/2+20, 150, 50, 50);
    button_Chinese_Y.tag=102;
    [button_Chinese_Y addTarget:self action:@selector(Buttons:) forControlEvents:UIControlEventTouchUpInside];
    [button_Chinese_Y setBackgroundImage: [UIImage imageNamed:@"white_button.png"] forState:UIControlStateHighlighted];
    [self.view addSubview:button_Chinese_Y];
    label_Chinese_Y=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, 50, 50)];
    label_Chinese_Y.textColor=[UIColor whiteColor];
    label_Chinese_Y.textAlignment=NSTextAlignmentCenter;
    label_Chinese_Y.text=@"YES";
    label_Chinese_Y.backgroundColor=[UIColor clearColor];
    label_Chinese_Y.font=[UIFont fontWithName:@"Arial" size:15];
    [button_Chinese_Y addSubview:label_Chinese_Y];
    
    button_Chinese_N=[UIButton buttonWithType:UIButtonTypeCustom];
    button_Chinese_N.frame=CGRectMake(Height/2+90, 150, 50, 50);
    button_Chinese_N.tag=103;
    [button_Chinese_N addTarget:self action:@selector(Buttons:) forControlEvents:UIControlEventTouchUpInside];
    [button_Chinese_N setBackgroundImage: [UIImage imageNamed:@"white_button.png"] forState:UIControlStateHighlighted];
    [self.view addSubview:button_Chinese_N];
    label_Chinese_N=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, 50, 50)];
    label_Chinese_N.textColor=[UIColor whiteColor];
    label_Chinese_N.textAlignment=NSTextAlignmentCenter;
    label_Chinese_N.text=@"NO";
    label_Chinese_N.backgroundColor=[UIColor clearColor];
    label_Chinese_N.font=[UIFont fontWithName:@"Arial" size:15];
    [button_Chinese_N addSubview:label_Chinese_N];
    
    UIButton *goBack=[UIButton buttonWithType:UIButtonTypeCustom];
    [goBack setImage:[UIImage imageNamed:@"theGoBack"] forState:UIControlStateNormal];
    goBack.frame=CGRectMake(15, 10, 30, 30);
    goBack.tag=104;
    [goBack addTarget:self action:@selector(Buttons:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:goBack];
}
-(void)Buttons:(id)sender
{
    UIButton *btn=(UIButton *)sender;
    if(btn.tag==100)
    {
          app.isShowTimer=YES;
          [btn setBackgroundImage: [UIImage imageNamed:@"white_button.png"] forState:UIControlStateNormal];
          label_Time_Y.textColor=[UIColor blackColor];
          [button_Time_N setBackgroundImage: [UIImage imageNamed:@"clear_button.png"] forState:UIControlStateNormal];
          label_Time_N.textColor=[UIColor whiteColor];
    }
    if(btn.tag==101)
    {
        app.isShowTimer=NO;
        [btn setBackgroundImage: [UIImage imageNamed:@"white_button.png"] forState:UIControlStateNormal];
        label_Time_N.textColor=[UIColor blackColor];
        [button_Time_Y setBackgroundImage: [UIImage imageNamed:@"clear_button.png"] forState:UIControlStateNormal];
        label_Time_Y.textColor=[UIColor whiteColor];
    }
    if(btn.tag==102)
    {
        app.isChooseChinese=YES;
        [btn setBackgroundImage: [UIImage imageNamed:@"white_button.png"] forState:UIControlStateNormal];
        label_Chinese_Y.textColor=[UIColor blackColor];
        [button_Chinese_N setBackgroundImage: [UIImage imageNamed:@"clear_button.png"] forState:UIControlStateNormal];
        label_Chinese_N.textColor=[UIColor whiteColor];
    }
    if(btn.tag==103)
    {
        app.isChooseChinese=NO;
        [btn setBackgroundImage: [UIImage imageNamed:@"white_button.png"] forState:UIControlStateNormal];
        label_Chinese_N.textColor=[UIColor blackColor];
        [button_Chinese_Y setBackgroundImage: [UIImage imageNamed:@"clear_button.png"] forState:UIControlStateNormal];
        label_Chinese_Y.textColor=[UIColor whiteColor];
    }
    if(btn.tag==104)
    {
        [self dismissModalViewControllerAnimated:YES];
    }
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

//
//  GameSelectionViewController.m
//  Bubble
//
//  Created by DAWEI FAN on 20/03/2014.
//  Copyright (c) 2014 huiztech. All rights reserved.
//

#import "GameSelectionViewController.h"
#import "MainViewController.h"
@interface GameSelectionViewController ()

@end

@implementation GameSelectionViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
-(void)GameSelect_Buttons:(id)sender
{
    UIButton *btn=(UIButton *)sender;
    UILabel *label=(UILabel*)[array_label_gameSelect objectAtIndex:btn.tag-100];
    
    [btn setBackgroundImage: [UIImage imageNamed:@"white_button.png"] forState:UIControlStateNormal];
    label.textColor=[UIColor blackColor];
    for(int i=0;i<3;i++)
    {
        if(btn.tag!=i+100)
        {
            UIButton * button =(UIButton *)[array_button_gameSelect objectAtIndex:i];
            [button setBackgroundImage: [UIImage imageNamed:@"clear_button.png"] forState:UIControlStateNormal];
            UILabel *label_button=(UILabel *)[array_label_gameSelect objectAtIndex:i];
            label_button.textColor=[UIColor whiteColor];
        }
    }
    [self mentionView:btn.tag];
}
-(void)mentionView:(int)Tag//三种玩法 示意图
{
    
    view_gameSelect=[[UIView alloc]initWithFrame:CGRectMake(0, 0, Height, KWidth)];
    view_gameSelect.backgroundColor=[UIColor blackColor];
//    UIView *ad_View=[[UIView alloc]initWithFrame:CGRectMake(0, 0,Height, 45)];
//    ad_View.backgroundColor=[UIColor blueColor];
//    [view_gameSelect addSubview:ad_View];
    [self.view addSubview:view_gameSelect];
  
    UITextView *textView=[[UITextView alloc]initWithFrame:CGRectMake(Height/10, 60, 250, KWidth-80)];
    textView.backgroundColor=[UIColor clearColor];
    textView.textColor=[UIColor whiteColor];
    //textView.textAlignment=NSTextAlignmentCenter;
    textView.font=[UIFont fontWithName:@"Arial" size:16];
    textView.editable=NO;//不可编辑 关闭键盘
    textView.text=[array_textView_content objectAtIndex:Tag-100];
    [view_gameSelect addSubview:textView];
    
   UIButton * button_Ready=[UIButton buttonWithType:UIButtonTypeCustom];
    button_Ready.frame=CGRectMake(Height/2+110, 130, 90, 90);
    button_Ready.tag=101;
    [button_Ready addTarget:self action:@selector(GotoPlay) forControlEvents:UIControlEventTouchUpInside];
    [button_Ready setBackgroundImage: [UIImage imageNamed:@"white_button.png"] forState:UIControlStateNormal];
    [self.view addSubview:button_Ready];
    UILabel *label_Ready=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, 90, 90)];
    label_Ready.textColor=[UIColor blackColor];
    label_Ready.textAlignment=NSTextAlignmentCenter;
    label_Ready.text=[array_button_Name objectAtIndex:Tag-100];
    label_Ready.backgroundColor=[UIColor clearColor];
    label_Ready.font=[UIFont fontWithName:@"Arial" size:20];
    [button_Ready addSubview:label_Ready];
}
-(void)GotoPlay
{
    MainViewController * mainVC = [[MainViewController  alloc] initWithNibName:@"MainViewController" bundle:nil];
    [self presentModalViewController  :mainVC animated:YES];
}
-(void)Pretreatment//预处理 比如初始化等方法
{
    array_button_gameSelect=[[NSMutableArray alloc]init];
    array_label_gameSelect=[[NSMutableArray alloc]init];
    array_button_Name=[[NSArray alloc]initWithObjects:@"persons",@"teams",@"shots",nil];
    NSString *str1=@"Goodbye  Again,  Cambridge! I  leave  softly,  gently,Exactly  as  I  came. I  wave  to  the  western  sky,Telling  it  goodbye  softly,  gently.";
    NSString *str2=@"The  golden  willow  at  the  river  edge Is  the  setting  sun‘s  bride. Her  quivering  reflection Stays  fixed  in  my  mind.";
    NSString *str3=@"Green  grass  on  the  bank Dances  on  a  watery  floor In  bright  reflection.I  wish  myself  a  bit  of  waterweed Vibrating  to  the  ripple.";
    array_textView_content=[[NSArray alloc]initWithObjects:str1,str2,str3, nil];
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    [self Pretreatment];//预处理 比如初始化等方法
    self.view.backgroundColor=[UIColor blackColor];
//    UIView *ad_View=[[UIView alloc]initWithFrame:CGRectMake(0, 0,Height, 40)];
//    ad_View.backgroundColor=[UIColor blueColor];
//    [self.view addSubview:ad_View];
    
    
    for(int i=0;i<3;i++)
    {
        UIButton *button_Num=[UIButton buttonWithType:UIButtonTypeCustom];
        button_Num.frame=CGRectMake(Height/10-5+i*150, 150, 80, 80);

        button_Num.tag=100+i;
        [button_Num addTarget:self action:@selector(GameSelect_Buttons:) forControlEvents:UIControlEventTouchDown];//点击一次就响应
        [button_Num setBackgroundImage: [UIImage imageNamed:@"white_button.png"] forState:UIControlStateHighlighted];
    
        UILabel *label_Num=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, 80, 80)];
        label_Num.backgroundColor=[UIColor clearColor];
        label_Num.textColor=[UIColor whiteColor];
        label_Num.text=[array_button_Name objectAtIndex:i];
        label_Num.font=[UIFont fontWithName:@"Arial" size:20];
        label_Num.textAlignment=NSTextAlignmentCenter;
        label_Num.tag=200+i;
        [button_Num addSubview:label_Num];
        [self.view addSubview:button_Num];
        [array_button_gameSelect addObject:button_Num];
        [array_label_gameSelect addObject:label_Num];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

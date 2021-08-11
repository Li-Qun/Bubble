//
//  RankingsViewController.m
//  Bubble
//
//  Created by DAWEI FAN on 20/03/2014.
//  Copyright (c) 2014 huiztech. All rights reserved.
//

#import "RankingsViewController.h"
#import "RootViewController.h"
#import "MainViewController.h"
#import "IsRead.h"
@interface RankingsViewController ()

@end

@implementation RankingsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
-(void)InitEverything
{
    scrollView_RankList=[[UIScrollView alloc]initWithFrame:CGRectMake(Height/9+80, 45, Height-(Height/9+80)*2, KWidth-80)];
    
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor blackColor];
    [self InitEverything];
    [self FourButton];
    [self Make_RankingList];
}
-(void)Make_RankingList
{
    scrollView_RankList.backgroundColor=[UIColor clearColor];
    scrollView_RankList.contentSize=CGSizeMake(0,1000);
    UILabel *label_Round=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, scrollView_RankList.frame.size.width, 30)];
    label_Round.backgroundColor=[UIColor clearColor];
    label_Round.textAlignment=NSTextAlignmentCenter;
    label_Round.textColor=[UIColor whiteColor];
    label_Round.font=[UIFont fontWithName:@"Arial" size:25];
    label_Round.text=[NSString stringWithFormat:@"Round 1"];
    [scrollView_RankList addSubview:label_Round];
    
    int height=40;
    for(int i=0;i<[IsRead sharedInstance].gameData.count;i++)
    {
        
        UILabel *label_Player=[[UILabel alloc]initWithFrame:CGRectMake(0, height, scrollView_RankList.frame.size.width, 30)];
        label_Player.backgroundColor=[UIColor clearColor];
        label_Player.textAlignment=NSTextAlignmentCenter;
        label_Player.textColor=[UIColor whiteColor];
        label_Player.font=[UIFont fontWithName:@"Arial" size:20];
        label_Player.text=[NSString stringWithFormat:@"Player %d",i+1];
        [scrollView_RankList addSubview:label_Player];
        
        height=height+10;
        UILabel *label_Second=[[UILabel alloc]initWithFrame:CGRectMake(0, height+10, scrollView_RankList.frame.size.width, 30)];
        label_Second.backgroundColor=[UIColor clearColor];
        label_Second.font=[UIFont systemFontOfSize:18];
        
        label_Second.textAlignment=NSTextAlignmentCenter;
        label_Second.textColor=[UIColor whiteColor];
        label_Second.text=[NSString stringWithFormat:@"%@",[[IsRead sharedInstance].gameData objectAtIndex:i]];
        [scrollView_RankList addSubview:label_Second];
        height=height+15+10+10+10;
    }
    [self.view addSubview:scrollView_RankList];
}
-(void)rank_Buttons:(id)sender
{
    UIButton *btn=(UIButton *)sender;
    if(btn.tag==201)
    {
        NSLog(@"FaceBook");
    }
    if(btn.tag==202)
    {
        NSLog(@"Twitter");
    }
    if(btn.tag==203)
    {
        NSLog(@"返回继续游戏");
        MainViewController * mainVC = [[MainViewController alloc] initWithNibName:@"MainViewController" bundle:nil];
        [self presentModalViewController  :mainVC animated:YES];

    }
    if(btn.tag==204)
    {
        NSLog(@"首页");
        RootViewController * mainVC = [[RootViewController alloc] initWithNibName:@"RootViewController" bundle:nil];
        [self presentModalViewController  :mainVC animated:YES];
    }
    
}
-(void)FourButton
{
    UIButton *faceBook=[UIButton buttonWithType:UIButtonTypeCustom];
    faceBook.frame=CGRectMake(Height/9-10, 100-40, 70, 70);
    [faceBook setImage:[UIImage imageNamed:@"FaceBook.png"] forState:UIControlStateNormal];
    faceBook.tag=201;
    [faceBook addTarget:self action:@selector(rank_Buttons:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:faceBook];
    
    UIButton *Twitter=[UIButton buttonWithType:UIButtonTypeCustom];
    Twitter.frame=CGRectMake(Height/9-10, 220-40, 70, 70);
    [Twitter setImage:[UIImage imageNamed:@"Twitter.png"] forState:UIControlStateNormal];
    Twitter.tag=202;
    [Twitter addTarget:self action:@selector(rank_Buttons:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:Twitter];
    
    UIButton *GameBegin=[UIButton buttonWithType:UIButtonTypeCustom];
    GameBegin.frame=CGRectMake(Height/2+fabs(Height/2-(Height/9-10))-70, 100-40, 70, 70);
    [GameBegin setImage:[UIImage imageNamed:@"white_button.png"] forState:UIControlStateNormal];
    GameBegin.tag=203;
    [GameBegin addTarget:self action:@selector(rank_Buttons:) forControlEvents:UIControlEventTouchUpInside];
    UILabel *label_Next=[[UILabel alloc]initWithFrame:CGRectMake(0,0, 70, 70)];
    label_Next.backgroundColor=[UIColor clearColor];
    label_Next.textAlignment=NSTextAlignmentCenter;
    label_Next.textColor=[UIColor blackColor];
    label_Next.font=[UIFont fontWithName:@"Arial" size:16];
    label_Next.text=@"Continue";
    [GameBegin addSubview:label_Next];
    [self.view addSubview:GameBegin];
    
    UIButton *Rank_List=[UIButton buttonWithType:UIButtonTypeCustom];
    Rank_List.frame=CGRectMake(Height/2+fabs(Height/2-(Height/9-10))-70, 220-40, 70, 70);
    [Rank_List setImage:[UIImage imageNamed:@"Bubble.png"] forState:UIControlStateNormal];
    Rank_List.tag=204;
    [Rank_List addTarget:self action:@selector(rank_Buttons:) forControlEvents:UIControlEventTouchUpInside];
    UILabel *label_Home=[[UILabel alloc]initWithFrame:CGRectMake(0,0, 70, 70)];
    label_Home.backgroundColor=[UIColor clearColor];
    label_Home.textAlignment=NSTextAlignmentCenter;
    label_Home.textColor=[UIColor whiteColor];
    label_Home.font=[UIFont fontWithName:@"Arial" size:17];
    label_Home.text=@"Home";
    [Rank_List addSubview:label_Home];
    [self.view addSubview:Rank_List];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (BOOL)prefersStatusBarHidden//隐藏状态栏
{
    return YES;
}
@end

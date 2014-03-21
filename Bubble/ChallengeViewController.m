//
//  ChallengeViewController.m
//  Bubble
//
//  Created by DAWEI FAN on 20/03/2014.
//  Copyright (c) 2014 huiztech. All rights reserved.
//

#import "ChallengeViewController.h"
#import "GameSelectionViewController.h"
@interface ChallengeViewController ()

@end

@implementation ChallengeViewController

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
-(void)Challenge_Buttons:(id)sender
{
    UIButton *btn=(UIButton *)sender;
    UILabel *label=(UILabel*)[array_labelNum objectAtIndex:btn.tag-100];
    app.account_play=btn.tag-100+1;
    [btn setBackgroundImage: [UIImage imageNamed:@"white_button.png"] forState:UIControlStateNormal];
    label.textColor=[UIColor blackColor];
    for(int i=0;i<10;i++)
    {
        if(btn.tag!=i+100)
        {
            UIButton * button =(UIButton *)[array_Button objectAtIndex:i];
            [button setBackgroundImage: [UIImage imageNamed:@"clear_button.png"] forState:UIControlStateNormal];
            UILabel *label_button=(UILabel *)[array_labelNum objectAtIndex:i];
            label_button.textColor=[UIColor whiteColor];
        }
    }
    GameSelectionViewController * mainVC = [[GameSelectionViewController alloc] initWithNibName:@"GameSelectionViewController" bundle:nil];
    [self presentModalViewController  :mainVC animated:YES];
//    if(btn.tag==100)
//    {
//        NSLog(@"%d",btn.tag);
//       [btn setBackgroundImage: [UIImage imageNamed:@"white_button.png"] forState:UIControlStateNormal];
//    }
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    app=(AppDelegate *)[[UIApplication sharedApplication] delegate];
    array_Button=[[NSMutableArray alloc]init];
    array_labelNum=[[NSMutableArray alloc]init];
    UILabel *label_mention=[[UILabel alloc]initWithFrame:CGRectMake(0, 30, Height, 40)];
    label_mention.backgroundColor=[UIColor clearColor];
    label_mention.textColor=[UIColor whiteColor];
    label_mention.textAlignment=NSTextAlignmentCenter;
    label_mention.font=[UIFont fontWithName:@"Arial" size:18];
    label_mention.text=@"Double tap on the amount of players";
    [self.view addSubview:label_mention];
    int j=0;
    for(int i=0;i<10;i++)
    {
        UIButton *button_Num=[UIButton buttonWithType:UIButtonTypeCustom];
        if(i>=5)
        {
            button_Num.frame=CGRectMake(Height/10-5+j*85, 210, 60, 60);
            j++;
        }
        else
        {
            button_Num.frame=CGRectMake(Height/10-5+i*85, 100, 60, 60);
        }
        button_Num.tag=100+i;
        [button_Num addTarget:self action:@selector(Challenge_Buttons:) forControlEvents:UIControlEventTouchDownRepeat];//点击超过一次响应
        [button_Num setBackgroundImage: [UIImage imageNamed:@"white_button.png"] forState:UIControlStateHighlighted];
        UILabel *label_Num=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, 60, 60)];
        label_Num.backgroundColor=[UIColor clearColor];
        label_Num.textColor=[UIColor whiteColor];
        label_Num.text=[NSString stringWithFormat:@"%d",i+1];
        label_Num.font=[UIFont fontWithName:@"Arial" size:38];
        label_Num.textAlignment=NSTextAlignmentCenter;
        label_Num.tag=200+i;
        [button_Num addSubview:label_Num];
        [self.view addSubview:button_Num];
        [array_Button addObject:button_Num];
        [array_labelNum addObject:label_Num];
    }
    

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

//
//  MainViewController.m
//  TextDemo
//
//  Created by DAWEI FAN on 07/03/2014.
//  Copyright (c) 2014 huiztech. All rights reserved.
//

#import "MainViewController.h"
#import "RankingsViewController.h"
#import <CoreMotion/CoreMotion.h>  
#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "Singleton.h"
#import "IsRead.h"

#define PI 3.14159265358979323846


#define Height  [UIScreen mainScreen].bounds.size.height
#define SIZE 10
#define Image 200
#define Accuracy 1.5
#define kMaxAngle 90.0

///////
#define kTransitionDuration	0.75
#define kUpdateFrequency 20  // Hz
#define kFilteringFactor 100
#define kNoReadingValue 999

//UIColor *testColor1= [UIColor colorWithRed:240/255.0 green:240/255.0 blue:240/255.0 alpha:1];

@interface MainViewController ()

@end

@implementation MainViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
      motionManager = [[CMMotionManager alloc]init];
    }
    return self;
}

- (BOOL)prefersStatusBarHidden//隐藏状态栏
{
    return YES;
}

-(void)setBackGround
{


}
-(CGRect)x:(float)x y:(float)y//竖屏
{
    int core_x=320/2;
    int core_y=Height/2;
    
    if(x<core_x&&y<core_y)//左上
    {
        x=(core_x-x)+core_x;
        y=core_y-y+core_y;
    }
    else if(x<core_x&&y>core_y)//左下
    {
        x=core_x+(core_x-x);
        y=core_y-(y-core_y);
    }
    else if(x>core_x&&y<core_y)//右上
    {
        x=core_x-(x-core_x);
        y=core_y+(core_y-y);
    }
    else if(x>core_x&&y>core_y)//右下
    {
        y=core_y-(y-core_y);
        x=core_x-(x-core_x);
    }
    if(x==core_x&&y>core_y)//上
    {
        y=core_y-y+core_y;
    }
    if(x==core_x&&y<core_y)//下
    {
        y=core_y-y+core_y;
    }
    if(x>core_x&&y==core_y)//右
    {
        x=core_x-fabs(x-core_x);

    }
    if(x<core_x&&y==core_y)//左
    {
        x=core_x+fabs(x-core_x);

    }
    if(x==core_x&&y==core_x)
    {
        x=core_x;
        y=core_y;
    }
    CGRect rect = CGRectMake(0.0, 0.0, x, y);
    return rect;
}
-(CGRect)XX:(float)x YY:(float)y//横屏
{
    
    int core_x=320/2;
    int core_y=Height/2;
    if(x<core_x&&y<core_y)//左上
    {
        x=core_x+fabs(core_x-x);
        y=core_y+fabs(core_y-y);
    }
    else if(x>core_x&&y<core_y)//右上
    {
        x=core_x-fabs(x-core_x);
        y=core_y+fabs(core_y-y);
    }
    else if(x>core_x&&y>core_y)//右下
    {
        x=core_x-fabs(x-core_x);
        y=core_y-fabs(y-core_y);
        
    }
    else if (x<core_x&&y>core_y)//左下
    {
        x=core_x+fabs(x-core_x);
        y=core_y-fabs(y-core_y);
    }
    if(x==core_x&&y>core_y)//上
    {
        y=core_y+fabs(y-core_y);
    }
    if(x==core_x&&y<core_y)//下
    {
        y=core_y-fabs(y-core_y);
    }
    if(x>core_x&&y==core_y)//右
    {
        x=core_x-fabs(x-core_x);
    }
    if(x<core_x&&y==core_y)//左
    {
        x=core_x+fabs(x-core_x);
    }
    if(x==core_x&&y==core_x)
    {
        x=core_x;
        y=core_y;
    }
    CGRect rect = CGRectMake(0.0, 0.0, x, y);
    return rect;
}
-(void)main_Buttons:(id)sender
{
    UIButton *btn=(UIButton *)sender;
    if(btn.tag==100)
    {   view_Ready.hidden=YES;
       // [self.view addSubview:goBack];

        label_totalTime.frame=CGRectMake(15, 10, 145, 30);//CGRectMake(Height-150, 10, 145, 30);
        label_totalTime.textColor=[UIColor whiteColor];
        label_totalTime.backgroundColor=[UIColor clearColor];
        label_totalTime.textAlignment=NSTextAlignmentCenter;
        label_totalTime.font=[UIFont fontWithName:@"Arial" size:18];
        label_rotation.frame= CGRectMake(Height/2-75, 160-25,150, 50);//横屏
        [self.view addSubview:label_rotation];
        [self.view addSubview:label_totalTime];
        [self Game_Begin];
    }
    if(btn.tag==101)
    {
        [self dismissModalViewControllerAnimated:YES];
    }
    if(btn.tag==201)//facebook
    {
        NSLog(@"faceBook");
    }
    if(btn.tag==202)//twitter
    {
        NSLog(@"twitter");
    }
    if(btn.tag==203)
    {
        NSLog(@"游戏继续");
        
        if(app.account_play==[IsRead sharedInstance].gameData.count)
        {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Mention"
                                                            message:@"Game Over"
                                                           delegate:nil
                                                  cancelButtonTitle:@"YES"
                                                  otherButtonTitles: nil];
            [alert show];
            return;
  
        }
        else
        {
            for (id obj in self.view.subviews) {
                //            if ([obj isKindOfClass:[UIButton class]] ) {
                //
                //                UIButton *button=obj;
                //                if(button.tag!=101)//保留返回按钮
                //                [button removeFromSuperview];
                //            }
                if ([obj isKindOfClass:[UIView class]]||[obj isKindOfClass:label_totalTime] ) {
                    
                    [obj removeFromSuperview];
                }
                
            }
            isNextPlayer=YES;
            [self AreYouReady];
            // [self Game_Begin];
        }

    }
    if(btn.tag==204)
    {
        NSLog(@"查看排名");
        RankingsViewController * mainVC = [[RankingsViewController alloc] initWithNibName:@"RankingsViewController" bundle:nil];
        [self presentModalViewController  :mainVC animated:YES];
    }
}
-(void)viewDidLoad
{
    [super viewDidLoad];
    [self setBackGround];
    isNextPlayer=NO;
    self.view.backgroundColor=[UIColor blackColor];
    app=(AppDelegate *)[[UIApplication sharedApplication] delegate];
    array=[[NSArray alloc]initWithObjects:@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",nil];
    imageView=[[UIImageView alloc]init];
    imageView.image=[UIImage imageNamed:@"Bubble.png"];
    [self.view addSubview:imageViewTwo];
    imageViewTwo=[[UIImageView alloc]init];
    imageViewTwo.image=[UIImage imageNamed:@"Bubble.png"];
    [self.view addSubview:imageViewTwo];
    baby=[[UIImageView alloc]initWithFrame:CGRectMake(0, 350, 55, 55)];
    baby.image=[UIImage imageNamed:@"baby.jpg"];
    
    label_rotation=[[UILabel alloc]init] ;
    label_rotation.frame= CGRectMake(160-75, Height/2-25,150, 50);//竖屏
    label_rotation.frame= CGRectMake(Height/2-75, 160-25,150, 50);//横屏
    label_rotation.textAlignment= NSTextAlignmentCenter;
    [self.view addSubview:label_rotation];
    label_rotation.textColor=[UIColor whiteColor];
    label_rotation.backgroundColor=[UIColor clearColor];
    label_rotation.font= [UIFont fontWithName:@"Arial" size:40];
    
    goBack=[UIButton buttonWithType:UIButtonTypeCustom];
    [goBack setImage:[UIImage imageNamed:@"theGoBack"] forState:UIControlStateNormal];
    goBack.frame=CGRectMake(15, 10, 30, 30);
    goBack.tag=101;
    [goBack addTarget:self action:@selector(main_Buttons:) forControlEvents:UIControlEventTouchUpInside];
    //[self.view addSubview:goBack];
    
    label_totalTime=[[UILabel alloc]initWithFrame:CGRectMake(15, 10, 145, 30)];
    label_totalTime.textColor=[UIColor whiteColor];
    label_totalTime.backgroundColor=[UIColor clearColor];
    label_totalTime.textAlignment=NSTextAlignmentCenter;
    label_totalTime.font=[UIFont fontWithName:@"Arial" size:18];
    label_totalTime.text=@"";
    [self.view addSubview:label_totalTime];


}
-(void)viewWillAppear:(BOOL)animated
{
    if (!motionManager.accelerometerAvailable) {
        // fail code // 检查传感器到底在设备上是否可用
    }
    motionManager.accelerometerUpdateInterval = 0.01; // 告诉manager，更新频率是100Hz
    /* 加速度传感器开始采样，每次采样结果在block中处理 */
    // 开始更新，后台线程开始运行。
   // [self Game_Began];
    [self AreYouReady];
    [self scrollView_Mention];
    
}
-(void)AreYouReady
{
    view_Ready=[[UIView alloc]initWithFrame:CGRectMake(0, 0, Height, 320)];
    view_Ready.backgroundColor=[UIColor blackColor];
    [self.view addSubview:view_Ready];
    UIButton *button=[UIButton buttonWithType:UIButtonTypeCustom];
    
    if(isNextPlayer)
    {
        //居中
        isNextPlayer=NO;
         button.frame=CGRectMake(Height/2-100, 160-100, 200, 200);//居中
    }
    else
    {
         button.frame=CGRectMake(30, 160-100, 200, 200);//最左边
    }
    button.tag=100;
    [button setBackgroundImage: [UIImage imageNamed:@"white_button.png"]forState:UIControlStateNormal];
    [button addTarget:self action:@selector(main_Buttons:) forControlEvents:UIControlEventTouchUpInside];
    [view_Ready addSubview:button];
    
    UILabel *label_button=[[UILabel alloc]initWithFrame:CGRectMake(60, 0, 80, 200)];
    label_button.backgroundColor=[UIColor clearColor];
    label_button.text=@"tap to start";
    label_button.textColor=[UIColor grayColor];
    label_button.textAlignment=NSTextAlignmentCenter;
    label_button.font=[UIFont fontWithName:@"Arial" size:38];
    label_button.lineBreakMode =  NSLineBreakByWordWrapping ;//设置换行
    label_button.numberOfLines=3;//表示行数
    [button addSubview:label_button];
    
    
}
-(void)scrollView_Mention
{
//    //滚动图片
//    UIScrollView *scrollView_Pose=[[UIScrollView alloc]initWithFrame:CGRectMake(Height/2+110,40, Height/2-100, 220)];
//    scrollView_Pose.backgroundColor=[UIColor clearColor];
//    scrollView_Pose.contentSize=CGSizeMake(0, 220*8);
//    scrollView_Pose.delegate=self;
//    for(int i=0;i<8;i++)
//    {
//        UIImageView *imageView_scroll=[[UIImageView alloc]initWithFrame:CGRectMake(0, (220)*i, Height/2-100, 220)];
//       [imageView_scroll setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%d.png",i+10]]];
//        [scrollView_Pose addSubview:imageView_scroll];
//    }
//    scrollView_Pose.pagingEnabled=YES;
//    [view_Ready addSubview:scrollView_Pose];
//    //对应动态变化标签文本
//    
//   // label_scroll=[[UILabel alloc]initWithFrame:CGRectMake(20, 30, Height/2-120, 220)];
//    label_scroll=[[UILabel alloc]initWithFrame:CGRectMake(215, 40, Height/2-120, 220)];
//    label_scroll.backgroundColor=[UIColor yellowColor];
//    label_scroll.textAlignment=NSTextAlignmentCenter;
//    label_scroll.textColor=[UIColor whiteColor];
//    label_scroll.text=@"1";
//    [view_Ready addSubview:label_scroll];
    
    
    //滚动图片
    UIScrollView *scrollView_Pose=[[UIScrollView alloc]initWithFrame:CGRectMake(Height/2,0, Height/2, 320)];
    scrollView_Pose.backgroundColor=[UIColor clearColor];
    scrollView_Pose.contentSize=CGSizeMake(0, 320*14);
    scrollView_Pose.delegate=self;
    for(int i=0;i<14;i++)
    {
        UIImageView *imageView_scroll=[[UIImageView alloc]initWithFrame:CGRectMake(0, (320)*i, Height/2, 320)];
        [imageView_scroll setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%d.png",i+10]]];
       imageView_scroll.backgroundColor=[UIColor clearColor];
        [scrollView_Pose addSubview:imageView_scroll];
    }
    scrollView_Pose.pagingEnabled=YES;
    [view_Ready addSubview:scrollView_Pose];
    //对应动态变化标签文本
    
    // label_scroll=[[UILabel alloc]initWithFrame:CGRectMake(20, 30, Height/2-120, 220)];
    label_scroll=[[UILabel alloc]initWithFrame:CGRectMake(215, 40, Height/2-120, 220)];
    label_scroll.backgroundColor=[UIColor yellowColor];
    label_scroll.textAlignment=NSTextAlignmentCenter;
    label_scroll.textColor=[UIColor whiteColor];
    label_scroll.text=@"1";
    //[view_Ready addSubview:label_scroll];
    

}

-(NSString *)getTimeNow //精确到毫秒的系统时间
{
    NSDate * senddate=[NSDate date];
    
    NSDateFormatter *dateformatter=[[NSDateFormatter alloc] init];
    
  //  [dateformatter setDateFormat:@"ss:SS"];//hh:mm:ss:SSS
    [dateformatter setDateFormat:@"hh:mm:ss:SSS"];
    NSString * locationString=[dateformatter stringFromDate:senddate];
    NSLog(@"==%@==",locationString);
    return locationString;
}
-(NSString *)Date_To_Second:(NSString *)time
{
    NSString *H=[time substringWithRange:NSMakeRange(0,2)];
    NSString *M=[time substringWithRange:NSMakeRange(3,2)];
    NSString *S=[time substringWithRange:NSMakeRange(6,2)];
    NSString *hs=[time substringWithRange:NSMakeRange(9,3)];

    //(小时乘以3600+分乘以60+秒)*1000，
    long long  total=[M intValue]*60+[S intValue]+[H integerValue]*3600 ;
    NSString *ss=[NSString stringWithFormat:@"%lld",total*1000+[hs integerValue]];
    // NSLog(@"X%@XX%@XXX%@XXXX%@",H,M,S,hs);
    return ss;
}
-(NSString*)Second_To_Date:(NSString*)time
{
    NSString * newTimeNow;
    if(!YES)
    {
        long long M=[time integerValue]/1000/60;
        long long S=[time integerValue]/1000-M*60;
        long long hs=([time floatValue]-M*60*1000-S*1000)/10;
        newTimeNow=[NSString stringWithFormat:@"%lld:%lld:%lld Second",M,S,hs];

    }
    else
    {
        long long S=[time integerValue]/1000;
        long long hs=([time integerValue]-S*1000)/10;
        newTimeNow=[NSString stringWithFormat:@"%lld:%lld Seconds",S,hs];
    }
    return newTimeNow;
}
-(NSString*)start_Time: (NSString*) start endTime:(NSString *)end
{
    
    long long time=[[self Date_To_Second:end] integerValue]-[[self Date_To_Second:start] integerValue];
    NSString *time_string=[NSString stringWithFormat:@"%lld",time];
    time_string=[self Second_To_Date:time_string];
   // NSLog(@"==================%lld",time);
    return time_string;
}
-(void)Game_Began
{
    //======start
  
    //======关闭计时器 end
    imageView.frame=CGRectMake(100,200, Image, Image);
    [self.view addSubview:imageView];
    [self.view setBackgroundColor:[UIColor blackColor]];
    [[UIAccelerometer sharedAccelerometer] setUpdateInterval:(1.0 / kUpdateFrequency)];
    [[UIAccelerometer sharedAccelerometer] setDelegate:self];
    [motionManager startAccelerometerUpdates];
    CMAccelerometerData *newestAccel = motionManager.accelerometerData;
     accelerationX2 = newestAccel.acceleration.x;
     accelerationY2 = newestAccel.acceleration.y;
     accelerationZ2 = newestAccel.acceleration.z;

}
-(void)Game_Begin
{
    
    [self.view setBackgroundColor:[UIColor blackColor]];
    isStop=NO;
    startTime=[self getTimeNow];
    
    
    
    [motionManager startAccelerometerUpdatesToQueue:[NSOperationQueue currentQueue] withHandler:^(CMAccelerometerData *accelerometerData, NSError *error)
     {
         
         if(!isStop)
         {
             label_totalTime.text=[self start_Time: startTime endTime:[self getTimeNow]];
             isOpen=YES;
             CMAccelerometerData *newestAccel = motionManager.accelerometerData;
             double accelerationX = newestAccel.acceleration.x;
             double accelerationY = newestAccel.acceleration.y;
             double accelerationZ = newestAccel.acceleration.z;
             
             //Gravity 获取手机的重力值在各个方向上的分量，根据这个就可以获得手机的空间位置，倾斜角度等
             double gravityX = accelerationX;
             double gravityY = accelerationY;
             double gravityZ = accelerationZ;
             
             
             
             //获取手机的倾斜角度：
             //zTheta是手机与水平面的夹角， xyTheta是手机绕自身旋转的角度
             double zTheta = atan2(gravityZ,sqrtf(gravityX*gravityX+gravityY*gravityY))/M_PI*180.0;
             
             //   double xyTheta = atan2(gravityX,gravityY)/M_PI*180.0;
             label_rotation.text=[NSString stringWithFormat:@"-%.1f",zTheta+90];
             label_rotation.text = [label_rotation.text stringByAppendingString:@"º"];
             //   label_rotation.transform= CGAffineTransformMakeRotation(M_PI/2);//顺时针旋转
             [self.view addSubview:label_rotation];
             
             
             
             f.origin.x += (accelerationX * SIZE) * 1;
             f.origin.y += (accelerationY* SIZE) * -1;
             
             if(f.origin.x < 0-Image/2)
                 f.origin.x = 0-Image/2;
             if(f.origin.y < 0-Image/2)
                 f.origin.y = 0-Image/2;
             if(f.origin.x>=320-Image/2)f.origin.x=320-Image/2;
             if(f.origin.y>=Height-Image/2)f.origin.y=Height-Image/2;
             
             /* 运动动画 */
             [UIView beginAnimations:nil context:nil];
             [UIView setAnimationDuration:0.1];
             imageView.frame=CGRectMake(f.origin.y,f.origin.x, Image, Image);
             //   CGRect rect=[self x:f.origin.x+Image/2 y:f.origin.y+Image/2];
             CGRect rect=[self XX:f.origin.x+Image/2 YY:f.origin.y+Image/2];
             
             
             imageViewTwo.frame=CGRectMake(rect.size.height-Image/2,rect.size.width-Image/2, Image, Image);
             [self.view addSubview:imageView];
             [self.view addSubview:imageViewTwo];
             
             float P=(imageView.center.x-imageViewTwo.center.x)*(imageView.center.x-imageViewTwo.center.x)-(imageView.center.y-imageViewTwo.center.y)*(imageView.center.y-imageViewTwo.center.y);
             if(P>=0&&P<=Accuracy)
             {
                 isStop=YES;
                 [motionManager stopAccelerometerUpdates];
                 
                 
                 
                 [UIView animateWithDuration:2.0 animations:^{
                     CATransform3D transform = CATransform3DMakeScale(0, 0, 1);
                     imageView.frame=CGRectMake(Height/2-Image/2, 160-Image/2, Image, Image);
                     imageViewTwo.frame=imageView.frame;
                     label_rotation.text=[NSString stringWithFormat:@"-%.1f",0.0];
                     label_rotation.text = [label_rotation.text stringByAppendingString:@"º"];
                     [self.view addSubview:label_rotation];
                     
                 } completion:^(BOOL finished) {
                     
//                     UIView *ad_View=[[UIView alloc]initWithFrame:CGRectMake(0, 0,Height, 40)];
//                     ad_View.backgroundColor=[UIColor blueColor];
//                     [self.view addSubview:ad_View];
                     UIImageView *imageView_white=[[UIImageView alloc]initWithFrame:imageView.frame];
                     imageView_white.image=[UIImage imageNamed:@"white_button.png"];
                     [self.view addSubview:imageView_white];
                     
                     NSString *time=[self start_Time: startTime endTime:[self getTimeNow]];
                     NSArray *_array = [time componentsSeparatedByString:@" "];
                     NSLog(@"animals:%@",_array);
                     label_totalTime.text=[_array objectAtIndex:0];
                     label_totalTime.frame=CGRectMake(Height/2-45-30, 130, 150,40);
                     label_totalTime.font=[UIFont fontWithName:@"Arial" size:45];
                     label_totalTime.textColor=Green;
                     UILabel *label_word_Second=[[UILabel alloc]initWithFrame:CGRectMake(Height/2-75, 160,150, 50)];
                     label_word_Second.text=@"seconds";
                     label_word_Second.textColor=[UIColor lightGrayColor];
                     label_word_Second.backgroundColor=[UIColor clearColor];
                     label_word_Second.font=[UIFont fontWithName:@"Arial" size:30];
                     label_word_Second.textAlignment=NSTextAlignmentCenter;
                     [self.view addSubview:label_totalTime];
                     [self.view addSubview:label_word_Second];
                     label_rotation.frame=CGRectMake(0, 0, 0, 0);
                     self.view.backgroundColor=Green;//[UIColor greenColor];
                     endTime_second=time;//[self Date_To_Second:time];
                     //记录成绩单例模式
                     [[IsRead sharedInstance].gameData addObject:endTime_second];//记录成绩单例模式
                      NSLog(@"%@",[IsRead sharedInstance].gameData);

                     [self gameOver];
                     
                 }];
             }
         }
     }];
    
    /*
     
     //1. Accelerometer 获取手机加速度数据
     CMAccelerometerData *newestAccel = motionManager.accelerometerData;
     double accelerationX = newestAccel.acceleration.x;
     double accelerationY = newestAccel.acceleration.y;
     double accelerationZ = newestAccel.acceleration.z;
     
     //2. Gravity 获取手机的重力值在各个方向上的分量，根据这个就可以获得手机的空间位置，倾斜角度等
     double gravityX = motionManager.deviceMotion.gravity.x;
     double gravityY = motionManager.deviceMotion.gravity.y;
     double gravityZ = motionManager.deviceMotion.gravity.z;
     
     //获取手机的倾斜角度：
     double zTheta = atan2(gravityZ,sqrtf(gravityX*gravityX+gravityY*gravityY))/M_PI*180.0;
     
     double xyTheta = atan2(gravityX,gravityY)/M_PI*180.0;
     
     //zTheta是手机与水平面的夹角， xyTheta是手机绕自身旋转的角度
     
     //3. DeviceMotion 获取陀螺仪的数据 包括角速度，空间位置等
     //旋转角速度：
     CMRotationRate rotationRate = motionManager.deviceMotion.rotationRate;
     double rotationX = rotationRate.x;
     double rotationY = rotationRate.y;
     double rotationZ = rotationRate.z;
     
     //空间位置的欧拉角（通过欧拉角可以算得手机两个时刻之间的夹角，比用角速度计算精确地多）
     double roll    = motionManager.deviceMotion.attitude.roll;
     double pitch   = motionManager.deviceMotion.attitude.pitch;
     double yaw     = motionManager.deviceMotion.attitude.yaw;
     
     //空间位置的四元数（与欧拉角类似，但解决了万向结死锁问题）
     double w = motionManager.deviceMotion.attitude.quaternion.w;
     double wx = motionManager.deviceMotion.attitude.quaternion.x;
     double wy = motionManager.deviceMotion.attitude.quaternion.y;
     double wz = motionManager.deviceMotion.attitude.quaternion.z;
     
     imageView.frame=CGRectMake(gravityX , gravityY, 40, 40);
     //通过陀螺仪模块可以实现模拟赛车，模拟射击等。
     [self.view addSubview:imageView];
     */
    

    NSLog(@"XX");
}
-(void)gameOver
{
    UIButton *faceBook=[UIButton buttonWithType:UIButtonTypeCustom];
    faceBook.frame=CGRectMake(Height/9-10, 100-40, 70, 70);
    [faceBook setImage:[UIImage imageNamed:@"FaceBook.png"] forState:UIControlStateNormal];
    faceBook.tag=201;
    [faceBook addTarget:self action:@selector(main_Buttons:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:faceBook];
    
    UIButton *Twitter=[UIButton buttonWithType:UIButtonTypeCustom];
    Twitter.frame=CGRectMake(Height/9-10, 220-40, 70, 70);
    [Twitter setImage:[UIImage imageNamed:@"Twitter.png"] forState:UIControlStateNormal];
    Twitter.tag=202;
    [Twitter addTarget:self action:@selector(main_Buttons:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:Twitter];
    
    UIButton *GameBegin=[UIButton buttonWithType:UIButtonTypeCustom];
    GameBegin.frame=CGRectMake(Height/2+fabs(Height/2-(Height/9-10))-70, 100-40, 70, 70);
    [GameBegin setImage:[UIImage imageNamed:@"white_button.png"] forState:UIControlStateNormal];
    GameBegin.tag=203;
    [GameBegin addTarget:self action:@selector(main_Buttons:) forControlEvents:UIControlEventTouchUpInside];
    UILabel *label_Next=[[UILabel alloc]initWithFrame:CGRectMake(4,0, 60, 70)];
    label_Next.backgroundColor=[UIColor clearColor];
    label_Next.textAlignment=NSTextAlignmentCenter;
    label_Next.textColor=Green;
    label_Next.font=[UIFont fontWithName:@"Arial" size:17];
    label_Next.text=@"next player";
    label_Next.lineBreakMode =  NSLineBreakByWordWrapping ;//设置换行
    label_Next.numberOfLines=2;//表示行数

    [GameBegin addSubview:label_Next];

    [self.view addSubview:GameBegin];
    
    UIButton *Rank_List=[UIButton buttonWithType:UIButtonTypeCustom];
    Rank_List.frame=CGRectMake(Height/2+fabs(Height/2-(Height/9-10))-70, 220-40, 70, 70);
    [Rank_List setImage:[UIImage imageNamed:@"Bubble.png"] forState:UIControlStateNormal];
    Rank_List.tag=204;
    [Rank_List addTarget:self action:@selector(main_Buttons:) forControlEvents:UIControlEventTouchUpInside];
    UILabel *label_Home=[[UILabel alloc]initWithFrame:CGRectMake(0,0, 70, 70)];
    label_Home.backgroundColor=[UIColor clearColor];
    label_Home.textAlignment=NSTextAlignmentCenter;
    label_Home.textColor=[UIColor whiteColor];
    label_Home.font=[UIFont fontWithName:@"Arial" size:18];
    label_Home.text=@"rank";
    [Rank_List addSubview:label_Home];

    [self.view addSubview:Rank_List];
}
#pragma mark -ScrollView Delegate
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    //label_scroll.text=[array objectAtIndex:scrollView.contentOffset.y/320];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)accelerometer:(UIAccelerometer *)accelerometer didAccelerate:(UIAcceleration *)acceleration {
    
    
    // Use a basic low-pass filter to only keep the gravity in the accelerometer values for the X and Y axes
    accelerationX2 = acceleration.x * kFilteringFactor + accelerationX2 * (1.0 - kFilteringFactor);
    accelerationY2 = acceleration.y * kFilteringFactor + accelerationY2 * (1.0 - kFilteringFactor);
    
    // keep the raw reading, to use during calibrations
    //currentRawReading = atan2(accelerationY, accelerationX);//反正切
    
    float calibratedAngle = atan2(accelerationY2, accelerationX2)*10;
    
    [self updateToInclinationInRadians:calibratedAngle];
    
    
}
- (void)updateToInclinationInRadians:(float)rads {
    float rotation =-(rads*180/M_PI);
  //  static int soundUpdateCounter = 0;
    
    if (YES){//(holdButtonIsShowing) {  // Don't update if user has toggled the Hold button to the Release state
        //[self updateReadoutForAngle:rotation];
        [self updateBubbleForAngle:rotation];
       // [self updateArrowsForAngle:rotation];
       // soundUpdateCounter++;
        
    }
}

- (void)updateBubbleForAngle:(float)angle {
    float halfVialLength = 320.0 / 2;
    float zoomAngle = angle * 4 ;  // real bubble floats up more rapidly than sine function
    
    if (zoomAngle > kMaxAngle) zoomAngle = kMaxAngle ;   // stop at the end
	if (zoomAngle < -kMaxAngle) zoomAngle = -kMaxAngle ; // stop at the other end
    
    float newY = imageView.center.y - sin(zoomAngle/180*M_PI) * halfVialLength;
    float newX = imageView.center.x - sin(zoomAngle/180*M_PI) * halfVialLength;
    
    imageView.center  =CGPointMake( newX, newY);
}

@end

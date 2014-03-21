//
//  Singleton.h
//  Fish
//
//  Created by DAWEI FAN on 04/01/2014.
//  Copyright (c) 2014 liqun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Singleton : NSObject
{
//    NSMutableArray *single_Data;
//    int isFirstOpen_View;
    int count_Play;
}

+ (Singleton *) sharedInstance;
//@property(nonatomic,retain)   NSMutableArray *single_Data;
@property(nonatomic)int count_Play;

@end

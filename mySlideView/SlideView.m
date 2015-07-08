//
//  SlideView.m
//  mySlideView
//
//  Created by cx on 15/7/6.
//  Copyright (c) 2015年 cx. All rights reserved.
//

#import "SlideView.h"


@implementation SlideView


- (instancetype)initSlideView
{
    self = [super initWithFrame:CGRectMake(-SLIDEWIDTH, 0, SLIDEWIDTH, [[UIScreen mainScreen] bounds].size.height)];
    self.backgroundColor = [UIColor blueColor];
    return self;
}

-(void)showView
{
    self.frame = CGRectMake(0, 0, SLIDEWIDTH, [[UIScreen mainScreen] bounds].size.height);
}

-(void)hideView
{
    self.frame = CGRectMake(-SLIDEWIDTH, 0, SLIDEWIDTH, [[UIScreen mainScreen] bounds].size.height);
}

- (void)showSlideView
{
    [UIView animateWithDuration:0.5 animations:^(void){
        [self showView];
    }];
}

- (void)hideSlideView
{
    [UIView animateWithDuration:0.5 animations:^(void){
        [self hideView];
    }];
}
     


@end

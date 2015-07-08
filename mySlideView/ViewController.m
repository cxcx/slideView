//
//  ViewController.m
//  mySlideView
//
//  Created by cx on 15/7/6.
//  Copyright (c) 2015年 cx. All rights reserved.
//

#import "ViewController.h"
#import "SlideView.h"
@interface ViewController ()

@property (nonatomic, strong)SlideView* sview;
- (void)showView;
- (void)addGuesture;
- (void)dealSwipeGuesture:(UISwipeGestureRecognizer*)gestureRecognizer;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initView];
}


/**
 *  初始化视图
 */
- (void)initView
{
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:0.1 green:0.3 blue:0.6 alpha:0.7];
    self.navigationController.navigationBar.translucent = YES;
    
    //测试按钮
    UIButton* buttonShow                = [[UIButton alloc] initWithFrame:CGRectMake(270, 200, 100, 40)];
    buttonShow.backgroundColor          = [UIColor blueColor];
    buttonShow.layer.cornerRadius       = 8.f;
    [buttonShow setTitle:@"show" forState:UIControlStateNormal];
    [buttonShow addTarget:self action:@selector(showView) forControlEvents:UIControlEventTouchDown];
    UIButton* buttonHide                = [[UIButton alloc] initWithFrame:CGRectMake(270, 280, 100, 40)];
    buttonHide.backgroundColor          = [UIColor redColor];
    buttonHide.layer.cornerRadius       = 8.f;
    [buttonHide setTitle:@"hide" forState:UIControlStateNormal];
    [buttonHide addTarget:self action:@selector(hideView) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:buttonShow];
    [self.view addSubview:buttonHide];
    
    _sview                              = [[SlideView alloc] initSlideView];
    _sview.alpha                        = 0.9;
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    [window addSubview:_sview];
    [self addGuesture];
}

/**
 *  添加手势识别
 */
- (void)addGuesture
{
    UISwipeGestureRecognizer* leftSwipeGesture  = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(dealSwipeGuesture:)];
    UISwipeGestureRecognizer* rightSwipeGesture = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(dealSwipeGuesture:)];
    leftSwipeGesture.direction                  = UISwipeGestureRecognizerDirectionLeft;
    rightSwipeGesture.direction                 = UISwipeGestureRecognizerDirectionRight;
    [self.view addGestureRecognizer:leftSwipeGesture];
    [self.view addGestureRecognizer:rightSwipeGesture];
}

/**
 *  处理左滑和右滑
 *
 *  @param gestureRecognizer 添加进self.view中的手势识别器
 */
- (void)dealSwipeGuesture:(UISwipeGestureRecognizer *)gestureRecognizer
{
    if (gestureRecognizer.direction == UISwipeGestureRecognizerDirectionRight)
    {
        [self showView];
    }
    else if (gestureRecognizer.direction == UISwipeGestureRecognizerDirectionLeft)
    {
        [self hideView];
    }
}

- (void)showView
{
    [_sview showSlideView];
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}

- (void)hideView
{
    [_sview hideSlideView];
    [self.navigationController setNavigationBarHidden:NO animated:YES];
    
}
@end

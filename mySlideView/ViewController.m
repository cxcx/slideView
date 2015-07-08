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
{

}
@property (nonatomic, strong) UIView* backView;
@property (nonatomic, strong)SlideView* sview;

- (void)showView;
- (void)addGuesture;
- (void)dealSwipeGuesture:(UISwipeGestureRecognizer*)gestureRecognizer;
- (void)setViewAfterLeftSwipe;
- (void)setViewAfterRightSwipe;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _backView = [[UIView alloc] initWithFrame:self.view.frame];
    [self initView];
}


/**
 *  初始化视图
 */
- (void)initView
{

    //设置状态栏与
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"stautsBarImage"]];
    self.navigationController.navigationBar.translucent = YES;
    
    //测试按钮
    [_backView setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"view"]]];
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
    [_backView addSubview:buttonShow];
    [_backView addSubview:buttonHide];
    [self.view addSubview:_backView];
    
    _sview           = [[SlideView alloc] initSlideView];
    _sview.alpha     = 0.9;
    UIWindow *window = [UIApplication sharedApplication].keyWindow;                     //获取主window,在导航条之上创建侧滑视图
    [window addSubview:_sview];
    [self addGuesture];                                                                 //添加视图手势
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
    [_backView addGestureRecognizer:leftSwipeGesture];
    [_backView addGestureRecognizer:rightSwipeGesture];
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
        [UIView animateWithDuration:0.5 animations:^(void){
             _backView.center = CGPointMake(_backView.center.x + SLIDEWIDTH, _backView.center.y);
        }];
    }
    else if (gestureRecognizer.direction == UISwipeGestureRecognizerDirectionLeft)
    {
        [self hideView];
        [UIView animateWithDuration:0.5 animations:^(void){
            _backView.center = CGPointMake(_backView.center.x - SLIDEWIDTH, _backView.center.y);
        }];
    }
}

- (void)showView
{
    [_sview showSlideView];
//    [self.navigationController setNavigationBarHidden:YES animated:YES];
}

- (void)hideView
{
    [_sview hideSlideView];
//    [self.navigationController setNavigationBarHidden:NO animated:YES];
    
}




//
//
//
///**
// *  右滑后主视图变化
// *
// *  @param tempSetView 通过block修改视图frame
// */
//- (void)setViewAfterRightSwipe
//{
//    void (^swipeView)(void) = ^(void){
//        _backView.center = CGPointMake(_backView.center.x + SLIDEWIDTH, _backView.center.y);
//    };
//    swipeView();
//}
//
///**
// *  左滑后主视图变化
// *
// *  @param tempSetView  通过block修改视图frame
// */
//- (void)setViewAfterLeftSwipe
//{
//    void (^swipeView)(void) = ^(void){
//        _backView.center = CGPointMake(_backView.center.x - SLIDEWIDTH, _backView.center.y);
//    };
//    swipeView();
//    
//}

@end

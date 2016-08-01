//
//  ViewController.m
//  SYFlipView
//
//  Created by mac1 on 16/7/28.
//  Copyright © 2016年 fuxi. All rights reserved.
//

#import "ViewController.h"

#define KScreenWidth [UIScreen mainScreen].bounds.size.width
#define KScreenHeight [UIScreen mainScreen].bounds.size.height

@interface ViewController () {
    
    UIView *view1;  //  视图1
    UIView *view2;  //视图2
    UINavigationBar *navBar;//导航栏
    UINavigationItem *navItem;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //创建导航栏
    navBar = [[UINavigationBar alloc] initWithFrame:CGRectMake(0, 20, KScreenWidth, 44)];
    //创建一个导航栏集合
    navItem = [[UINavigationItem alloc] initWithTitle:@""];
    
    //把导航栏集合添加到导航栏中，设置动画关闭
    [navBar pushNavigationItem:navItem animated:NO];
    
    //添加并显示
    [self.view addSubview:navBar];

   
    //创建视图1
    [self _createView1];
    
    //创建视图2
    [self _createView2];
    
    //创建导航控制器右边按钮
    [self _createNavigationRightItem];
    
    
}

#pragma mark - create UI
- (void) _createView1 {
    
    //初始化
    view1 = [[UIView alloc] initWithFrame:CGRectMake(0, 64, KScreenWidth, KScreenHeight)];
    //设置背景色
    view1.backgroundColor = [UIColor orangeColor];
    //是否隐藏：不
    view1.hidden = NO;
    //添加到当前页面显示
    [self.view addSubview:view1];
}

- (void) _createView2 {
    
    //初始化
    view2 = [[UIView alloc] initWithFrame:CGRectMake(0, 64, KScreenWidth, KScreenHeight)];
    //设置背景色
    view2.backgroundColor = [UIColor greenColor];
    //是否隐藏：不
    view2.hidden = YES;
    //添加到当前页面显示
    [self.view addSubview:view2];
}

-(void)_createNavigationRightItem{
    
    //父视图
    UIView *rightView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 50, 30)];
    navItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:rightView];
    rightView.tag = 1000;
  
    
    
    //2个子button
    UIButton *button1 = [UIButton buttonWithType:UIButtonTypeCustom];
    button1.frame = CGRectMake(1, 2, 48, 26);
    [button1 setImage:[UIImage imageNamed:@"list_home"] forState:UIControlStateNormal];
    [button1 setBackgroundImage:[UIImage imageNamed:@"exchange_bg_home"] forState:UIControlStateNormal];
    [button1 addTarget:self action:@selector(rightButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    button1.hidden = NO;
    button1.tag= 1001;
    [rightView addSubview:button1];
    
    
    UIButton *button2 = [UIButton buttonWithType:UIButtonTypeCustom];
    button2.frame = CGRectMake(1, 2, 48, 26);
    [button2 setImage:[UIImage imageNamed:@"poster_home"] forState:UIControlStateNormal];
    [button2 setBackgroundImage:[UIImage imageNamed:@"exchange_bg_home"] forState:UIControlStateNormal];
    [button2 addTarget:self action:@selector(rightButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    button2.hidden = YES;
    button2.tag = 1002;
    [rightView addSubview:button2];
    
}

#pragma mark - button 事件
-(void)rightButtonAction:(UIButton*)btn{
    
    NSLog(@"adf");
    UIButton *btn1 = [navBar viewWithTag:1001];
    UIButton *btn2 = [navBar viewWithTag:1002];
    UIView *view = [navBar viewWithTag:1000];
    
    
    UIViewAnimationOptions option;
    BOOL flip = btn1.hidden;
    if (flip) {
        option =UIViewAnimationOptionTransitionFlipFromLeft;
    }else{
        option =UIViewAnimationOptionTransitionFlipFromRight;
    }
    
    /*
     view:变换的视图
     duration:持续时间
     options:动画类型
     animations:block块  具体的动画
     completion:完成后
     
     */
    [UIView transitionWithView:view duration:0.35 options:option animations:^{
        btn1.hidden = !btn1.hidden;
        btn2.hidden = !btn2.hidden;
        
        
        
    } completion:NULL];
    
    
    [UIView transitionWithView:self.view duration:0.35 options:option animations:^{
        view1.hidden =!view1.hidden;
        view2.hidden =!view2.hidden;

} completion:NULL];
    
    
}

@end

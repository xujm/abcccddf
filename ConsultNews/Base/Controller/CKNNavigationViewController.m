//
//  CKNNavigationViewController.m
//  ConsultNews
//
//  Created by Lx on 16/3/1.
//  Copyright © 2016年 Lx. All rights reserved.
//

#import "CKNNavigationViewController.h"

@interface CKNNavigationViewController ()<UIGestureRecognizerDelegate>

@end

@implementation CKNNavigationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //导航栏Title样式
    [self.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor],
                                                 }];
    
    //导航栏背景色
    self.navigationBar.barTintColor = UIColorFromRGB(0xcc3333);
    
    if ([self respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        self.interactivePopGestureRecognizer.delegate = self;
    }
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if (self.viewControllers.count > 0) {
        
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn addTarget:self action:@selector(backVc) forControlEvents:UIControlEventTouchUpInside];
        [btn setBackgroundImage:[UIImage imageNamed:@"button_common_back"] forState:UIControlStateNormal];
        [btn sizeToFit];
        
        viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:btn];
    }
    
    [super pushViewController:viewController animated:animated];
}

- (void)backVc
{
    [self popViewControllerAnimated:YES];
}


#pragma mark - UIGestureRecognizerDelegate

- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer {
    return YES;
}

@end

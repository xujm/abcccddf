//
//  CKNNewsViewController.m
//  ConsultNews
//
//  Created by Lx on 16/3/1.
//  Copyright © 2016年 Lx. All rights reserved.
//

#import "CKNNewsViewController.h"
#import "CKNChildViewController.h"

@interface CKNNewsViewController ()

@end

@implementation CKNNewsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"FeedTitleImage"]];
    
    UIBarButtonItem *searchItem = ({
        UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"half_rectangle_button_search"] style:UIBarButtonItemStylePlain target:self action:@selector(search)];
        item.tintColor = [UIColor whiteColor];
        item;
    });
    self.navigationItem.rightBarButtonItem = searchItem;
    
    // 添加子控制器
    [self setUpAllViewController];
    
    [self setUpTitleGradient:^(BOOL *isShowTitleGradient, YZTitleColorGradientStyle *titleColorGradientStyle, CGFloat *startR, CGFloat *startG, CGFloat *startB, CGFloat *endR, CGFloat *endG, CGFloat *endB) {
        
        *isShowTitleGradient = YES;
        
        *titleColorGradientStyle = YZTitleColorGradientStyleRGB;
        
        *endR = 1;
        
    }];
    
    [self setUpTitleScale:^(BOOL *isShowTitleScale, CGFloat *titleScale) {
        
        // 是否需要字体缩放
        *isShowTitleScale = YES;
        
        // 字体缩放比例
        *titleScale = 1.2;
    }];
}

#pragma mark - 搜索

- (void)search
{
    
}

#pragma mark - 添加子控制器

- (void)setUpAllViewController
{
    CKNChildViewController *vc1 = [[CKNChildViewController alloc] init];
    vc1.title = @"中国";
    [self addChildViewController:vc1];
    
    CKNChildViewController *vc2 = [[CKNChildViewController alloc] init];
    vc2.title = @"国际";
    [self addChildViewController:vc2];
    
    CKNChildViewController *vc3 = [[CKNChildViewController alloc] init];
    vc3.title = @"军事";
    [self addChildViewController:vc3];
    
    CKNChildViewController *vc4 = [[CKNChildViewController alloc] init];
    vc4.title = @"财经";
    [self addChildViewController:vc4];
    
    CKNChildViewController *vc5 = [[CKNChildViewController alloc] init];
    vc5.title = @"博览";
    [self addChildViewController:vc5];
    
    CKNChildViewController *vc6 = [[CKNChildViewController alloc] init];
    vc6.title = @"科技";
    [self addChildViewController:vc6];
    
    CKNChildViewController *vc7 = [[CKNChildViewController alloc] init];
    vc7.title = @"旅游";
    [self addChildViewController:vc7];
    
    CKNChildViewController *vc8 = [[CKNChildViewController alloc] init];
    vc8.title = @"风尚";
    [self addChildViewController:vc8];
    
    CKNChildViewController *vc9 = [[CKNChildViewController alloc] init];
    vc9.title = @"汽车";
    [self addChildViewController:vc9];
    
    CKNChildViewController *vc10 = [[CKNChildViewController alloc] init];
    vc10.title = @"房产";
    [self addChildViewController:vc10];
}

@end

//
//  CKNTabBarViewController.m
//  ConsultNews
//
//  Created by Lx on 16/3/1.
//  Copyright © 2016年 Lx. All rights reserved.
//

#import "CKNTabBarViewController.h"
#import "CKNNavigationViewController.h"
#import "CKNNewsViewController.h"
#import "CKNVideoViewController.h"
#import "CKNTopicViewController.h"
#import "CKNMyViewController.h"

static NSString * const kNews = @"News";
static NSString * const kVideo = @"Video";
static NSString * const kTopic = @"Topic";
static NSString * const kMy = @"My";

@interface CKNTabBarViewController ()

@end

@implementation CKNTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 新闻
    CKNNewsViewController *nvc = [[UIStoryboard storyboardWithName:kNews bundle:nil] instantiateInitialViewController];
    
    // 视听
    CKNVideoViewController *vvc = [[UIStoryboard storyboardWithName:kVideo bundle:nil] instantiateInitialViewController];
    
    // 话题
    CKNTopicViewController *tvc = [[UIStoryboard storyboardWithName:kTopic bundle:nil] instantiateInitialViewController];
    
    // 我的
    CKNMyViewController *mvc = [[UIStoryboard storyboardWithName:kMy bundle:nil] instantiateInitialViewController];
    
    NSArray *viewControllers = @[nvc, vvc, tvc, mvc];
    NSArray *tabBarItemNames = @[@"新闻",@"视听",@"话题",@"我的"];
    NSArray *tabBarItemImages = @[@"tabbar_icon_news_normal",
                                  @"tabbar_icon_media_normal",
                                  @"tabbar_icon_reader_normal",
                                  @"tabbar_icon_me_normal"];
    NSArray *tabBarItemSelectedImages = @[@"tabbar_icon_news_highlight",
                                          @"tabbar_icon_media_highlight",
                                          @"tabbar_icon_reader_highlight",
                                          @"tabbar_icon_me_highlight"];
    
    NSMutableArray *navis = [[NSMutableArray alloc] init];
    for(int i=0; i<viewControllers.count; i++) {
        UIViewController *vc = [viewControllers objectAtIndex:i];
        UINavigationController *navi = [[CKNNavigationViewController alloc] initWithRootViewController:vc];
        NSString *title = [tabBarItemNames objectAtIndex:i];
        NSString *image = [tabBarItemImages objectAtIndex:i];
        NSString *selectedImage = [tabBarItemSelectedImages objectAtIndex:i];
        UITabBarItem *item;
        if(SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"7.0")) {
            UIImage *selected = [UIImage imageNamed:selectedImage];
            item = [[UITabBarItem alloc] initWithTitle:title image:[UIImage imageNamed:image] selectedImage:[selected imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
            self.tabBar.tintColor = UIColorFromRGB(0xcc3333);
        }
        else {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
            item = [[UITabBarItem alloc] initWithTitle:title image:[UIImage imageNamed:image] tag:i];
            [item setFinishedSelectedImage:[UIImage imageNamed:selectedImage] withFinishedUnselectedImage:[UIImage imageNamed:image]];
            [item setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                          [UIColor colorWithWhite:0.57 alpha:1.0f], UITextAttributeTextColor,
                                          nil] forState:UIControlStateNormal];
            [item setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                          UIColorFromRGB(0xcc3333), UITextAttributeTextColor,
                                          nil] forState:UIControlStateSelected];
            self.tabBar.backgroundImage = [CKNUtils imageWithColor:[UIColor colorWithWhite:0.98 alpha:1.0] size:self.tabBar.frame.size];
            self.tabBar.selectionIndicatorImage = [CKNUtils imageWithColor:[UIColor colorWithWhite:0.98 alpha:1.0] size:CGSizeMake(self.tabBar.frame.size.width/viewControllers.count, self.tabBar.frame.size.height)];
#pragma clang diagnostic pop
        }
        navi.tabBarItem = item;
        [navis addObject:navi];
    }
    self.viewControllers = navis;
}

@end

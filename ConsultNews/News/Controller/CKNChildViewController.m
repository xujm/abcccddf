//
//  CKNChildViewController.m
//  ConsultNews
//
//  Created by Lx on 16/3/1.
//  Copyright © 2016年 Lx. All rights reserved.
//

#import "CKNChildViewController.h"
#import "CKNNewsTableViewCell.h"
#import "SDCycleScrollView.h"
#import "CKNDetailViewController.h"

static NSString * const kNewsCell = @"CKNNewsTableViewCell";
static NSString * const kCycleCell = @"SDCycleScrollView";

@interface CKNChildViewController ()<UITableViewDataSource, UITableViewDelegate, SDCycleScrollViewDelegate>

@property (nonatomic, copy) NSArray *titleArr;
@property (nonatomic, copy) NSArray *descArr;

@end

@implementation CKNChildViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupData];
    
    self.tableView.rowHeight = 70;
    [self.tableView registerNib:[UINib nibWithNibName:@"CKNNewsTableViewCell" bundle:nil] forCellReuseIdentifier:kNewsCell];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    NSArray *imageNames = @[@"h1.jpg",
                            @"h2.jpg",
                            @"h3.jpg",
                            @"h4.jpg"
                            ];
    
    NSArray *titles = @[@"骑士4分险胜步行者",
                        @"中国首次公开承认正在发展第六代战机",
                        @"喵星人幸运值已达S级，毫发无伤~",
                        @"高圆圆这样去时装周 性感又帅气"
                        ];
    
    SDCycleScrollView *cycleScrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 64, kScreenWidth, 140) shouldInfiniteLoop:YES imageNamesGroup:imageNames];
    cycleScrollView.delegate = self;
    cycleScrollView.pageControlAliment = SDCycleScrollViewPageContolAlimentRight;
    cycleScrollView.currentPageDotColor = [UIColor whiteColor];
    cycleScrollView.titlesGroup = titles;
    
    self.tableView.tableHeaderView = cycleScrollView;
}

- (void)setupData
{
    self.titleArr = @[@"NASA邀印度合作 拟共同将宇航员送上火星",
                      @"俄媒:俄一架苏-25战机坠毁 一名飞行员遇难",
                      @"联合国人权事务专员:叙围困区千人恐已饿死",
                      @"代理人混战暂时熄火 叙利亚距和平还有多远",
                      @"外媒:加指控4人窃取卫星技术卖给中国企业",
                      @"英犯罪分子用快递走私武器警方忧巴黎式恐袭",
                      @"美要用人工智能对抗中国雷达 号称永远有效",
                      @"美国欲以军事科技优势迎挑战",
                      @"土木堡之变：谁救了明帝国？",
                      @"林彪之死外媒称身中9颗子弹",
                      @"美媒：俄军在叙作战为练手",
                      @"胡适为何会随蒋介石逃离大陆",
                      @"美军新技术：大脑控制无人机"];
    self.descArr = @[@"NASA最近邀几个可能的合作伙伴讨论未来的火星计划。",
                     @"该战机在飞行时并未携带弹药，但一飞行员不幸遇难。",
                     @"饱受战乱蹂躏的叙利亚境内有近50万人受围困影响。",
                     @"叙利亚将会走向何方？这个问题值得人们关注。",
                     @"被指控的是一名美国人、一名英国人和两名加拿大人。",
                     @"这或提高英境内发生巴黎袭击式的恐怖事件的风险。",
                     @"用人工智能来实时了解雷达动态，然后编写干扰文件。",
                     @"美上将称，美军运用新科技的速度赶不上中国等国家。",
                     @"于谦被任命为兵部尚书是土木堡之变的一个转折点。",
                     @"林彪出逃后，由于中国保密，外媒出现了各种猜测。",
                     @"俄是在为可能与北约军队在东欧地区发生冲突做准备。",
                     @"胡适对吴晗说：\"他们来了，没有面包也没有自由。\"",
                     @"看上去似乎不可能实现，但现在已向可能迈出了一步。"];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.titleArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CKNNewsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kNewsCell forIndexPath:indexPath];
    if (indexPath.row == 0) {
        cell.isFristCell = YES;
    }
    [cell createNewsCellWithImage:[NSString stringWithFormat:@"%ld",(long)indexPath.row + 1] title:self.titleArr[indexPath.row] desc:self.descArr[indexPath.row]];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    CKNDetailViewController *dvc = [[UIStoryboard storyboardWithName:@"News" bundle:nil] instantiateViewControllerWithIdentifier:@"CKNDetailViewController"];
    
    [dvc setHidesBottomBarWhenPushed:YES];
    
    [self.navigationController pushViewController:dvc animated:YES];
}

@end

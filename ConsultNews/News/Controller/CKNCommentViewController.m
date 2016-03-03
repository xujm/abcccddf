//
//  CKNCommentViewController.m
//  ConsultNews
//
//  Created by Lx on 16/3/3.
//  Copyright © 2016年 Lx. All rights reserved.
//

#import "CKNCommentViewController.h"
#import "CKNCommentTableViewCell.h"

static NSString * const kCKNCommentTableViewCell = @"CKNCommentTableViewCell";

@interface CKNCommentViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIView *commentView;

@end

@implementation CKNCommentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView registerNib:[UINib nibWithNibName:@"CKNCommentTableViewCell" bundle:nil] forCellReuseIdentifier:kCKNCommentTableViewCell];
    self.tableView.rowHeight = 60;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    //注册点击事件，点击背景，隐藏键盘
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapToClose)];
    [self.view addGestureRecognizer:tapGesture];
    
    //添加键盘弹出和收回的通知
    NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
    [nc addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    [nc addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
}

//收到键盘弹出通知后的响应
- (void)keyboardWillShow:(NSNotification *)info {
    //保存info
    NSDictionary *dict = info.userInfo;
    //得到键盘的显示完成后的frame
    CGRect keyboardBounds = [dict[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    //得到键盘弹出动画的时间
    double duration = [dict[UIKeyboardAnimationDurationUserInfoKey] doubleValue];
    //坐标系转换
    //由于取出的位置信息是绝对的，所以要将其转换为对应于当前view的位置，否则位置信息会出错！
    CGRect keyboardBoundsRect = [self.view convertRect:keyboardBounds toView:nil];
    //得到键盘的高度，即输入框需要移动的距离
    double offsetY = keyboardBoundsRect.size.height;
    //得到键盘动画的曲线信息，按原作的话说“此处是难点”，stackoverflow网站里找到的
    UIViewAnimationOptions options = [dict[UIKeyboardAnimationCurveUserInfoKey] integerValue] << 16;
    //添加动画
    [UIView animateWithDuration:duration delay:0 options:options animations:^{
        _commentView.transform = CGAffineTransformMakeTranslation(0, -offsetY);
    } completion:^(BOOL finished) {
//        self.sendBtn.enabled = YES;
    }];
    
}

//隐藏键盘通知的响应
- (void)keyboardWillHide:(NSNotification *)info {
    //输入框回去的时候就不需要高度了，直接取动画时间和曲线还原回去
    NSDictionary *dict = info.userInfo;
    double duration = [dict[UIKeyboardAnimationDurationUserInfoKey] doubleValue];
    UIViewAnimationOptions options = [dict[UIKeyboardAnimationCurveUserInfoKey] integerValue] << 16;
    //CGAffineTransformIdentity是置位，可将改变的transform还原
    [UIView animateWithDuration:duration delay:0 options:options animations:^{
        _commentView.transform = CGAffineTransformIdentity;
    } completion:^(BOOL finished) {
//        self.sendBtn.enabled = NO;
    }];
}

//点击背景的响应
- (void)tapToClose {
    //输入框失去焦点
    [self.view endEditing:YES];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 20;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CKNCommentTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kCKNCommentTableViewCell forIndexPath:indexPath];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}


@end

//
//  CKNDetailViewController.m
//  ConsultNews
//
//  Created by Lx on 16/3/2.
//  Copyright © 2016年 Lx. All rights reserved.
//

#import "CKNDetailViewController.h"
#import "CKNCommentViewController.h"

@interface CKNDetailViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageview1;
@property (weak, nonatomic) IBOutlet UIImageView *imageView2;
@property (weak, nonatomic) IBOutlet UIImageView *imageView3;

@property (weak, nonatomic) IBOutlet UIView *textView;
@property (weak, nonatomic) IBOutlet UIButton *sendBtn;

@property (weak, nonatomic) IBOutlet UIView *commentView;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *width;

@property (weak, nonatomic) IBOutlet UIView *cView;

@end

@implementation CKNDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.sendBtn.enabled = NO;
    
    self.imageview1.layer.cornerRadius = 15;
    self.imageview1.clipsToBounds = YES;
    
    self.imageView2.layer.cornerRadius = 15;
    self.imageView2.clipsToBounds = YES;
    
    self.imageView3.layer.cornerRadius = 15;
    self.imageView3.clipsToBounds = YES;
    
    //注册点击事件，点击背景，隐藏键盘
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapToClose)];
    [self.view addGestureRecognizer:tapGesture];
    
    //添加键盘弹出和收回的通知
    NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
    [nc addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    [nc addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn addTarget:self action:@selector(goComment) forControlEvents:UIControlEventTouchUpInside];
    [btn setBackgroundImage:[UIImage imageNamed:@"channel_open_icon"] forState:UIControlStateNormal];
    [btn setTitle:@" 584412跟帖 " forState:UIControlStateNormal];
    btn.titleLabel.font = [UIFont systemFontOfSize:12.f];
    
    [btn sizeToFit];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:btn];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(goComment)];
    self.commentView.userInteractionEnabled = YES;
    [self.commentView addGestureRecognizer:tap];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    self.navigationController.navigationBar.barTintColor = [UIColor whiteColor];
}


- (void)goComment
{
    CKNCommentViewController *cvc = [[UIStoryboard storyboardWithName:@"News" bundle:nil] instantiateViewControllerWithIdentifier:@"CKNCommentViewController"];
    [self.navigationController pushViewController:cvc animated:YES];
    
    
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
    _cView.hidden = NO;
    //添加动画
    [UIView animateWithDuration:duration delay:0 options:options animations:^{
        _cView.transform = CGAffineTransformMakeTranslation(0, -offsetY);
    } completion:^(BOOL finished) {
        //self.sendBtn.enabled = YES;
    }];
    
}

//隐藏键盘通知的响应
- (void)keyboardWillHide:(NSNotification *)info {
    //输入框回去的时候就不需要高度了，直接取动画时间和曲线还原回去
    NSDictionary *dict = info.userInfo;
    double duration = [dict[UIKeyboardAnimationDurationUserInfoKey] doubleValue];
    UIViewAnimationOptions options = [dict[UIKeyboardAnimationCurveUserInfoKey] integerValue] << 16;
    _cView.hidden = YES;
    //CGAffineTransformIdentity是置位，可将改变的transform还原
    [UIView animateWithDuration:duration delay:0 options:options animations:^{
        _cView.transform = CGAffineTransformIdentity;
    } completion:^(BOOL finished) {
        //self.sendBtn.enabled = NO;
    }];
}

//点击背景的响应
- (void)tapToClose {
    //输入框失去焦点
    [self.view endEditing:YES];
}


@end

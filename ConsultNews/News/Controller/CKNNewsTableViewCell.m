//
//  CKNNewsTableViewCell.m
//  ConsultNews
//
//  Created by Lx on 16/3/1.
//  Copyright © 2016年 Lx. All rights reserved.
//

#import "CKNNewsTableViewCell.h"

@implementation CKNNewsTableViewCell
{
    __weak IBOutlet UIImageView *newsImageView;
    __weak IBOutlet UILabel *titleLabel;
    __weak IBOutlet UILabel *descLabel;
    __weak IBOutlet UIButton *votecount;
    __weak IBOutlet UILabel *zhuanti;
}

- (void)createNewsCellWithImage:(NSString *)imageUrl title:(NSString *)title desc:(NSString *)desc
{
    newsImageView.image = [UIImage imageNamed:imageUrl];
    titleLabel.text = title;
    descLabel.text = desc;
    
    if (_isFristCell) {
        
        votecount.hidden = YES;
        zhuanti.hidden = NO;
        zhuanti.text = @"专题";
        zhuanti.font = [UIFont fontWithName:@"MarkerFelt-Thin" size:10.f];
        zhuanti.textColor = UIColorFromRGB(0xcc3333);
        zhuanti.layer.borderColor = UIColorFromRGB(0xcc3333).CGColor;
        zhuanti.layer.borderWidth = 0.7f;
        zhuanti.layer.cornerRadius = 5.f;
        
    } else {
        
        zhuanti.hidden = YES;
        votecount.hidden = NO;
        int count = arc4random() % 100;
        [votecount setTitle:[NSString stringWithFormat:@"  %d人跟帖  ",count] forState:UIControlStateNormal];
        
    }
}

@end
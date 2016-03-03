//
//  CKNCommentTableViewCell.m
//  ConsultNews
//
//  Created by Lx on 16/3/3.
//  Copyright © 2016年 Lx. All rights reserved.
//

#import "CKNCommentTableViewCell.h"

@implementation CKNCommentTableViewCell

- (void)awakeFromNib {
    self.imgView.layer.cornerRadius = 17.5;
    self.imgView.clipsToBounds = YES;
}

- (IBAction)click:(UIButton *)sender {
    
}


@end

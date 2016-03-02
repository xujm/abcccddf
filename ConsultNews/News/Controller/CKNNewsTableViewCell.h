//
//  CKNNewsTableViewCell.h
//  ConsultNews
//
//  Created by Lx on 16/3/1.
//  Copyright © 2016年 Lx. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CKNNewsTableViewCell : UITableViewCell

@property (nonatomic, assign) BOOL isFristCell;

- (void)createNewsCellWithImage:(NSString *)imageUrl title:(NSString *)title desc:(NSString *)desc;

@end

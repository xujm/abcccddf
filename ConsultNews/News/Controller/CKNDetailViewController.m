//
//  CKNDetailViewController.m
//  ConsultNews
//
//  Created by Lx on 16/3/2.
//  Copyright © 2016年 Lx. All rights reserved.
//

#import "CKNDetailViewController.h"

@interface CKNDetailViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageview1;
@property (weak, nonatomic) IBOutlet UIImageView *imageView2;
@property (weak, nonatomic) IBOutlet UIImageView *imageView3;

@end

@implementation CKNDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.imageview1.layer.cornerRadius = 15;
    self.imageview1.clipsToBounds = YES;
    
    self.imageView2.layer.cornerRadius = 15;
    self.imageView2.clipsToBounds = YES;
    
    self.imageView3.layer.cornerRadius = 15;
    self.imageView3.clipsToBounds = YES;
}

- (IBAction)moreInfo:(id)sender {
    NSLog(@"123");
}


@end

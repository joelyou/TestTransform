//
//  ViewController.m
//  TestOUBI
//
//  Created by 陈微 on 2019/11/13.
//  Copyright © 2019 陈微. All rights reserved.
//

#import "ViewController.h"
#import "CustomProgress.h"
#import "GiftListView.h"
#import <Masonry/Masonry.h>
#import "AppDelegate.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    CustomProgress *progress = [CustomProgress creatCustomProgressView];
    [self.view addSubview:progress];
    progress.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.5];
    progress.frame = CGRectMake(50, 100, 50, 400);
    progress.layer.cornerRadius = 25;
//    progress.clipsToBounds = YES;
    
    [progress setProgress:0.3];
    
//    UIButton *closeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
//    [closeBtn setBackgroundColor:[UIColor blueColor]];
//    [self.view addSubview:closeBtn];
//    [closeBtn addTarget:self action:@selector(changeDeviceOretion) forControlEvents:UIControlEventTouchUpInside];
//    [closeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.mas_equalTo(50);
//        make.top.mas_equalTo(50);
//        make.height.width.mas_equalTo(40);
//    }];
//
//    GiftListView *giftView = [GiftListView creatGiftListView];
//    [self.view addSubview:giftView];
//    [giftView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.right.bottom.mas_equalTo(0);
//        make.height.mas_equalTo(200);
//    }];
}

- (void)changeDeviceOretion{
    AppDelegate * appDelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    appDelegate.isForceLandscape = !appDelegate.isForceLandscape;
}

@end

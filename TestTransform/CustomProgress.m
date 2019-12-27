//
//  CustomProgress.m
//  TestOUBI
//
//  Created by 陈微 on 2019/11/13.
//  Copyright © 2019 陈微. All rights reserved.
//

#import "CustomProgress.h"

@interface CustomProgress ()

@property (nonatomic, weak) IBOutlet UIProgressView *progressView;
@property (nonatomic, weak) IBOutlet UIImageView *bottomImage;
@property (nonatomic, weak) IBOutlet NSLayoutConstraint *progressViewWidth;
@property (nonatomic, weak) IBOutlet NSLayoutConstraint *progressViewY;

@end

@implementation CustomProgress

+ (instancetype)creatCustomProgressView{
    CustomProgress *tmpProgress = [[[NSBundle mainBundle] loadNibNamed:@"CustomProgress" owner:nil options:nil] lastObject];
    [tmpProgress transformProgressView];
    return tmpProgress;
}

- (void)transformProgressView{
    _progressView.transform = CGAffineTransformMakeRotation(-M_PI_2);
    self.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.5];
    self.clipsToBounds = YES;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    self.layer.cornerRadius = CGRectGetWidth(self.frame)/2.0;
    CGFloat top = 20;   //进度条距离顶上的距离
    CGFloat yDistance = 10;   //进度条和下面图片的间距
    CGFloat progressWidth = CGRectGetMinY(_bottomImage.frame) - top - yDistance;
    _progressViewWidth.constant = progressWidth;
    //翻转之后宽和高对调了
    _progressViewY.constant = top + progressWidth/2.0 - CGRectGetWidth(_progressView.frame)/2.0;
}

- (void)setProgress:(CGFloat)progress{
    _progressView.progress = progress;
}

@end

//
//  DownloadPicView.m
//  自动模糊控件
//
//  Created by fairy on 16/1/7.
//  Copyright © 2016年 fairy. All rights reserved.
//

#import "DownloadPicView.h"
#import "GCD.h"
#import "UIImage+ImageEffects.h"

@interface DownloadPicView()

@property (nonatomic, strong) UIImageView *imageView;

@end

@implementation DownloadPicView

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //初始化控件
        self.imageView = [[UIImageView alloc]initWithFrame:self.bounds];
        self.imageView.alpha = 0;
        [self addSubview:self.imageView];
    }
    return self;
}

-(void)startProgress
{
    if (self.pictureUrlString) {
       
        //self.imageView.image = blurImage;
        
        [GCDQueue executeInGlobalQueue:^{
            //创建请求
            NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:self.pictureUrlString]];
            //因为是同步请求，会阻塞主线程
            NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
            UIImage *image =[[UIImage alloc]initWithData:data];
            UIImage *blurImage = [image blurImage];
           [ GCDQueue executeInMainQueue:^{
               self.imageView.image = blurImage;
               
               [UIView animateWithDuration:1.f animations:^{
                   self.imageView.alpha = 1.f;
               }];
           }];
        
    }];
    }
}

@synthesize contentMode = _contentMode;
-(void)setContentMode:(UIViewContentMode )contentMode
{
    _contentMode = contentMode;
    self.imageView.contentMode = contentMode;
}

-(UIViewContentMode)contentMode
{
    return _contentMode;
}
@end

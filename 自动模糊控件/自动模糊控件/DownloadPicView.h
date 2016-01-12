//
//  DownloadPicView.h
//  自动模糊控件
//
//  Created by fairy on 16/1/7.
//  Copyright © 2016年 fairy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DownloadPicView : UIView
@property (nonatomic,strong) NSString *pictureUrlString;
@property (nonatomic) UIViewContentMode contentMode;
//开始执行
-(void)startProgress;
@end

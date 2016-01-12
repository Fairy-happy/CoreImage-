//
//  ViewController.m
//  模糊3
//
//  Created by fairy on 16/1/7.
//  Copyright © 2016年 fairy. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property(nonatomic, strong) UIScrollView *scrollView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.scrollView = [[UIScrollView alloc]initWithFrame:self.view.bounds];
    UIImageView *imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"2"]];
    self.scrollView.bounces = NO;
    self.scrollView.contentSize = imageView.image.size;
    [self.scrollView addSubview:imageView];
    [self.view addSubview:self.scrollView];
    
    
    //添加模糊效果
    //创建模糊view
    UIVisualEffectView *effectView = [[UIVisualEffectView alloc]initWithEffect:[UIBlurEffect effectWithStyle:UIBlurEffectStyleLight]];
    //设定尺寸
    effectView.frame = CGRectMake(0, 100, self.view.frame.size.width, 200);
    [self.view addSubview:effectView];
    //添加显示文本
    UILabel *label = [[UILabel alloc]initWithFrame:effectView.bounds];
    label.text = @"fairy";
    label.textColor = [UIColor blackColor];
    label.font = [UIFont systemFontOfSize:50];
    label.textAlignment = NSTextAlignmentCenter;
    //[effectView.contentView addSubview:label];
    
    //添加模糊子view的UIVisualEffectView
    //创建子模糊view
    UIVisualEffectView *subEffectView = [[UIVisualEffectView alloc]initWithEffect:[UIVibrancyEffect effectForBlurEffect:(UIBlurEffect *)effectView.effect]];
    subEffectView.frame =effectView.bounds;
    [effectView.contentView addSubview:subEffectView];
    
    [subEffectView.contentView addSubview:label];
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

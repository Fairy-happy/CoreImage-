//
//  ViewController.m
//  图片模糊2
//
//  Created by fairy on 16/1/6.
//  Copyright © 2016年 fairy. All rights reserved.
//

#import "ViewController.h"
#import "UIImage+ImageEffects/UIImage+ImageEffects.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //原图
    UIImage *sourceImage = [UIImage imageNamed:@"2"];
    
    
    UIImage *blurImage = [sourceImage blurImageAtFrame:CGRectMake(0, 100, sourceImage.size.width, sourceImage.size.height/2.0f)];
    
    //加载图片
    UIImageView *imageView = [[UIImageView alloc]initWithImage:blurImage];
    imageView.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    
    [self.view addSubview:imageView];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

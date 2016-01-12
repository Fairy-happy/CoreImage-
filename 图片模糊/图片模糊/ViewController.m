//
//  ViewController.m
//  图片模糊
//
//  Created by fairy on 16/1/6.
//  Copyright © 2016年 fairy. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UIImage *img = [UIImage imageNamed:@"1"];
    
    //coreImage 部分
    CIImage *ciImage = [[CIImage alloc]initWithImage:img];
    
    //CIFilter
    CIFilter *blurFilter = [CIFilter filterWithName:@"CIGaussianBlur"];
    //将图片输入到滤镜中
    [blurFilter setValue:ciImage forKey:kCIInputImageKey];
    //设置模糊程度
    [blurFilter setValue:@(7) forKey:@"inputRadius"];
    //将处理好的图片输出
    CIImage *outImage = [blurFilter valueForKey:kCIOutputImageKey];
    //CIContext
    CIContext *context = [CIContext contextWithOptions:nil];
    //实现CGImage句柄
    CGImageRef outCGImage = [context createCGImage:outImage fromRect:[outImage extent]];
    //最终获取图片
    UIImage *blurImage = [UIImage imageWithCGImage:outCGImage];
    
    //释放CGImage句柄 不支持ARC
    CGImageRelease(outCGImage);
    
    NSLog(@"%@",[blurFilter attributes]);
    
    UIImageView *image = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    
    image.image = blurImage;
    [self.view addSubview:image];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

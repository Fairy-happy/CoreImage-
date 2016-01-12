//
//  ViewController.m
//  滤镜
//
//  Created by fairy on 16/1/8.
//  Copyright © 2016年 fairy. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CIImage *ciImage = [[CIImage alloc]initWithImage:[UIImage imageNamed:@"1"]];
    
    
    //创建Filter 滤镜
    //马赛克滤镜
    CIFilter *filer = [CIFilter filterWithName:@"CIPixellate"];
    [filer setValue:ciImage forKey:kCIInputImageKey];
    [filer setDefaults];
    CIImage *outImage = [filer valueForKey:kCIOutputImageKey];
    
    //组合滤镜
    CIFilter *filterTwo = [CIFilter filterWithName:@"CIHueAdjust"];
    [filterTwo setValue:outImage forKey:kCIInputImageKey];
    [filterTwo setDefaults];
    
    NSLog(@"%@",filterTwo.attributes);
    [filterTwo setValue:@(1.0f) forKey:kCIInputAngleKey];
    CIImage *outputImage = [filterTwo valueForKey:kCIOutputImageKey];
    
    //用CIContext 将滤镜中的图片渲染出来
    CIContext *context = [CIContext contextWithOptions:nil];
    CGImageRef cgImage = [context createCGImage:outputImage fromRect:[outImage extent]];
    UIImage *showImage = [UIImage imageWithCGImage:cgImage];
    CGImageRelease(cgImage);
    UIImageView *imageView = [[UIImageView alloc]initWithImage:showImage];
    imageView.frame = self.view.frame;
    [self.view addSubview:imageView];
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

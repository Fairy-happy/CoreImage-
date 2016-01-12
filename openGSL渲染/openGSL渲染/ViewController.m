//
//  ViewController.m
//  openGSL渲染
//
//  Created by fairy on 16/1/8.
//  Copyright © 2016年 fairy. All rights reserved.
//

#import "ViewController.h"
#import <GLKit/GLKit.h>

@interface ViewController ()
@property (nonatomic, strong) GLKView *glkView;
@property (nonatomic, strong) CIFilter *filter;
@property (nonatomic, strong) CIImage *ciImage;
@property (nonatomic, strong) CIContext *ciContext;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIImage *showImage = [UIImage imageNamed:@"2"];
    CGRect rect = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    //获取OprnGLES渲染的上下文
    EAGLContext *eagContext = [[EAGLContext alloc]initWithAPI:kEAGLRenderingAPIOpenGLES2];
    //创建出渲染的buffer
    _glkView = [[GLKView alloc]initWithFrame:rect context:eagContext];
    [_glkView bindDrawable];
    [self.view addSubview:_glkView];
    //创建出渲染CoreImage 用的context
    _ciContext = [CIContext contextWithEAGLContext:eagContext options:@{kCIContextWorkingColorSpace:[NSNull null]}];
    
    
    
    //CoreImage 相关操作
    _ciImage = [[CIImage alloc]initWithImage:showImage];
    _filter = [CIFilter filterWithName:@"CISepiaTone"];
    [_filter setValue:_ciImage forKey:kCIInputImageKey];
    [_filter setValue:@(0) forKey:kCIInputIntensityKey];
    
    //开始渲染
    [_ciContext drawImage:[_filter outputImage] inRect:CGRectMake(0, 0, _glkView.drawableWidth, _glkView.drawableHeight) fromRect:[_ciImage extent]];
    [_glkView display];
    
    //动态渲染
    UISlider *slider = [[UISlider alloc]initWithFrame:CGRectMake(0, self.view.frame.size.height-100, self.view.frame.size.width, 20)];
    slider.minimumValue = 0.f;
    slider.maximumValue = 1.0f;
    [slider addTarget:self action:@selector(sliderEvent:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:slider];
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)sliderEvent:(UISlider *)slider
{
    [_filter setValue:_ciImage forKey:kCIInputImageKey];
    [_filter setValue:@(slider.value) forKey:kCIInputIntensityKey];
    
    //开始渲染
    [_ciContext drawImage:[_filter outputImage] inRect:CGRectMake(0, 0, _glkView.drawableWidth, _glkView.drawableHeight) fromRect:[_ciImage extent]];
    [_glkView display];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

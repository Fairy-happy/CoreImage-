//
//  ViewController.m
//  自动模糊控件
//
//  Created by fairy on 16/1/7.
//  Copyright © 2016年 fairy. All rights reserved.
//

#import "ViewController.h"
#import "DownloadPicView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   NSString *picUrl = @"http://image.baidu.com/search/detail?ct=503316480&z=0&ipn=d&word=壁纸&pn=168&spn=0&di=44378419140&pi=&rn=1&tn=baiduimagedetail&istype=&ie=utf-8&oe=utf-8&in=3354&cl=2&lm=-1&st=&cs=2803931193%2C7955675&os=3948977398%2C971378210&simid=4118292100%2C773993257&adpicid=0&ln=1000&fmq=1378374347070_R&ic=0&s=0&se=&sme=&tab=&face=&ist=&jit=&statnum=wallpaper&cg=&bdtype=0&objurl=http%3A%2F%2Fbizhi.zhuoku.com%2F2009%2F11%2F22%2Fjingxuan%2Fjingxuan038.jpg&fromurl=ippr_z2C%24qAzdH3FAzdH3Fooo_z%26e3Bzi75h7_z%26e3Bv54AzdH3Fzi754twgktzitAzdH3F3tg2x7wg-3tg2x7wgpw5p7AzdH3Fdaal88dd89n9c8%25dbn0%25dl_z%26e3Bip4&gsm=50000b4";
    
    DownloadPicView *downView = [[DownloadPicView alloc]initWithFrame:self.view.bounds];
    downView.center = self.view.center;
    [self.view addSubview:downView];
    downView.pictureUrlString = picUrl;
    downView.contentMode = UIViewContentModeScaleAspectFill;
    [downView startProgress];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

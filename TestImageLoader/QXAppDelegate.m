//
//  QXAppDelegate.m
//  TestImageLoader
//
//  Created by Qixin on 14-7-11.
//  Copyright (c) 2014年 亓鑫. All rights reserved.
//

#import "QXAppDelegate.h"
#import "ImageLoader.h"

@interface QXAppDelegate ()
@property (strong, nonatomic) UIImageView *imageView;
@end
@implementation QXAppDelegate

- (void)loadImage:(UIButton*)sender
{
    /*
     //Test Url
     NSString *testUrl = @"http://image.zcool.com.cn/img2/27/20/m_1317198401426.jpg";
     //request image
     [ImageLoader getImageWithURL:testUrl
     placeholder:[UIImage imageNamed:@"placeholder.jpg"]
     block:^(UIImage *img) {
     self.imageView.image = img;
     }];
     */
    
    
    //Test Url
    NSString *testUrl = @"http://image.zcool.com.cn/img2/27/20/m_1317198401426.jpg";
    //NSString *testErrorUrl = @"http://image.zcool.com.cn/img2/27/20/m_1317198401426fuck.jpg";

    //request image
    self.imageView.image = [UIImage imageNamed:@"placeholder.jpg"];
    [ImageLoader getImageWithURL:testUrl
                      loadFinish:^(UIImage *img) {
                          self.imageView.image = img;
                      }loadFailure:^{
                          //error handle
                      }];
}

- (void)clearCacheImage:(UIButton*)sender
{
    self.imageView.image = nil;
    [ImageLoader deleteCacheImage];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    //Load image button
    UIButton *loadButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [loadButton setBackgroundColor:[UIColor blueColor]];
    [loadButton setFrame:CGRectMake(10, 350, 100, 30)];
    [loadButton setTitle:@"LoadImage" forState:UIControlStateNormal];
    [loadButton addTarget:self action:@selector(loadImage:) forControlEvents:UIControlEventTouchUpInside];
    [self.window addSubview:loadButton];
    
    //clear caches button
    UIButton *clearButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [clearButton setBackgroundColor:[UIColor redColor]];
    [clearButton setFrame:CGRectMake(210, 350, 100, 30)];
    [clearButton setTitle:@"ClearImage" forState:UIControlStateNormal];
    [clearButton addTarget:self action:@selector(clearCacheImage:) forControlEvents:UIControlEventTouchUpInside];
    [self.window addSubview:clearButton];
    
    //show imageview
    self.imageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 50, 300, 300)];
    self.imageView.backgroundColor = [UIColor lightGrayColor];
    [self.window addSubview:self.imageView];
    
    
    return YES;
}


@end

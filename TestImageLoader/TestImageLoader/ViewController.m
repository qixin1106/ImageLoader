//
//  ViewController.m
//  TestImageLoader
//
//  Created by 亓鑫 on 13-6-6.
//  Copyright (c) 2013年 亓鑫. All rights reserved.
//

#import "ViewController.h"
#import "ImageLoader.h"

@interface ViewController ()
@property (strong, nonatomic) IBOutlet UIImageView *showImgView;
@property (strong, nonatomic) NSMutableArray *imgURLs;

@end

@implementation ViewController


#pragma mark - 异步加载图片测试
- (IBAction)downLoadImg:(UIButton *)sender
{
    for (int i = 0; i < [_imgURLs count]; i++)
    {
        [ImageLoader getImageWithURL:[_imgURLs objectAtIndex:i]
                         placeholder:[UIImage imageNamed:@"placeholder.jpeg"]
                               block:^(UIImage *img) {
            self.showImgView.image = img;
        }];
    }
}



#pragma mark - 删除所有缓存
- (IBAction)delallCache:(UIButton *)sender
{
    [[NSFileManager defaultManager] removeItemAtPath:ImgCachePath error:nil];
    self.showImgView.image = nil;
}

#pragma mark - 添加测试图片
- (void)addTestImages
{
    //TODO:添加测试图片
    _imgURLs = [[NSMutableArray alloc] init];

    NSString *imgUrl = @"http://img00.hc360.com/gift/201203/201203050933218579.jpg";
    NSString *imgUrl2 = @"http://pic1a.nipic.com/2009-01-06/2009168265573_2.jpg";
    NSString *imgUrl3 = @"http://i7.hexunimg.cn/2012-03-31/139951019.jpg";
    NSString *imgUrl4 = @"http://www.qqread.com/ArtImage/20080307/ep136_1.jpg";
    NSString *imgUrl5 = @"http://i5.hexunimg.cn/2011-10-13/134158908.jpg";
    NSString *imgUrl6 = @"http://image.intwap.com/news/news/201103/7eacd88e321de67613541c691d2df55b.jpg";
    NSString *imgUrl7 = @"http://pic3.duowan.com/zt2/1108/176922015087/176922212018.jpg";

    [_imgURLs addObject:imgUrl];
    [_imgURLs addObject:imgUrl2];
    [_imgURLs addObject:imgUrl3];
    [_imgURLs addObject:imgUrl4];
    [_imgURLs addObject:imgUrl5];
    [_imgURLs addObject:imgUrl6];
    [_imgURLs addObject:imgUrl7];
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    [self addTestImages];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}










- (void)imageLoaderFinishWithImg:(UIImage*)img
{
    self.showImgView.image = img;
}

@end

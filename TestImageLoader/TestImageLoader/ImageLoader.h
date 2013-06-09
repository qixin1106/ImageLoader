//
//  ImageLoader.h
//
//  Created by 亓鑫 on 13-6-6.
//  Copyright (c) 2013年 亓鑫. All rights reserved.
//

#import <Foundation/Foundation.h>


/*
 *该方法会自动建立文件夹../Library/QXImgCache/
 
 *如需要可以修改"ImgCachePath"路径
 
 *只支持ARC项目,如非ARC项目需要添加 -fobjc-arc 参数
 
 [ImageLoader getImageWithURL:[_imgURLs objectAtIndex:i]
                  placeholder:[UIImage imageNamed:@"test.png"]
                        block:^(UIImage *img) {
                           myImgView.image = img;
                        }];
 */

#define ImgCachePath [[NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES)lastObject] stringByAppendingPathComponent:@"QXImgCache"]

typedef void (^ImgCallBack)(UIImage *img);
@interface ImageLoader : NSObject
+ (void)getImageWithURL:(NSString*)url placeholder:(UIImage*)placeholder block:(ImgCallBack)blk;
@end





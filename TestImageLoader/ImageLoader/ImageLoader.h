//
//  ImageLoader.h
//
//  Created by 亓鑫 on 13-6-6.
//  Copyright (c) 2013年 亓鑫. All rights reserved.
//

/*
 *该方法会自动建立文件夹../Temp/ILImgCache/
 *如需要可以修改"ILCachePath"路径
 *只支持ARC项目,如非ARC项目需要添加 -fobjc-arc 参数

 [ImageLoader getImageWithURL:yourUrlString
                  placeholder:[UIImage imageNamed:@"test.png"]
                        block:^(UIImage *img) {
                            myImgView.image = img;
                        }];
 */




#import <Foundation/Foundation.h>
// 缓存路径
#define ILCachePath [NSTemporaryDirectory() stringByAppendingPathComponent:@"ILImgCache"]
// 图片下载超时
#define ILTimeOut 8

typedef void (^ImgCallBack)(UIImage *img);
@interface ImageLoader : NSObject

/*!
 *  异步加载图片
 *
 *  @param url         图片URL,该方法会进行一次utf-8编码
 *  @param placeholder 占位图,该图片会在请请求时block返回
 *  @param blk         callback回传一个image对象
 *
 *  @since 2014-07-11
 */
+ (void)getImageWithURL:(NSString*)url
            placeholder:(UIImage*)placeholder
                  block:(ImgCallBack)blk;



/*!
 *  删除所有缓存图片
 *
 *  @return 是否删除成功
 *
 *  @since 2014-07-11
 */
+ (BOOL)deleteCacheImage;






@end





//
//  ImageLoader.m
//  Test信号量
//
//  Created by 亓鑫 on 13-6-6.
//  Copyright (c) 2013年 亓鑫. All rights reserved.
//






#import "ImageLoader.h"
#import <commoncrypto/CommonDigest.h>


@interface ImageLoader ()
@end

@implementation ImageLoader






#pragma mark - MD5
+(NSString *)md5:(NSString *)str
{
    const char *cStr = [str UTF8String];
    unsigned char result[32];
    CC_MD5( cStr, strlen(cStr), result );
    return [NSString stringWithFormat:
            @"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",
            result[0], result[1], result[2], result[3],
            result[4], result[5], result[6], result[7],
            result[8], result[9], result[10], result[11],
            result[12], result[13], result[14], result[15]
            ];
}








#pragma mark - 异步加载图片
+ (void)getImageWithURL:(NSString*)url placeholder:(UIImage*)placeholder block:(ImgCallBack)blk;
{
    if (![[NSFileManager defaultManager] fileExistsAtPath:ImgCachePath])
    {
        [[NSFileManager defaultManager] createDirectoryAtPath:ImgCachePath withIntermediateDirectories:YES attributes:nil error:nil];
    }

    NSString *fileName = [ImageLoader md5:url];
    NSString *path = [ImgCachePath stringByAppendingPathComponent:fileName];
    if ([[NSFileManager defaultManager] fileExistsAtPath:path])
    {
        if (blk) {
            printf("\nload Image %s\n",[fileName UTF8String]);
            blk([UIImage imageWithContentsOfFile:path]);
        }
    }
    else
    {
        if (blk) {
            printf("\nload placeholder %s\n",[fileName UTF8String]);
            blk(placeholder);
        }
        dispatch_async(dispatch_get_global_queue(0, 0), ^{
            @autoreleasepool
            {
                dispatch_async(dispatch_get_main_queue(), ^{
                    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
                });
                NSData *imgData = [NSData dataWithContentsOfURL:[NSURL URLWithString:url]];
                if (imgData)
                {
                    dispatch_async(dispatch_get_main_queue(), ^{
                        if ([imgData writeToFile:path atomically:YES]) {
                            if (blk) {
                                printf("\nsave Image %s\n",[fileName UTF8String]);
                                blk([UIImage imageWithData:imgData]);
                            }
                            [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
                        }
                    });
                }
            }
        });
    }
}

@end



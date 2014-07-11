更新 1.1
============
1.增加请求数据是否是一个图片判断.

2.过滤域名不做为hash标记,解决可能同一图片由多ip返回重复缓存问题



备注
============
 *该方法会自动建立文件夹../Temp/ILImgCache/

 *如需要可以修改"ILCachePath"路径

 *只支持ARC项目,如非ARC项目需要添加 -fobjc-arc 参数
 
 
 
 示例
===========
@ getImageWithURL:你的url字符串

@ placeholder:你的临时图片

@ block:回调,传入参数img为异步取回的图片


```iOS
[ImageLoader getImageWithURL:[_imgURLs objectAtIndex:i]

                 placeholder:[UIImage imageNamed:@"test.png"]

                       block:^(UIImage *img) {

                          myImgView.image = img;

                       }];
```
 

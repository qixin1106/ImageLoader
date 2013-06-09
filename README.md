

备注
============
 *该方法会自动建立文件夹../Library/QXImgCache/
 
 *如需要可以修改"ImgCachePath"路径
 
 *只支持ARC项目,如非ARC项目需要添加 -fobjc-arc 参数
 
 
 
 事例
===========

@ getImageWithURL:你的url字符串

@ placeholder:你的临时图片

@ block:回调,传入参数img为异步取回的图片

 [ImageLoader getImageWithURL:[_imgURLs objectAtIndex:i]
                  placeholder:[UIImage imageNamed:@"test.png"]
                        block:^(UIImage *img) {
                           myImgView.image = img;
                        }];
 

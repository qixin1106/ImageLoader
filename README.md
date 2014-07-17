简介
============
实现一个精简的异步加载图片工具,绝对小巧..^_^

更新 1.3
============
1.增加方法清除过期缓存图片,需要在程序退出时候调用方法


更新 1.2
============
1.增加判断url是否是NSString类型否则会Crash.

2.增加新异步加载方法,可通过block回调成功和失败.


更新 1.1
============
1.增加请求数据是否是一个图片判断.

2.过滤域名不做为hash标记,解决可能同一图片由多ip返回重复缓存问题


备注
============
 *该方法会自动建立文件夹../Temp/ILImgCache/

 *如需要可以修改"ILCachePath"路径

 *只支持ARC项目,如非ARC项目需要添加 -fobjc-arc 参数
 


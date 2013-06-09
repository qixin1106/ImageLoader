//
//  AppDelegate.m
//  TestImageLoader
//
//  Created by 亓鑫 on 13-6-6.
//  Copyright (c) 2013年 亓鑫. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
@implementation AppDelegate
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.viewController = [[ViewController alloc] initWithNibName:@"ViewController" bundle:nil];
    self.window.rootViewController = self.viewController;
    [self.window makeKeyAndVisible];
    return YES;
}
@end

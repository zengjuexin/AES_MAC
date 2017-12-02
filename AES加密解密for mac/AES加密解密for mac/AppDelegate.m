//
//  AppDelegate.m
//  AES加密解密for mac
//
//  Created by 曾觉新 on 2017/8/5.
//  Copyright © 2017年 曾觉新. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()


@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    
    NSApplication *application = aNotification.object;
    self.window = application.windows[0];
    //点击×让程序直接退出
//    [NSApp setDelegate:self];
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(closeWindow)name:NSWindowWillCloseNotification object:nil];
}
//点击dock栏会执行
-(BOOL)applicationShouldHandleReopen:(NSApplication *)theApplication hasVisibleWindows:(BOOL)flag
{
    NSLog(@"windows = %@", theApplication.windows);
    
    if (!flag){
        //主窗口显示
        [NSApp activateIgnoringOtherApps:NO];
        [self.window makeKeyAndOrderFront:self];
    }
    return YES;
}



- (void)closeWindow

{
    [NSApp terminate:self];
}


- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}




@end

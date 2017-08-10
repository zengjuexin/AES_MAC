//
//  NSAlert+Extension.m
//  AES加密解密for mac
//
//  Created by 曾觉新 on 2017/8/6.
//  Copyright © 2017年 曾觉新. All rights reserved.
//

#import "NSAlert+Extension.h"

@implementation NSAlert (Extension)

+ (NSAlert *)alertWithMessageText:(NSString *)message defaultButton:(NSString *)defaultButton alternateButton:(NSString *)alternateButton otherButton:(NSString *)otherButton informativeTextWithFormat:(NSString *)format icon:(NSImage *)icon completionHandler:(void(^)(NSInteger result))completionHandler
{
    
    NSAlert *alert = [NSAlert alertWithMessageText:message defaultButton:defaultButton alternateButton:alternateButton otherButton:otherButton informativeTextWithFormat:@"%@", format];
    [alert setIcon:icon];//可以设置图片
    
    [alert setAlertStyle:NSWarningAlertStyle];
    
    [alert beginSheetModalForWindow:NSApp.keyWindow completionHandler:^(NSInteger result) {
        if (completionHandler) {
            completionHandler(result);
        }
        NSLog(@"%ld", result);
        
    }];
    
    return alert;
    
}

@end

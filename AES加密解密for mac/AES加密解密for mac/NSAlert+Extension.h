//
//  NSAlert+Extension.h
//  AES加密解密for mac
//
//  Created by 曾觉新 on 2017/8/6.
//  Copyright © 2017年 曾觉新. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface NSAlert (Extension)

+ (NSAlert *)alertWithMessageText:(NSString *)message defaultButton:(NSString *)defaultButton alternateButton:(NSString *)alternateButton otherButton:(NSString *)otherButton informativeTextWithFormat:(NSString *)format icon:(NSImage *)icon completionHandler:(void(^)(NSInteger result))completionHandler;

@end

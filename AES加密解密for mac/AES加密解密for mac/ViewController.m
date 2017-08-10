//
//  ViewController.m
//  AES加密解密for mac
//
//  Created by 曾觉新 on 2017/8/5.
//  Copyright © 2017年 曾觉新. All rights reserved.
//

#import "ViewController.h"
#import "AESCrypt.h"
#import "Masonry.h"
#import "NSAlert+Extension.h"

#define AESPAY_KEY @"abcd"
#define AESPasswordUserDefault @"AESPasswordUserDefault"

@interface ViewController ()

@property (nonatomic, strong) NSView *hidderView;

@property (nonatomic, strong) NSTextField *inputTextField;
@property (nonatomic, strong) NSTextView *outputTextView;

@property (nonatomic, strong) NSTextField *passwordTextField;

@property (nonatomic, strong) NSButton *deButton;
@property (nonatomic, strong) NSButton *enButton;


@end


@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initViews]; 
}
- (void)viewDidLayout
{
    [super viewDidLayout];
    
    [_inputTextField mas_updateConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@(self.view.frame.size.height - 20));
    }];
    [_outputTextView layoutSubtreeIfNeeded];
}
- (void)viewWillLayout
{
    [super viewWillLayout];
    
}


- (void)initViews
{
    self.hidderView = [NSView new];
    [self.view addSubview:self.hidderView];
    
    
    self.inputTextField = [[NSTextField alloc] init];
    self.inputTextField.textColor = [NSColor blackColor];
    self.inputTextField.placeholderString = @"请输入内容";
    [self.view addSubview:self.inputTextField];
    
    
    self.outputTextView = [[NSTextView alloc] init];
    self.outputTextView.editable = NO;
    self.outputTextView.selectable = YES;
    self.outputTextView.textColor = [NSColor blackColor];
    [self.view addSubview:self.outputTextView];
    
    
    self.deButton = [NSButton buttonWithTitle:@"解密" target:self action:@selector(clikButton:)];
    self.deButton.tag = 1;
    [self.view addSubview:self.deButton];
    
    
    self.enButton = [NSButton buttonWithTitle:@"加密" target:self action:@selector(clikButton:)];
    self.enButton.tag = 2;
    [self.view addSubview:self.enButton];
    
    
    self.passwordTextField = [[NSTextField alloc] init];
    self.passwordTextField.placeholderString = @"请输入key";
    [self.view addSubview:self.passwordTextField];
    NSString *passworld = [[NSUserDefaults standardUserDefaults] objectForKey:AESPasswordUserDefault];
    if (!passworld || passworld.length == 0) {
        passworld = AESPAY_KEY;
    }
    self.passwordTextField.stringValue = passworld;
        
    
    [self layoutViews];
}

- (void)layoutViews
{
    [self.hidderView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(@0);
        make.height.greaterThanOrEqualTo(@400);
        make.width.greaterThanOrEqualTo(@500);
    }];
    
    [self.passwordTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(@0);
        make.centerY.equalTo(@0);
        make.size.mas_equalTo(CGSizeMake(130, 30));
    }];
    
    
    [self.inputTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@10);
        make.right.equalTo(self.passwordTextField.mas_left).offset(-10);
        make.top.equalTo(@10);
    }];
    
    [self.deButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(@0);
        make.top.equalTo(self.passwordTextField.mas_bottom).offset(10);
        make.size.mas_equalTo(CGSizeMake(100, 30));
    }];
    
    
    [self.enButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(@0);
        make.bottom.equalTo(self.passwordTextField.mas_top).offset(-10);
        make.size.equalTo(self.deButton);
    }];
    
    
    [self.outputTextView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.passwordTextField.mas_right).offset(10);
        make.top.equalTo(self.inputTextField.mas_top);
        make.width.equalTo(self.inputTextField.mas_width);
        make.height.equalTo(self.inputTextField.mas_height);
    }];
}

#pragma mark- 点击事件
- (void)clikButton:(NSButton *)button
{
    if (self.inputTextField.stringValue.length == 0) {
        [self alertWithText:@"请在左边输入框中输入内容"];
        return;
    }
    NSString *password = _passwordTextField.stringValue;
    if (password.length == 0) {
        [self alertWithText:@"密码不能为空"];
        return;
    }
    
    if (button.tag == 1) {//解密
        [self deCode];
    } else {//加密
        [self enCode];
    }
    [[NSUserDefaults standardUserDefaults] setObject:password forKey:AESPasswordUserDefault];
}

- (void)deCode
{
    NSString *text = [AESCrypt decrypt:self.inputTextField.stringValue password:_passwordTextField.stringValue];
    if (text && text.length > 0) {
        self.outputTextView.string = text;
    } else {
        [self alertWithText:@"解码失败"];
    }
}
- (void)enCode
{
    NSString *text = [AESCrypt encrypt:self.inputTextField.stringValue password:_passwordTextField.stringValue];
    self.outputTextView.string = text;
}

- (void)alertWithText:(NSString *)text
{
    [NSAlert alertWithMessageText:@"提示" defaultButton:nil alternateButton:nil otherButton:nil informativeTextWithFormat:text icon:[NSImage imageNamed:@"image"] completionHandler:^(NSInteger result) {
        
    }];
}



- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}


@end



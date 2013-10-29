//
//  ZenKeyboardView.h
//  ZenKeyboard
//
//  Created by Kevin Nick on 2012-11-9.
//  Copyright (c) 2012年 com.zen. All rights reserved.
//

#import <UIKit/UIKit.h>

#define KeyboardNumericKeyWidth 75
#define KeyboardNumericKeyHeight 49

@protocol ZenKeyboardViewDelegate <NSObject>

- (void)didNumericKeyPressed:(UIButton *)button;
- (void)didBackspaceKeyPressed;
- (void)didCleanKeyPressed;
- (void)didNextKeyPressed;
- (void)didEnterKeyPressed;

@end

@interface ZenKeyboardView : UIView

- (id)initWithFrame:(CGRect)frame Type:(NSString *)type;

@property(nonatomic, assign) id<ZenKeyboardViewDelegate> delegate;

@end

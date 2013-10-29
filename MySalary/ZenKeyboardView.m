//
//  ZenKeyboardView.m
//  ZenKeyboard
//
//  Created by Kevin Nick on 2012-11-9.
//  Copyright (c) 2012年 com.zen. All rights reserved.
//

#import "ZenKeyboardView.h"

@implementation ZenKeyboardView

- (id)initWithFrame:(CGRect)frame Type:(NSString *)type
{
    self = [super initWithFrame:frame];
    if (self) {
        UIImageView *keyboardBackground = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"KeyboardBg"]];
        
        [self addSubview:keyboardBackground];
        
        [self addSubview:[self addNumericKeyWithTitle:@"1" frame:CGRectMake(10, 10, KeyboardNumericKeyWidth, KeyboardNumericKeyHeight)]];
        [self addSubview:[self addNumericKeyWithTitle:@"2" frame:CGRectMake(KeyboardNumericKeyWidth + 10, 10, KeyboardNumericKeyWidth, KeyboardNumericKeyHeight)]];
        [self addSubview:[self addNumericKeyWithTitle:@"3" frame:CGRectMake(KeyboardNumericKeyWidth * 2 + 10, 10, KeyboardNumericKeyWidth, KeyboardNumericKeyHeight)]];
        [self addSubview:[self addBackspaceKeyWithFrame:CGRectMake(KeyboardNumericKeyWidth * 3 + 10, 10 , KeyboardNumericKeyWidth, KeyboardNumericKeyHeight)]];
        
        [self addSubview:[self addNumericKeyWithTitle:@"4" frame:CGRectMake(10, KeyboardNumericKeyHeight+10, KeyboardNumericKeyWidth, KeyboardNumericKeyHeight)]];
        [self addSubview:[self addNumericKeyWithTitle:@"5" frame:CGRectMake(KeyboardNumericKeyWidth + 10, KeyboardNumericKeyHeight+10, KeyboardNumericKeyWidth, KeyboardNumericKeyHeight)]];
        [self addSubview:[self addNumericKeyWithTitle:@"6" frame:CGRectMake(KeyboardNumericKeyWidth * 2 + 10, KeyboardNumericKeyHeight+10, KeyboardNumericKeyWidth, KeyboardNumericKeyHeight)]];
        [self addSubview:[self addCleanKeyWithTitle:@"C" frame:CGRectMake(KeyboardNumericKeyWidth * 3 + 10, KeyboardNumericKeyHeight+10 , KeyboardNumericKeyWidth, KeyboardNumericKeyHeight)]];
        
        [self addSubview:[self addNumericKeyWithTitle:@"7" frame:CGRectMake(10, KeyboardNumericKeyHeight * 2 + 10, KeyboardNumericKeyWidth, KeyboardNumericKeyHeight)]];
        [self addSubview:[self addNumericKeyWithTitle:@"8" frame:CGRectMake(KeyboardNumericKeyWidth + 10, KeyboardNumericKeyHeight * 2+10, KeyboardNumericKeyWidth , KeyboardNumericKeyHeight)]];
        [self addSubview:[self addNumericKeyWithTitle:@"9" frame:CGRectMake(KeyboardNumericKeyWidth * 2 + 10, KeyboardNumericKeyHeight * 2+10, KeyboardNumericKeyWidth, KeyboardNumericKeyHeight)]];
        
        
        [self addSubview:[self addSpecialNumericKeyWithTitle:@"0" frame:CGRectMake(10 , KeyboardNumericKeyHeight * 3+10, KeyboardNumericKeyWidth * 2, KeyboardNumericKeyHeight)]];
        [self addSubview:[self addNumericKeyWithTitle:@"." frame:CGRectMake(KeyboardNumericKeyWidth * 2 + 10, KeyboardNumericKeyHeight * 3 + 10, KeyboardNumericKeyWidth, KeyboardNumericKeyHeight)]];
        
        if([type isEqualToString:@"cal"]){
            [self addSubview:[self addEnterKeyWithTitle:@"计算" frame:CGRectMake(KeyboardNumericKeyWidth * 3 + 10, KeyboardNumericKeyHeight * 3 +10, KeyboardNumericKeyWidth, KeyboardNumericKeyHeight)]];
        }else if ([type isEqualToString:@"setting"]){
            [self addSubview:[self addNextKeyWithTitle:@"下一个" frame:CGRectMake(KeyboardNumericKeyWidth * 3 + 10, KeyboardNumericKeyHeight * 2 +10, KeyboardNumericKeyWidth, KeyboardNumericKeyHeight)]];
            [self addSubview:[self addEnterKeyWithTitle:@"完成" frame:CGRectMake(KeyboardNumericKeyWidth * 3 + 10, KeyboardNumericKeyHeight * 3 +10, KeyboardNumericKeyWidth, KeyboardNumericKeyHeight)]];            
        }
        
    }
    
    return self;
}

- (UIButton *)addNumericKeyWithTitle:(NSString *)title frame:(CGRect)frame {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = frame;
    [button setTitle:title forState:UIControlStateNormal];
    [button.titleLabel setFont:[UIFont systemFontOfSize:24.0]];
    
    [button setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    [button setTitleColor:[UIColor darkGrayColor] forState:UIControlStateHighlighted];
    [button setTitleShadowColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button setTitleShadowColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
    [button.titleLabel setShadowOffset:CGSizeMake(0, 1)];
    
    UIImage *buttonImage = [UIImage imageNamed:@"keyNumberNormal"];
    UIImage *buttonPressedImage = [UIImage imageNamed:@"keyNumberPress"];
    [button setBackgroundImage:buttonImage forState:UIControlStateNormal];
    [button setBackgroundImage:buttonPressedImage forState:UIControlStateHighlighted];
    [button addTarget:self action:@selector(pressNumericKey:) forControlEvents:UIControlEventTouchUpInside];
    
    return button;
}

- (UIButton *)addSpecialNumericKeyWithTitle:(NSString *)title frame:(CGRect)frame {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = frame;
    [button setTitle:title forState:UIControlStateNormal];
    [button.titleLabel setFont:[UIFont systemFontOfSize:24.0]];
    
    [button setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    [button setTitleColor:[UIColor darkGrayColor] forState:UIControlStateHighlighted];
    [button setTitleShadowColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button setTitleShadowColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
    [button.titleLabel setShadowOffset:CGSizeMake(0, 1)];
    
    UIImage *buttonImage = [UIImage imageNamed:@"keyZeroNormal"];
    UIImage *buttonPressedImage = [UIImage imageNamed:@"keyZeroPress"];
    [button setBackgroundImage:buttonImage forState:UIControlStateNormal];
    [button setBackgroundImage:buttonPressedImage forState:UIControlStateHighlighted];
    [button addTarget:self action:@selector(pressNumericKey:) forControlEvents:UIControlEventTouchUpInside];
    
    return button;
}

- (UIButton *)addBackspaceKeyWithFrame:(CGRect)frame {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = frame;
    UIImage *buttonImage = [UIImage imageNamed:@"keyNumberNormal"];
    UIImage *buttonPressedImage = [UIImage imageNamed:@"keyNumberPress"];
    UIImage *image = [UIImage imageNamed:@"backspaceKey"];
    UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(22, 14, image.size.width, image.size.height)];
    imgView.image = image;
    [button addSubview:imgView];
    [button setBackgroundImage:buttonImage forState:UIControlStateNormal];
    [button setBackgroundImage:buttonPressedImage forState:UIControlStateHighlighted];
    [button addTarget:self action:@selector(pressBackspaceKey) forControlEvents:UIControlEventTouchUpInside];
    
    return button;
}

- (UIButton *)addCleanKeyWithTitle:(NSString *)title frame:(CGRect)frame {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = frame;
    
    [button setTitle:title forState:UIControlStateNormal];
    [button.titleLabel setFont:[UIFont systemFontOfSize:22.0]];
    
    [button setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    [button setTitleColor:[UIColor darkGrayColor] forState:UIControlStateHighlighted];
    [button setTitleShadowColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button setTitleShadowColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
    [button.titleLabel setShadowOffset:CGSizeMake(0, 1)];
    
    
    UIImage *buttonImage = [UIImage imageNamed:@"keyNumberNormal"];
    UIImage *buttonPressedImage = [UIImage imageNamed:@"keyNumberPress"];
    [button setBackgroundImage:buttonImage forState:UIControlStateNormal];
    [button setBackgroundImage:buttonPressedImage forState:UIControlStateHighlighted];
    [button addTarget:self action:@selector(pressCleanKey) forControlEvents:UIControlEventTouchUpInside];
    
    return button;
}

- (UIButton *)addNextKeyWithTitle:(NSString *)title frame:(CGRect)frame {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = frame;
    
    [button setTitle:title forState:UIControlStateNormal];
    [button.titleLabel setFont:[UIFont systemFontOfSize:16.0]];
    
    [button setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    [button setTitleColor:[UIColor darkGrayColor] forState:UIControlStateHighlighted];
    [button setTitleShadowColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button setTitleShadowColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
    [button.titleLabel setShadowOffset:CGSizeMake(0, 1)];
    
    
    UIImage *buttonImage = [UIImage imageNamed:@"keyNumberNormal"];
    UIImage *buttonPressedImage = [UIImage imageNamed:@"keyNumberPress"];
    [button setBackgroundImage:buttonImage forState:UIControlStateNormal];
    [button setBackgroundImage:buttonPressedImage forState:UIControlStateHighlighted];
    [button addTarget:self action:@selector(pressNextKey) forControlEvents:UIControlEventTouchUpInside];
    
    return button;
}


- (UIButton *)addEnterKeyWithTitle:(NSString *)title frame:(CGRect)frame {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = frame;
    [button setTitle:title forState:UIControlStateNormal];
    [button.titleLabel setFont:[UIFont systemFontOfSize:16.0]];
    UIColor *textShadowColor = [UIColor colorWithRed:134.0f/255.0f green:72.0f/255.0f blue:0.0f/255.0f alpha:255.0f/255.0f];
    [button setTitleColor:textShadowColor forState:UIControlStateNormal];
    [button setTitleColor:textShadowColor forState:UIControlStateHighlighted];
    [button setTitleShadowColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button setTitleShadowColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
    [button.titleLabel setShadowOffset:CGSizeMake(0, 1)];
    
    UIImage *buttonImage = [UIImage imageNamed:@"keyEnterNormal"];
    UIImage *buttonPressedImage = [UIImage imageNamed:@"keyEnterPress"];
    [button setBackgroundImage:buttonImage forState:UIControlStateNormal];
    [button setBackgroundImage:buttonPressedImage forState:UIControlStateHighlighted];
    [button addTarget:self action:@selector(enterEnterKey) forControlEvents:UIControlEventTouchUpInside];
    
    return button;
}

- (void)pressNumericKey:(UIButton *)button {
    [self.delegate didNumericKeyPressed:button];
}


- (void)pressBackspaceKey {
    [self.delegate didBackspaceKeyPressed];
}

- (void)pressCleanKey {
    [self.delegate didCleanKeyPressed];
}

- (void)pressNextKey {
    [self.delegate didNextKeyPressed];
}

- (void)enterEnterKey {
    [self.delegate didEnterKeyPressed];
}

/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect
 {
 // Drawing code
 }
 */

@end

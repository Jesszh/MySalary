//
//  OliveSettingViewController.h
//  MySalary
//
//  Created by Jess on 13-5-23.
//  Copyright (c) 2013年 UDL. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZenKeyboardView.h"
#import "OliveCalculator.h"
#import "OliveSalaryDetails.h"
#import "MHNatGeoViewControllerTransition.h"

@interface OliveCalViewController : UIViewController <ZenKeyboardViewDelegate, UITextFieldDelegate>
{
    int calcType;
}

@property (weak, nonatomic) IBOutlet UITextField *salaryInput;
@property (weak, nonatomic) IBOutlet UIButton *type;
- (IBAction)Setting:(id)sender;

- (IBAction)ViewTouchDown:(id)sender;

- (IBAction)textFieldDidEndEditing:(id)sender;

- (IBAction)calcType:(id)sender;


@property (nonatomic, strong) NSMutableDictionary *config;

@property (nonatomic, strong) OliveCalculator *calculator;

@property (nonatomic, strong) ZenKeyboardView *keyboardView;

@property (nonatomic, strong) OliveCity *city;

@end

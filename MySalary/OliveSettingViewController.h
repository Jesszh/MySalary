//
//  OliveSettingViewController.h
//  MySalary
//
//  Created by Jess on 13-5-23.
//  Copyright (c) 2013年 UDL. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZenKeyboardView.h"

@interface OliveSettingViewController : UIViewController <ZenKeyboardViewDelegate, UITextFieldDelegate>{
    
    UITextField *activeTextField;
    
    bool isNext;
    
}


@property (weak, nonatomic) IBOutlet UITextField *PMUCash;
@property (weak, nonatomic) IBOutlet UITextField *hoursingFundCash;

@property (weak, nonatomic) IBOutlet UITextField *persionP;
@property (weak, nonatomic) IBOutlet UITextField *persionC;

@property (weak, nonatomic) IBOutlet UITextField *medicalP;
@property (weak, nonatomic) IBOutlet UITextField *medicalC;

@property (weak, nonatomic) IBOutlet UITextField *unemployeeP;
@property (weak, nonatomic) IBOutlet UITextField *unemployeeC;

@property (weak, nonatomic) IBOutlet UITextField *pregentC;

@property (weak, nonatomic) IBOutlet UITextField *hurtC;

@property (weak, nonatomic) IBOutlet UITextField *hoursFundP;
@property (weak, nonatomic) IBOutlet UITextField *hoursFundC;


@property (nonatomic, strong) ZenKeyboardView *keyboardView;


- (void)textFieldDidBeginEditing:(UITextField *)textField;

- (IBAction)ViewTouchDown:(id)sender;

- (IBAction)textFieldDidEndEditing:(id)sender;

- (IBAction)dismiss:(id)sender;

@end

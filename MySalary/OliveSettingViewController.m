//
//  OliveSettingViewController.m
//  MySalary
//
//  Created by Jess on 13-5-23.
//  Copyright (c) 2013年 UDL. All rights reserved.
//

#import "OliveSettingViewController.h"
#import "OliveFund.h"
#import "OliveCity.h"
#import "MHNatGeoViewControllerTransition.h"

@interface OliveSettingViewController ()
@end

@implementation OliveSettingViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    [self setUI];
//    
//    _persionC.placeholder = [NSString stringWithFormat:@"%.2f",fund.cPension];
//    _persionP.placeholder = [NSString stringWithFormat:@"%.2f",fund.pension];
//    
//    _medicalC.placeholder = [NSString stringWithFormat:@"%.2f",fund.cMedicalCare];
//    _medicalP.placeholder = [NSString stringWithFormat:@"%.2f",fund.medicalCare];
//    
//    _unemployeeC.placeholder = [NSString stringWithFormat:@"%.2f",fund.cUnemployment];
//    _unemployeeP.placeholder = [NSString stringWithFormat:@"%.2f",fund.unemployment];
//    
//    _pregentC.placeholder = [NSString stringWithFormat:@"%.2f",fund.cPregnancy];
//    _hurtC.placeholder = [NSString stringWithFormat:@"%.2f",fund.cIndustrialInjury];
//    
//    _hoursFundC.placeholder = [NSString stringWithFormat:@"%.2f",fund.basicHousingFund];
//    _hoursFundP.placeholder = [NSString stringWithFormat:@"%.2f",fund.basicHousingFund];
    
}

- (void)setUI {
    _keyboardView = [[ZenKeyboardView alloc] initWithFrame:CGRectMake(0, 0, 320, 216) Type:@"setting"];
    _keyboardView.delegate = self;
    
    _PMUCash.inputView = _keyboardView;
    _PMUCash.delegate = self;
    _hoursingFundCash.inputView = _keyboardView;
    _hoursingFundCash.delegate = self;
    
    _persionC.inputView = _keyboardView;
    _persionC.delegate = self;
    _persionP.inputView = _keyboardView;
    _persionP.delegate = self;
    
    _medicalC.inputView = _keyboardView;
    _medicalC.delegate = self;
    _medicalP.inputView = _keyboardView;
    _medicalP.delegate = self;
    
    _unemployeeC.inputView = _keyboardView;
    _unemployeeC.delegate = self;
    _unemployeeP.inputView = _keyboardView;
    _unemployeeP.delegate = self;
    
    _pregentC.inputView = _keyboardView;
    _pregentC.delegate = self;
    
    _hurtC.inputView = _keyboardView;
    _hurtC.delegate = self;
    
    _hoursFundC.inputView = _keyboardView;
    _hoursFundC.delegate = self;
    _hoursFundP.inputView = _keyboardView;
    _hoursFundP.delegate = self;
    
    [_keyboardView resignFirstResponder];
}




- (void)didNumericKeyPressed:(UIButton *)button {
    NSString *specialText = @".";
    if([button.titleLabel.text isEqualToString:specialText] && [activeTextField.text rangeOfString:specialText].length > 0){
        return;
    }
    activeTextField.text = [NSString stringWithFormat:@"%@%@", activeTextField.text, button.titleLabel.text];
}

- (void)didBackspaceKeyPressed {
    NSInteger length = activeTextField.text.length;
    
    if (length == 0) {
        activeTextField.text = @"";
        return;
    }
    
    NSString *substring = [activeTextField.text substringWithRange:NSMakeRange(0, length - 1)];
    activeTextField.text = substring;
}

- (void)didCleanKeyPressed {
    activeTextField.text = @"";
}

- (void)didNextKeyPressed {
    isNext = YES;
    int thisTag = (int) activeTextField.tag;
    
    if(thisTag == 11){
        NSLog(@"the last one");
        return;
    }
    
    int nextTag = thisTag +1;
    UITextField *nextTextField = (UITextField *)[self.view viewWithTag:nextTag];
    [nextTextField becomeFirstResponder];
    
    isNext = NO;
}

- (void)didEnterKeyPressed {
    [activeTextField resignFirstResponder];
    
};

- (void) textFieldDidBeginEditing:(UITextField *)textField{
    activeTextField = textField;
    
    CGRect frame = textField.frame;
    int offset = frame.origin.y + 40 - (self.view.frame.size.height - 216.0);
    NSTimeInterval animationDuration = 0.30f;
    [UIView beginAnimations:@"ResizeForKeyBoard" context:nil];
    [UIView setAnimationDuration:animationDuration];
    float width = self.view.frame.size.width;
    float height = self.view.frame.size.height;
    if(offset > 0)
    {
        CGRect rect = CGRectMake(0.0f, -offset,width,height);
        self.view.frame = rect;
    }
    [UIView commitAnimations];
}

- (IBAction)ViewTouchDown:(id)sender {
    
    [[UIApplication sharedApplication] sendAction:@selector(resignFirstResponder) to:nil from:nil forEvent:nil];
}

- (IBAction)textFieldDidEndEditing:(id)sender{
    
    if (isNext != YES) {
        
        NSTimeInterval animationDuration = 0.30f;
        [UIView beginAnimations:@"ResizeForKeyboard" context:nil];
        [UIView setAnimationDuration:animationDuration];
        CGRect rect = CGRectMake(0.0f, 0.0f, self.view.frame.size.width, self.view.frame.size.height);
        self.view.frame = rect;
        [UIView commitAnimations];
        
        [sender resignFirstResponder];
    }
}

- (IBAction)dismiss:(id)sender {
    [self dismissNatGeoViewController];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end

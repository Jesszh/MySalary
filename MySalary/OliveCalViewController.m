//
//  OliveSettingViewController.m
//  MySalary
//
//  Created by Jess on 13-5-23.
//  Copyright (c) 2013年 UDL. All rights reserved.
//

#import "OliveAppDelegate.h"
#import "OliveCalViewController.h"

@interface OliveCalViewController ()

@end

@implementation OliveCalViewController


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
    
    OliveAppDelegate *myDelegate = [[UIApplication sharedApplication] delegate];

    if(myDelegate.city == nil){
        
        _config = [[NSMutableDictionary alloc]init];
    
        [self initConfig];
    
        OliveCity *city = [_config valueForKey:@"北京"];
        myDelegate.city = city;
    }
    
    _city = myDelegate.city;
    
    
	// Do any additional setup after loading the view.
    [self setUI];
    _calculator = [[OliveCalculator alloc] init];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setUI {
    _keyboardView = [[ZenKeyboardView alloc] initWithFrame:CGRectMake(0, 0, 320, 216) Type:@"cal"];
    _keyboardView.delegate = self;
    _salaryInput.inputView = _keyboardView;
    [_keyboardView resignFirstResponder];
}

- (void)didNumericKeyPressed:(UIButton *)button {
    NSString *specialText = @".";
    if([button.titleLabel.text isEqualToString:specialText] && [_salaryInput.text rangeOfString:specialText].length > 0){
        return;
    }
    _salaryInput.text = [NSString stringWithFormat:@"%@%@", _salaryInput.text, button.titleLabel.text];
}

- (void)didBackspaceKeyPressed {
    NSInteger length = _salaryInput.text.length;

    if (length == 0) {
        _salaryInput.text = @"";
        return;
    }

    NSString *substring = [_salaryInput.text substringWithRange:NSMakeRange(0, length - 1)];
    _salaryInput.text = substring;
}

- (void)didCleanKeyPressed {
    _salaryInput.text = @"";
}


- (void)didNextKeyPressed {
    return;
}

- (void)didEnterKeyPressed {
    [self didCalucate];

};

-(void) didCalucate{
    
    if (_salaryInput.text.length != 0) {
        double inputSalary = [_salaryInput.text doubleValue];
        double threshold = 3500;
        double pmu=-1,housingFund=-1;
        OliveSalaryDetails *salaryDetails;
        
        NSLog(@"%d",calcType);
        if(calcType == 0){
            salaryDetails= [_calculator calWithPreTaxIncome: inputSalary
                                                  threshold: threshold
                                                        pmu: pmu
                                                housingFund: housingFund
                                                       city: _city];
            NSLog(@"税后工资：%.2f",salaryDetails.afterTaxIncome);
        }else if(calcType == 1){
            
            salaryDetails = [_calculator calWithAfterTaxIncome: inputSalary
                                                     threshold: threshold
                                                           pmu: pmu
                                                   housingFund: housingFund
                                                          city: _city];
            NSLog(@"税前工资：%.2f",salaryDetails.preTaxIncome);
        }

        [_salaryInput resignFirstResponder];
    }
}

- (IBAction)ViewTouchDown:(id)sender {
    [[UIApplication sharedApplication] sendAction:@selector(resignFirstResponder) to:nil from:nil forEvent:nil];
}

- (IBAction)textFieldDidEndEditing:(id)sender{
    [sender resignFirstResponder];
}

- (IBAction)Setting:(id)sender {
    [_salaryInput resignFirstResponder];
}

- (void)initConfig {
    NSString *path = [[NSBundle mainBundle] pathForResource:@"city" ofType:@"plist"];
    NSMutableArray *cities = [[NSMutableArray alloc] initWithContentsOfFile:path];
    
    for (NSDictionary *item in cities) {
        
        NSString *name = [item objectForKey:@"name"];
        double lowerPMU = [[item objectForKey:@"lowerPMU"] doubleValue];
        double upperPMU = [[item objectForKey:@"upperPMU"] doubleValue];
        double lowerH = [[item objectForKey:@"lowerH"] doubleValue];
        double upperH = [[item objectForKey:@"upperH"] doubleValue];
        double pension = [[item objectForKey:@"pension"] doubleValue];
        double medicalCare = [[item objectForKey:@"medicalCare"] doubleValue];
        double unemployment = [[item objectForKey:@"unemployment"] doubleValue];
        double cPension = [[item objectForKey:@"cPension"] doubleValue];
        double cMedicalCare = [[item objectForKey:@"cMedicalCare"] doubleValue];
        double cUnemployment = [[item objectForKey:@"cUnemployment"] doubleValue];
        double cIndustrialInjury = [[item objectForKey:@"cIndustrialInjury"] doubleValue];
        double cPregnancy = [[item objectForKey:@"cPregnancy"] doubleValue];
        double basicHousingFund = [[item objectForKey:@"basicHousingFund"] doubleValue];
        
        
        OliveCity *city = [[OliveCity alloc] initWithName:name];
        city.rangePMU = [[OliveRange alloc]initWithLower:lowerPMU upper:upperPMU];
        city.rangeBasicHousingFund = [[OliveRange alloc]initWithLower:lowerH upper:upperH];
        city.fund = [[OliveFund alloc]initWithPension:pension medicalCare:medicalCare unemployment:unemployment industrialInjury:0 pregnancy:0 cPension:cPension cMedicalCare:cMedicalCare cUnemployment:cUnemployment cIndustrialInjury:cIndustrialInjury cPregnancy:cPregnancy basicHousingFund:basicHousingFund];
        
        [_config setValue:city forKey:city.name];
    }
}

- (IBAction)calcType:(id)sender {
    if(calcType == 1){
        calcType = 0;
        [_type setTitle:@"正算" forState:UIControlStateNormal];
        return;
    }
    calcType = 1;
    [_type setTitle:@"反推" forState:UIControlStateNormal];
}
@end

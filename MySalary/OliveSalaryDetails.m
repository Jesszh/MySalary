//
//  OliveSalaryDetails.m
//  MySalary
//
//  Created by Jess on 13-5-14.
//  Copyright (c) 2013年 UDL. All rights reserved.
//

#import "OliveSalaryDetails.h"

@implementation OliveSalaryDetails


- (id)init {
    if (self = [super init]) {
        return self;
    }
    
    return nil;
}

- (id)initWithCity:(OliveCity *)city
      preTaxIncome:(double)preTaxIncome
    afterTaxIncome:(double)afterTaxIncome
     taxableAmount:(double)taxableAmount
               tax:(double)tax
     pensionAmount:(double)pensionAmount
 medicalCareAmount:(double)medicalCareAmount
unemploymentAmount:(double)unemploymentAmount
    cPensionAmount:(double)cPensionAmount
cMedicalCareAmount:(double)cMedicalCareAmount
cUnemploymentAmount:(double)cUnemploymentAmount
cIndustrialInjuryAmount:(double)cIndustrialInjuryAmount
  cPregnancyAmount:(double)cPregnancyAmount
basicHousingFundAmount:(double)basicHousingFundAmount
totalPersonalAmount:(double)totalPersonalAmount
totalCompanyAmount:(double)totalCompanyAmount {
    if (self = [self init]) {
        _city = city;
        _preTaxIncome = preTaxIncome;
        _afterTaxIncome = afterTaxIncome;
        _taxableAmount = taxableAmount;
        _tax = tax;
        _pensionAmount = pensionAmount;
        _medicalCareAmount = medicalCareAmount;
        _unemploymentAmount = unemploymentAmount;
        _cPensionAmount = cPensionAmount;
        _cMedicalCareAmount = cMedicalCareAmount;
        _cUnemploymentAmount = cUnemploymentAmount;
        _cPregnancyAmount = cIndustrialInjuryAmount;
        _cPregnancyAmount = cPregnancyAmount;
        _basicHousingFundAmount = basicHousingFundAmount;
        _totalPersonalAmount = totalPersonalAmount;
        _totalCompanyAmount = totalCompanyAmount;
    }
    
    return self;
}

@end

//
//  OliveSalaryDetails.h
//  MySalary
//
//  Created by Jess on 13-5-14.
//  Copyright (c) 2013年 UDL. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "OliveCity.h"

@interface OliveSalaryDetails : NSObject


@property (nonatomic, strong) OliveCity *city;
@property (nonatomic, assign) double preTaxIncome;
@property (nonatomic, assign) double afterTaxIncome;
@property (nonatomic, assign) double taxableAmount;
@property (nonatomic, assign) double tax;

@property (nonatomic, assign) double pensionAmount;
@property (nonatomic, assign) double medicalCareAmount;
@property (nonatomic, assign) double unemploymentAmount;

@property (nonatomic, assign) double cPensionAmount;
@property (nonatomic, assign) double cMedicalCareAmount;
@property (nonatomic, assign) double cUnemploymentAmount;
@property (nonatomic, assign) double cIndustrialInjuryAmount;
@property (nonatomic, assign) double cPregnancyAmount;

@property (nonatomic, assign) double basicHousingFundAmount;

@property (nonatomic, assign) double totalCompanyAmount;
@property (nonatomic, assign) double totalPersonalAmount;

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
totalCompanyAmount:(double)totalCompanyAmount;

@end

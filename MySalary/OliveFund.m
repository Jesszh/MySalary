//
//  OliveFund.m
//  MySalary
//
//  Created by Jess on 13-5-14.
//  Copyright (c) 2013年 UDL. All rights reserved.
//

#import "OliveFund.h"

@implementation OliveFund

- (id)init {
    if (self = [super init]) {
        return self;
    }
    
    return nil;
}

- (id)initWithPension:(double)pension
          medicalCare:(double)medicalCare
         unemployment:(double)unemployment
     industrialInjury:(double)industrialInjury
            pregnancy:(double)pregnancy
             cPension:(double)cPension
         cMedicalCare:(double)cMedicalCare
        cUnemployment:(double)cUnemployment
    cIndustrialInjury:(double)cIndustrialInjury
           cPregnancy:(double)cPregnancy
     basicHousingFund:(double)basicHousingFund{
    if (self = [self init]) {
        _pension = pension;
        _medicalCare = medicalCare;
        _unemployment = unemployment;
        _industrialInjury = industrialInjury;
        _pregnancy = pregnancy;
        _basicHousingFund = basicHousingFund;
        _cPension = cPension;
        _cMedicalCare = cMedicalCare;
        _cUnemployment = cUnemployment;
        _cIndustrialInjury = cIndustrialInjury;
        _cPregnancy = cPregnancy;
    }
    
    return self;
}

@end

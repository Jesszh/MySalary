//
//  OliveFund.h
//  MySalary
//
//  Created by Jess on 13-5-14.
//  Copyright (c) 2013年 UDL. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface OliveFund : NSObject


@property (nonatomic, assign) double pension;
@property (nonatomic, assign) double medicalCare;
@property (nonatomic, assign) double unemployment;
@property (nonatomic, assign) double industrialInjury;
@property (nonatomic, assign) double pregnancy;
@property (nonatomic, assign) double cPension;
@property (nonatomic, assign) double cMedicalCare;
@property (nonatomic, assign) double cUnemployment;
@property (nonatomic, assign) double cIndustrialInjury;
@property (nonatomic, assign) double cPregnancy;
@property (nonatomic, assign) double basicHousingFund;


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
     basicHousingFund:(double)basicHousingFund;


@end

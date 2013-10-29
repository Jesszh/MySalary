//
//  OliveCalculator.h
//  MySalary
//
//  Created by Jess on 13-5-14.
//  Copyright (c) 2013年 UDL. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "OliveSalaryDetails.h"
#import "OliveCity.h"

@interface OliveCalculator : NSObject

- (OliveSalaryDetails *)calWithPreTaxIncome:(double)income
                                  threshold:(double)threshold
                                        pmu:(double)pmu
                                housingFund:(double)housingFund
                                       city:(OliveCity *)city;


- (OliveSalaryDetails *)calWithAfterTaxIncome:(double)income
                                  threshold:(double)threshold
                                        pmu:(double)pmu
                                housingFund:(double)housingFund
                                       city:(OliveCity *)city;

@end

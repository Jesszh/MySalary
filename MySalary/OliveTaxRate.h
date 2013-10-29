//
//  TaxRate.h
//  MySalary
//
//  Created by Jess on 13-5-14.
//  Copyright (c) 2013年 UDL. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface OliveTaxRate : NSObject

@property(nonatomic,assign) double taxRate;
@property(nonatomic,assign) double deduction;

+ (OliveTaxRate *)initWithTaxableAmount:(double)amount;
+ (OliveTaxRate *)initWithTaxedAmount:(double)amount;

@end

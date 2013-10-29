//
//  TaxRate.m
//  MySalary
//
//  Created by Jess on 13-5-14.
//  Copyright (c) 2013年 UDL. All rights reserved.
//

#import "OliveTaxRate.h"

@implementation OliveTaxRate


- (id)init {
    
    if (self = [super init]) {
        return self;
    }
    
    return nil;
}

- (id)initWithTaxRate:(double)taxRate
            deduction:(double)deduction {
    if (self = [self init]) {
        _taxRate = taxRate;
        _deduction = deduction;
    }
    
    return self;
}

+ (OliveTaxRate *)initWithTaxableAmount:(double)amount {
    if (amount <= 1500 && amount >= 0) {
        return [[OliveTaxRate alloc]initWithTaxRate:0.03 deduction:0];
    } else if (amount > 1500 && amount <= 4500) {
        return [[OliveTaxRate alloc]initWithTaxRate:0.1 deduction:105];
    } else if (amount > 4500 && amount <= 9000) {
        return [[OliveTaxRate alloc]initWithTaxRate:0.2 deduction:555];
    } else if (amount > 9000 && amount <= 35000) {
        return [[OliveTaxRate alloc]initWithTaxRate:0.25 deduction:1005];
    } else if (amount > 35000 && amount <= 55000) {
        return [[OliveTaxRate alloc]initWithTaxRate:0.3 deduction:2755];
    } else if (amount > 55000 && amount <= 80000) {
        return [[OliveTaxRate alloc]initWithTaxRate:0.35 deduction:5505];
    } else if (amount > 80000) {
        return [[OliveTaxRate alloc]initWithTaxRate:0.45 deduction:13505];
    }
    
    return [[OliveTaxRate alloc]init];
}


+ (OliveTaxRate *)initWithTaxedAmount:(double)amount{
    if (amount <= 1455 && amount >= 0) {
        return [[OliveTaxRate alloc]initWithTaxRate:0.03 deduction:0];
    } else if (amount > 1455 && amount <= 4155) {
        return [[OliveTaxRate alloc]initWithTaxRate:0.1 deduction:105];
    } else if (amount > 4155 && amount <= 7755) {
        return [[OliveTaxRate alloc]initWithTaxRate:0.2 deduction:555];
    } else if (amount > 7755 && amount <= 27255) {
        return [[OliveTaxRate alloc]initWithTaxRate:0.25 deduction:1005];
    } else if (amount > 27255 && amount <= 41255) {
        return [[OliveTaxRate alloc]initWithTaxRate:0.3 deduction:2755];
    } else if (amount > 41255 && amount <= 57505) {
        return [[OliveTaxRate alloc]initWithTaxRate:0.35 deduction:5505];
    } else if (amount > 57505) {
        return [[OliveTaxRate alloc]initWithTaxRate:0.45 deduction:13505];
    }
    
    return [[OliveTaxRate alloc]init];
    
}

@end

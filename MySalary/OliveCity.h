//
//  OliveCity.h
//  MySalary
//
//  Created by Jess on 13-5-14.
//  Copyright (c) 2013年 UDL. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "OliveRange.h"
#import "OliveFund.h"

@interface OliveCity : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) OliveRange *rangePMU; // 三金汇缴基数
@property (nonatomic, strong) OliveRange *rangeBasicHousingFund; // 公积金汇缴基数
@property (nonatomic, strong) OliveFund *fund; // 五险一金

- (id)initWithName:(NSString *)name;

@end

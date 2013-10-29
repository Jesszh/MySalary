//
//  OliveCity.m
//  MySalary
//
//  Created by Jess on 13-5-14.
//  Copyright (c) 2013年 UDL. All rights reserved.
//

#import "OliveCity.h"

@implementation OliveCity

- (id)init {
    if (self = [super init]) {
        return self;
    }
    
    return nil;
}

- (id)initWithName:(NSString *)name {
    if (self = [self init]) {
        _name = name;
    }
    
    return self;
}

//
//- (NSString *)title {
//    if ([_name isKindOfClass:[NSNull class]])
//        return @"Unknown";
//    else
//        return _name;
//}
//
//- (NSString *)subtitle {
//    return [NSString stringWithFormat:@""] ;
//}

//- (NSString *)description {
//    return  [NSString stringWithFormat:@"城市: %@, 区域: %@, 纬度: %f, 经度: %f \n三金汇缴基数: %@, \n公积金汇缴基数: %@, \n五险一金: %@", _name, _region, _rangePMU, _rangeBasicHousingFund, _fund];
//}

@end

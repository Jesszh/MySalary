//
//  OliveRange.m
//  MySalary
//
//  Created by Jess on 13-5-14.
//  Copyright (c) 2013年 UDL. All rights reserved.
//

#import "OliveRange.h"

@implementation OliveRange

- (id)init {
    if (self = [super init]) {
        return self;
    }
    
    return nil;
}

- (id)initWithLower:(double)lower
              upper:(double)upper {
    if (self = [self init]) {
        _lower = lower;
        _upper = upper;
    }
    
    return self;
}

- (BOOL)withinRange:(double)number {
    return number >= _lower && number <= _upper;
}

@end

//
//  OliveRange.h
//  MySalary
//
//  Created by Jess on 13-5-14.
//  Copyright (c) 2013年 UDL. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface OliveRange : NSObject

@property (nonatomic, assign) double upper;
@property (nonatomic, assign) double lower;

- (id)initWithLower:(double)upper upper:(double)lower;
- (BOOL)withinRange:(double)number;


@end

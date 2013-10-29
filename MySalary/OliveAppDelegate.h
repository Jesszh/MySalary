//
//  OliveAppDelegate.h
//  MySalary
//
//  Created by Jess on 13-5-14.
//  Copyright (c) 2013年 UDL. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OliveCity.h"

@interface OliveAppDelegate : UIResponder <UIApplicationDelegate>{
    OliveCity *city;
}

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) OliveCity *city;

@end


//
//  Task.m
//  PoDo
//
//  Created by Steve Tuckner on 1/14/14.
//  Copyright (c) 2014 Steve Tuckner. All rights reserved.
//

#import "Task.h"
#import <Parse/PFObject+Subclass.h>

@implementation Task

@dynamic headline;
@dynamic body;
@dynamic priority;

+ (NSString *)parseClassName
{
    return @"Task";
}

@end

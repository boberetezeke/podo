//
//  Task.h
//  PoDo
//
//  Created by Steve Tuckner on 1/14/14.
//  Copyright (c) 2014 Steve Tuckner. All rights reserved.
//

#import <Parse/Parse.h>

@interface Task : PFObject<PFSubclassing>
+ (NSString *)parseClassName;

@property (retain) NSString *headline;
@property (retain) NSString *body;
@property (retain) NSNumber *priority;

@end

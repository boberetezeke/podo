//
//  User.m
//  PoDo
//
//  Created by Steve Tuckner on 1/14/14.
//  Copyright (c) 2014 Steve Tuckner. All rights reserved.
//

#import "User.h"
#import <Parse/PFSubclassing.h>

@implementation User

@synthesize groups = _groups;
@synthesize tasks = _tasks;

/*
+ (NSString *)parseClassName
{
    return @"User";
}*/

- (PFQuery *)todosQuery
{
    PFQuery *query = [[self class] query];

    
    return query;
}

- (void) setGroups:(PFRelation *)groups
{
    _groups = groups;
}

- (PFRelation *) groups
{
    if(_groups== nil) {
        _groups = [self relationforKey:@"groups"];
    }
    return _groups;
}

- (void) setTasks:(PFRelation *)tasks
{
    _tasks = tasks;
}

- (PFRelation *) tasks
{
    if(_tasks== nil) {
        _tasks = [self relationforKey:@"tasks"];
    }
    return _tasks;
}

@end

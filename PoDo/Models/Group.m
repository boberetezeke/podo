//
//  Group.m
//  PoDo
//
//  Created by Steve Tuckner on 1/14/14.
//  Copyright (c) 2014 Steve Tuckner. All rights reserved.
//

#import "Group.h"
#import <Parse/PFObject+Subclass.h>

@implementation Group

@synthesize users = _users;
@synthesize tasks = _tasks;

+ (NSString *)parseClassName
{
    return @"Group";
}

- (void) setUsers:(PFRelation *)users
{
    _users = users;
}

- (PFRelation *) users
{
    if(_users== nil) {
        _users = [self relationforKey:@"users"];
    }
    return _users;
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

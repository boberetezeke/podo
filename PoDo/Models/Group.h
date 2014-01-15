//
//  Group.h
//  PoDo
//
//  Created by Steve Tuckner on 1/14/14.
//  Copyright (c) 2014 Steve Tuckner. All rights reserved.
//

#import <Parse/Parse.h>

@interface Group : PFObject<PFSubclassing>

@property (retain) NSString *name;
@property (retain) PFRelation *users;
@property (retain) PFRelation *tasks;

@end

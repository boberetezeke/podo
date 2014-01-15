//
//  User.h
//  PoDo
//
//  Created by Steve Tuckner on 1/14/14.
//  Copyright (c) 2014 Steve Tuckner. All rights reserved.
//

#import <Parse/Parse.h>

@interface User : PFUser<PFSubclassing>

@property (retain) PFRelation *groups;
@property (retain) PFRelation *tasks;

- (PFQuery *)todosQuery;

@end

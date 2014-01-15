//
//  TodosViewController.m
//  PoDo
//
//  Created by Steve Tuckner on 1/14/14.
//  Copyright (c) 2014 Steve Tuckner. All rights reserved.
//

#import "TodosViewController.h"
#import "TodoCellView.h"
#import "TaskViewController.h"
#import "User.h"
#import "Task.h"

@interface TodosViewController ()

@end

@implementation TodosViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    if (![User currentUser]) {
        PFLogInViewController *logInController = [[PFLogInViewController alloc] init];
        logInController.delegate = self;
        [self presentViewController:logInController animated:NO completion:^{ }];
    }
    
    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addButtonPressed:)];
    [self.navigationItem setRightBarButtonItems: @[addButton] animated:NO];
}

- (void)addButtonPressed: (id)sender
{
    NSLog(@"add button pressed");
    TaskViewController *taskViewController = [[TaskViewController alloc] init];
    [self presentViewController: taskViewController animated:YES completion:^{}];
}

#pragma mark - PFLogInViewController delegate methods

- (void)logInViewController:(PFLogInViewController *)controller
               didLogInUser:(PFUser *)user {
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}

- (void)logInViewControllerDidCancelLogIn:(PFLogInViewController *)logInController {
    NSLog(@"login failed");
}
                                  
                                  

- (PFQuery *)queryForTable {
    if ([User currentUser]) {
        PFQuery *query = [[[User currentUser] tasks] query];
        
        // If no objects are loaded in memory, we look to the cache first to fill the table
        // and then subsequently do a query against the network.
        if (self.objects.count == 0) {
            query.cachePolicy = kPFCachePolicyCacheThenNetwork;
        }

        return query;
    }
    else
        return nil;
}

- (PFTableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath object:(Task *)task
{
    static NSString *cellIdentifier = @"Cell";
    
    TodoCellView *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell = [[TodoCellView alloc] initWithStyle:UITableViewCellStyleSubtitle
                                      reuseIdentifier:cellIdentifier];
    }
    
    // Configure the cell to show todo item with a priority at the bottom
    cell.textLabel.text = task.headline;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"Priority: %@",
                                 task.priority];
    
    return cell;
    
}

@end

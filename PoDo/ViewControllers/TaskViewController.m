//
//  TaskViewController.m
//  PoDo
//
//  Created by Steve Tuckner on 1/15/14.
//  Copyright (c) 2014 Steve Tuckner. All rights reserved.
//

#import "TaskViewController.h"
#import "User.h"

@interface TaskViewController () {
    UIButton *cancelButton;
    UIButton *saveButton;
    UILabel *headlineLabel;
    UITextField *headlineTextField;
    UILabel *bodyLabel;
    UITextView *bodyTextView;
}

@end

@implementation TaskViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];
    
    cancelButton = [UIButton buttonWithType: UIButtonTypeRoundedRect];
    [cancelButton setTitle:@"Cancel" forState:UIControlStateNormal];
    [cancelButton addTarget:self action:@selector(cancelButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    [cancelButton setTranslatesAutoresizingMaskIntoConstraints:NO];

    saveButton = [UIButton buttonWithType: UIButtonTypeRoundedRect];
    [saveButton setTitle:@"Save" forState:UIControlStateNormal];
    [saveButton addTarget:self action:@selector(saveButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    [saveButton setTranslatesAutoresizingMaskIntoConstraints:NO];

    headlineLabel = [[UILabel alloc] init];
    headlineLabel.text = @"Podo";
    [headlineLabel setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    headlineTextField = [[UITextField alloc] init];
    [headlineTextField setTranslatesAutoresizingMaskIntoConstraints: NO];
    headlineTextField.placeholder = @"What to do";
    headlineTextField.backgroundColor = [UIColor colorWithWhite:0.99 alpha:1.0];
    
    bodyLabel = [[UILabel alloc] init];
    [bodyLabel setTranslatesAutoresizingMaskIntoConstraints:NO];
    bodyLabel.text = @"Notes";
    
    bodyTextView = [[UITextView alloc] init];
    [bodyTextView setTranslatesAutoresizingMaskIntoConstraints: NO];
    //bodyTextView.placeholder = @"Enter notes ...";
    bodyTextView.backgroundColor = [UIColor colorWithWhite:0.99 alpha:1.0];

    [self.view addSubview: cancelButton];
    [self.view addSubview: saveButton];
    [self.view addSubview: headlineLabel];
    [self.view addSubview: headlineTextField];
    [self.view addSubview: bodyLabel];
    [self.view addSubview: bodyTextView];

    NSDictionary *views = NSDictionaryOfVariableBindings(cancelButton, saveButton, headlineLabel, headlineTextField, bodyLabel, bodyTextView);
    
    [self.view addConstraints: [NSLayoutConstraint constraintsWithVisualFormat: @"|-[cancelButton]->=0-[saveButton]-|" options:0 metrics:nil views:views]];
    [self.view addConstraints: [NSLayoutConstraint constraintsWithVisualFormat: @"|-[headlineLabel(50)]-[headlineTextField]-|" options:0 metrics:nil views:views]];
    [self.view addConstraints: [NSLayoutConstraint constraintsWithVisualFormat: @"|-[bodyLabel]-|" options:0 metrics:nil views:views]];
    [self.view addConstraints: [NSLayoutConstraint constraintsWithVisualFormat: @"|-[bodyTextView]-|" options:0 metrics:nil views:views]];
    [self.view addConstraints: [NSLayoutConstraint constraintsWithVisualFormat: @"V:|-[cancelButton(20)]-[headlineLabel(20)]-[bodyLabel(20)]-[bodyTextView]-|" options:0 metrics:nil views:views]];
    [self.view addConstraints: [NSLayoutConstraint constraintsWithVisualFormat: @"V:|-[saveButton(20)]-[headlineTextField]" options:0 metrics:nil views:views]];
}

- (void)cancelButtonPressed: (id)sender
{
    [self dismissViewControllerAnimated:YES completion:^{}];
}

- (void)saveButtonPressed: (id)sender
{
    BOOL newTask = (self.task == nil);
    User *user = [User currentUser];

    if (!self.task)
        self.task = [Task object];
    
    self.task.headline = headlineTextField.text;
    self.task.body = bodyTextView.text;

    [self.task saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (newTask) {
            [user.tasks addObject: self.task];
            [user saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
                [self dismissViewControllerAnimated:YES completion:^{}];
            }];
        }
        else {
            [self dismissViewControllerAnimated:YES completion:^{}];
        }
    }];
}

@end

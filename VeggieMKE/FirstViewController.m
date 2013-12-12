//
//  FirstViewController.m
//  VeggieMKE
//
//  Created by Amanda Langley on 12/11/13.
//  Copyright (c) 2013 AmandaJo. All rights reserved.
//

#import "FirstViewController.h"
#import "LoginViewController.h"
#import <Parse/Parse.h>

@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    
    
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidAppear:(BOOL)animated
{
    //check the parse login
    // if the user is not authenticated, present login controller.
    if (!([PFUser currentUser] && [PFFacebookUtils isLinkedWithUser:[PFUser currentUser]])) {
        LoginViewController *loginVC = (LoginViewController*)[self.storyboard instantiateViewControllerWithIdentifier:@"LoginViewController"];
        [self presentViewController:loginVC animated:YES completion:^{
            // left empty
        }];
    }
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

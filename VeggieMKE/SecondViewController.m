//
//  SecondViewController.m
//  VeggieMKE
//
//  Created by Amanda Langley on 12/11/13.
//  Copyright (c) 2013 AmandaJo. All rights reserved.
//

#import "SecondViewController.h"
#import "LoginViewController.h"
#import <Parse/Parse.h>

@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - helper methods

- (IBAction)pressedLogoutButton:(id)sender {
    // Logout user, this automatically clears the cache
    [PFUser logOut];
    
    [self showLoginViewController];
}

- (void)showLoginViewController
{
    // Return to login view controller
    LoginViewController *loginVC = (LoginViewController*)[self.storyboard instantiateViewControllerWithIdentifier:@"LoginViewController"];
    [self presentViewController:loginVC animated:YES completion:^{
        // left empty
    }];
}

@end

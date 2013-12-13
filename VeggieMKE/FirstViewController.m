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
#import <QuartzCore/QuartzCore.h>
#import "RFQuiltLayout.h"

@interface FirstViewController ()

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (nonatomic) NSMutableArray* numbers;
@end



@implementation FirstViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
	// Do any additional setup after loading the view, typically from a nib.

    [_collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cellIdentifier"];
    
    RFQuiltLayout* layout = (id)[self.collectionView collectionViewLayout];
    layout.direction = UICollectionViewScrollDirectionVertical;
    layout.blockPixels = CGSizeMake(100, 40);
    [self.collectionView reloadData];
}

- (void)viewDidAppear:(BOOL)animated
{
    //check the parse login
    // if the user is not authenticated, present login controller.
    if (!([PFUser currentUser] && [PFFacebookUtils isLinkedWithUser:[PFUser currentUser]])) {
        [self showLoginViewController];
    }
    
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 21;
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier=@"cellIdentifier";
    
    UICollectionViewCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];
    
    UILabel* label = (id)[cell viewWithTag:21];
    if(!label) label=[[UILabel alloc] initWithFrame:CGRectMake(0, 0, cell.frame.size.width, cell.frame.size.height)];
    
    label.backgroundColor=[UIColor blueColor];
    label.tag=21;
    label.textColor=[UIColor whiteColor];
    label.textAlignment=NSTextAlignmentCenter;
    [label setAutoresizingMask:(UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth)];
    [cell.contentView addSubview:label];
    
    label.text=[NSString stringWithFormat:@"Task%li",(long)indexPath.row];
    if (indexPath.row==0) {
        label.text=@"Category";
    }
    
    if (indexPath.row==3) {
        label.text=@"Communication";
    }
    
    if (indexPath.row==8) {
        label.text=@"Meeting";
    }
    
    if (indexPath.row==13) {
        label.text=@"Others";
    }
    
    [cell setAutoresizesSubviews:YES];
    cell.backgroundColor=[UIColor greenColor];
    return cell;
}


- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    UIEdgeInsets insets=UIEdgeInsetsMake(10, 10, 10, 10);
    return insets;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 2;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 2;
}

#pragma mark – RFQuiltLayoutDelegate

- (CGSize) blockSizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (indexPath.row==0)return CGSizeMake(2, 1);
    if (indexPath.row==3) return CGSizeMake(2, 2);
    if (indexPath.row==8) return CGSizeMake(2, 2);
    if (indexPath.row==13) return CGSizeMake(2, 2);
    
    return CGSizeMake(1, 1);
}

- (UIEdgeInsets)insetsForItemAtIndexPath:(NSIndexPath *)indexPath {
    return UIEdgeInsetsMake(2, 2, 2, 2);
}

#pragma mark - helper methods

- (void)showLoginViewController
{
    // Return to login view controller
    LoginViewController *loginVC = (LoginViewController*)[self.storyboard instantiateViewControllerWithIdentifier:@"LoginViewController"];
    [self presentViewController:loginVC animated:YES completion:^{
        // left empty
    }];
}

@end

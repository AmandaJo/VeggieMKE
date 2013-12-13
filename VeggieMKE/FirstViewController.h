//
//  FirstViewController.h
//  VeggieMKE
//
//  Created by Amanda Langley on 12/11/13.
//  Copyright (c) 2013 AmandaJo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RFQuiltLayout.h"

@interface FirstViewController : UIViewController <RFQuiltLayoutDelegate>

@property (nonatomic, strong) NSMutableData *imageData;
//@property (weak, nonatomic) IBOutlet UIImageView *profilePictureView;

@end

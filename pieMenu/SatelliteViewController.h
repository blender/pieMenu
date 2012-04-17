//
//  SatelliteViewController.h
//  pieMenu
//
//  Created by Tommaso Piazza on 3/27/12.
//  Copyright (c) 2012 ChalmersTH. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SatelliteViewController : UIViewController

@property (strong, nonatomic) UIImageView* satelliteImageView;

-(void) glowWithDuration:(NSTimeInterval) duration;

@end

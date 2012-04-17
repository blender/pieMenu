//
//  AppDelegate.h
//  pieMenu
//
//  Created by Tommaso Piazza on 2/16/12.
//  Copyright (c) 2012 ChalmersTH. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyPieMenuController.h"
#import "MSSCommunicationController.h"
#import "SatelliteViewController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>
{
    MyPieMenuController* _pieController;
    SatelliteViewController* _satController;
    MSSCommunicationController *_surfaceComController;
    
}

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) pieMenuViewController* pieController;
@property (strong, nonatomic) MSSCommunicationController* surfaceComController;
@property (strong, nonatomic) SatelliteViewController* satController;

@end


//
//  AppDelegate.m
//  pieMenu
//
//  Created by Tommaso Piazza on 2/16/12.
//  Copyright (c) 2012 ChalmersTH. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

@synthesize window = _window;
@synthesize pieController = _pieController;
@synthesize surfaceComController = _surfaceComController;
@synthesize satController = _satController;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    
    //self.satController = [[SatelliteViewController alloc] init];
    self.pieController = [[MyPieMenuController alloc] initWithSlices:6];
    _pieController.byteValue = 0;
    self.surfaceComController = [MSSCommunicationController sharedController];
    
    _surfaceComController.delegate = _pieController;
    [_surfaceComController connectToHost:@"169.254.59.237" onPort:4568];
    
   
    [NSTimer scheduledTimerWithTimeInterval:0.5 target:(_surfaceComController) selector:@selector(getContacsFromCodeine) userInfo:nil repeats:YES]; 
    
    //[self.satController.view addSubview:self.pieController.view];
    
    [self.window addSubview:self.pieController.view];
    
    [self.window makeKeyAndVisible];
    
    [NSTimer scheduledTimerWithTimeInterval:3 target:self.satController selector:@selector(glowWithDuration:) userInfo:nil repeats:YES];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
     If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
     */
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    /*
     Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
     */
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    /*
     Called when the application is about to terminate.
     Save data if appropriate.
     See also applicationDidEnterBackground:.
     */
}

@end

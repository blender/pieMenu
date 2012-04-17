//
//  SatelliteViewController.m
//  pieMenu
//
//  Created by Tommaso Piazza on 3/27/12.
//  Copyright (c) 2012 ChalmersTH. All rights reserved.
//

#import "SatelliteViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface SatelliteViewController ()

@end

@implementation SatelliteViewController
@synthesize satelliteImageView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (id) init 
{
    self = [super init];
    if(self){
        
        UIImage* image =[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"satelliteImage.png" ofType:nil]];
        satelliteImageView = [[UIImageView alloc] initWithImage:image];
        satelliteImageView.clipsToBounds = NO;
        
        satelliteImageView.layer.shadowColor = [UIColor yellowColor].CGColor;
        satelliteImageView.layer.shadowOffset = CGSizeMake(0, 0);
        satelliteImageView.layer.shadowOpacity = 0;
        satelliteImageView.layer.shadowRadius = 5.0;
    
    }
    
    return self;
}

#pragma mark - View lifecycle


// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView 
{
 
    CGRect rect = [[UIScreen mainScreen] applicationFrame];
    self.view = [[UIView alloc] initWithFrame:rect];
    [self.view addSubview:satelliteImageView];
    
}

-(void) glowWithDuration:(NSTimeInterval) duration{
    
    [UIView animateWithDuration:1.0f
                          delay:0.0f
                        options:UIViewAnimationCurveEaseInOut
                     animations:^{
                         CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"shadowOpacity"];
                         animation.duration = 2.0f;
                         animation.delegate = self;
                         animation.fromValue = [NSNumber numberWithFloat:self.satelliteImageView.layer.shadowOpacity];
                         animation.toValue = [NSNumber numberWithFloat:1-self.satelliteImageView.layer.shadowOpacity];
                         [self.satelliteImageView.layer addAnimation:animation forKey:@"shadowOpacity"];
                     }
                     completion:nil];

}

-(void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag {
    NSString *keyPath = ((CAPropertyAnimation *)anim).keyPath;
    if ([keyPath isEqualToString:@"shadowOpacity"]) {
        NSNumber* opacity = ((CABasicAnimation *)anim).toValue;
        self.satelliteImageView.layer.shadowOpacity = [opacity floatValue];
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return YES;
}

@end

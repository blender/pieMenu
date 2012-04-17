//
//  pieMenuViewController.m
//  pieMenu
//
//  Created by Tommaso Piazza on 2/22/12.
//  Copyright (c) 2012 ChalmersTH. All rights reserved.
//

#import "pieMenuViewController.h"

@implementation pieMenuViewController
@synthesize selectedSlice = _selectedSlice;

- (id) initWithSlices:(int) slices
{

    self = [super init];
    
    if(self){
    
        _slices = slices;
        _selectedSlice = -1;
            
    }
    
    return self;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle


// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView
{
    CGRect rect = [[UIScreen mainScreen] applicationFrame];
    
    CGFloat minDim = (rect.size.width < rect.size.height) ? rect.size.width : rect.size.height;
    
    CGRect circleRect =  CGRectMake(0, 0, minDim, minDim); 
    self.view = [[pieMenuView alloc] initWithFrame:circleRect andSlices:_slices];
}



// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    self.view.center = CGPointMake(screenRect.size.width/2, screenRect.size.height/2); 
}

-(void) selectSlice:(int) sliceNumber{

    pieMenuView* v= (pieMenuView *)self.view;
    NSArray* sliceArray = v.slices;
    pieSliceView* s = [sliceArray objectAtIndex:sliceNumber];
    float hue;
    float sat;
    float bright;
    float alpha;
    
    [s.color getHue:&hue saturation:&sat brightness:&bright alpha:&alpha];
    UIColor* color = [UIColor colorWithHue:hue saturation:1.0 brightness:0.7 alpha:alpha];
    [(pieMenuView *)self.view highlightSlice:sliceNumber withColor:color];
    _selectedSlice = sliceNumber;
    

}

-(void) selectSlice:(int)sliceNumber withColor:(UIColor *) color{

    [(pieMenuView *)self.view highlightSlice:sliceNumber withColor:color];
    _selectedSlice = sliceNumber;

}

-(void) deseletSlice:(int) sliceNumber{

    [(pieMenuView *)self.view dehighlightSlice:sliceNumber];

}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end

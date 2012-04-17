//
//  pieMenuView.m
//  pieMenu
//
//  Created by Tommaso Piazza on 2/16/12.
//  Copyright (c) 2012 ChalmersTH. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import "pieMenuView.h"
#import "utils.h"

@implementation pieMenuView

@synthesize slices = _slices;

- (id)initWithFrame:(CGRect)frame
{
    
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
    }
    
    return self;
}

- (id)initWithFrame:(CGRect)frame andSlices:(int) numSlices
{
    self = [super initWithFrame:frame];
    
    _numSlices = numSlices;
    
    if (self) {
        _degrees = 1.0*(180/slicesPerEmiClicle(numSlices));
        CGFloat sliceHeight = frame.size.height/2 *  sin(degreesToRadians(_degrees));
        _sliceRect = CGRectMake(0, frame.size.height/2-sliceHeight, frame.size.width/2, sliceHeight);
        _slices = [NSMutableArray arrayWithCapacity:numSlices];
        
        for(int i  = 0; i < numSlices; i++){
            pieSliceView* slice = [pieSliceView sliceWithFrame:_sliceRect angle:_degrees];
            slice.tag = i+1;
            slice.color = [UIColor colorWithHue:_degrees*i/360 saturation:1.0 brightness:0.5 alpha:1.0];
            [_slices addObject:slice];
            [self addSubview:[_slices objectAtIndex:i]];
            CGAffineTransform toCenter = CGAffineTransformMakeTranslation(_sliceRect.size.width/2, _sliceRect.size.height/2);
            CGAffineTransform rot = CGAffineTransformMakeRotation(degreesToRadians(_degrees*i));
            
            CGAffineTransform comb = CGAffineTransformConcat(rot, toCenter);
            CGAffineTransform backToOrigin = CGAffineTransformMakeTranslation(-_sliceRect.size.width/2, -_sliceRect.size.height/2);
            CGAffineTransform comb2 = CGAffineTransformConcat(backToOrigin, comb );
            UIView* view = [_slices objectAtIndex:i];
            view.transform=comb2;

        }
    }
    
    return self;
}

- (void) highlightSlice:(int) sliceNumber withColor:(UIColor *) color{

    if(sliceNumber >= 0 && sliceNumber < _numSlices){
    
        pieSliceView* slice = [_slices objectAtIndex:sliceNumber];
        [slice changeColor:color];
    }

}

- (void) dehighlightSlice:(int) sliceNumber{

    if(sliceNumber >= 0 && sliceNumber < _numSlices){
        float hue;
        float sat;
        float bright;
        float alpha;
        
        pieSliceView* slice = [_slices objectAtIndex:sliceNumber];
        [slice.color getHue:&hue saturation:&sat brightness:&bright alpha:&alpha];
        UIColor* color = [UIColor colorWithHue:hue saturation:1.0 brightness:0.5 alpha:alpha];
        [slice changeColor:color];
    }

}

     
- (UIBezierPath *) pathFrom:(CGPoint) start to:(CGPoint) end
{
    UIBezierPath*    aPath = [UIBezierPath bezierPath];
    aPath.lineWidth = 5;
    [aPath moveToPoint:start];
    [aPath addLineToPoint:end];
    [aPath closePath];
    

    return aPath;
}
     

@end

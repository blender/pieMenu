//
//  ContactDescriptor.h
//  pieMenu
//
//  Copyright (c) 2012 Tommaso Piazza <tommaso.piazza@gmail.com>
//
//  This file is part of MSSurfaceCom software library.
//
//  MSSurfaceCom software library is free software: you can redistribute it and/or modify
//  it under the terms of the GNU Lesser General Public License as published by
//  the Free Software Foundation, either version 3 of the License, or
//  (at your option) any later version.
//
//  MSSurfaceCom software library is distributed in the hope that it will be useful,
//  but WITHOUT ANY WARRANTY; without even the implied warranty of
//  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//  GNU General Public License for more details.
//
//  You should have received a copy of the GNU Lesser General Public License
//  along with MSSurfaceCom software library.  If not, see <http://www.gnu.org/licenses/>.

#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h> //For CGPoint

#define MSSC_degreesToRadians(x) (M_PI * x / 180.0)
#define MSSC_radiansToDegrees(x) (x * (180.0 / M_PI))

@interface MSSCContactDescriptor : NSObject
{
    unsigned char _byteValue;

    int _positionX;
    int _positionY;
    float _orientation;
    
}

@property (atomic) unsigned char byteValue;
@property (atomic) int positionX;
@property (atomic) int positionY;
@property (atomic) float orientation;



+(MSSCContactDescriptor *) descriptorWithByteValue:(unsigned char) byteValue 
                                         positionX:(int) posX 
                                         positionY:(int)posY 
                                       orientation:(float) angle;
+(MSSCContactDescriptor *) descriptorFromData:(NSData *) data;
+(int) size;
+(float) distanceFromDescriptor:(MSSCContactDescriptor*) a toDescriptor:(MSSCContactDescriptor *) b;
+(CGPoint) positionOfDescriptor:(MSSCContactDescriptor *) desc relativeToDescriptor:(MSSCContactDescriptor *) origin;
+(float) orientationOfDescriptor:(MSSCContactDescriptor *) desc relativeToDescriptor:(MSSCContactDescriptor *) origin;
+(float) dotProd:(CGPoint)v1 v2:(CGPoint) v2;

-(MSSCContactDescriptor *) initWithByteValue:(unsigned char) byteValue positionX:(int) posX positionY:(int)posY orientation:(float) angle;
-(NSData *) data;

@end


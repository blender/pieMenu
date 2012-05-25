//
//  PackedContacDescriptors.h
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
#import "MSSCContactDescriptor.h"

@interface PackedContacDescriptors : NSObject
{
    unsigned char _count;
    NSArray* _contacs;
}

@property (nonatomic, readonly) unsigned char count;
@property (nonatomic, strong) NSArray* contacs;

-(PackedContacDescriptors *) initWithCDArray:(NSArray *) contacDescriptorsArray;
+(PackedContacDescriptors *) packedContactDescriptorsWithCDArray:(NSArray *) contacDescriptorsArray;
+(PackedContacDescriptors *) packedContactDescriptorsFromData:(NSData *) data;
-(NSData *) data;
-(int) size;

@end

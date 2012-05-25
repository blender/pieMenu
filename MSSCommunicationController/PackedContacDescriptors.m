//
//  PackedContacDescriptors.m
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

#import "PackedContacDescriptors.h"

@implementation PackedContacDescriptors
@synthesize count = _count;
@synthesize contacs = _contacs;

-(PackedContacDescriptors *) initWithCDArray:(NSArray *)contacDescriptorsArray
{

    self = [super init];
    
    if (self) {
        
        self.contacs = contacDescriptorsArray;
        _count = self.contacs.count;
    }
    
    return self;
}

+(PackedContacDescriptors *) packedContactDescriptorsWithCDArray:(NSArray *)contacDescriptorsArray
{

    return [[PackedContacDescriptors alloc] initWithCDArray:contacDescriptorsArray];

}

+(PackedContacDescriptors *) packedContactDescriptorsFromData:(NSData *)data
{

    const unsigned char* bytes = [data bytes];
    
    unsigned char count = bytes[0];
    
    NSMutableArray* devices = [NSMutableArray arrayWithCapacity:count];
    
    int pos = 1;
    int length = sizeof(unsigned char)+3*(sizeof(int));
    for(int i = 0; i < count; i++){
        
        NSData* data = [NSData dataWithBytes:&(bytes[pos]) length:length];
        [devices insertObject:[MSSCContactDescriptor descriptorFromData:data]  atIndex:i];
        pos = pos + length;
        
    }
    
    return [PackedContacDescriptors packedContactDescriptorsWithCDArray:devices];

}

-(NSData *) data
{

    unsigned char bytes[1];
    bytes[0] = self.count;
    
    NSMutableData* data = [NSData dataWithBytes:&(bytes[0]) length:sizeof(unsigned char)];
    
    for(int i = 0; i < self.count; i ++){
    
        MSSCContactDescriptor* cd = [_contacs objectAtIndex:i];
        
        [data appendData:[cd data]];
    
    }
    
    return data;
    
}

-(int) size
{
    
    return ((self.count*[MSSCContactDescriptor size]) + 1);

}

@end

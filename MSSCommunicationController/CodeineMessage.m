//
//  CodeineMessage.m
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

#import "CodeineMessage.h"

@implementation CodeineMessage

@synthesize msgType = _msgType;
@synthesize subType = _subType;


-(CodeineMessage *) initWithType:(_t_CMSG) msgType andSubType:(unsigned char) subType
{

    self = [super init];
    if(self){
        
        self.msgType = msgType;
        self.subType = subType;
    }
    
    return self;
}

+(CodeineMessage *) messageFromData:(NSData*) data
{

    const unsigned char* bytes = [data bytes];

    _t_CMSG msgType = bytes[0];
    unsigned char subType = bytes[1];
    
    return [[CodeineMessage alloc] initWithType:msgType andSubType:subType];
}

-(NSData *) data
{

    unsigned char bytes[2];
    
    bytes[0] = self.msgType;
    bytes[1] = self.subType;
    
    NSData* data = [NSData dataWithBytes:bytes length:2*sizeof(unsigned char)];
    
    return data;
}


@end

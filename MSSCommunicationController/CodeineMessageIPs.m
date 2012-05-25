//
//  CodeineMessageIPs.m
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

#import "CodeineMessageIPs.h"

@implementation CodeineMessageIPs

@synthesize pdi = _pdi;

-(id) initMessageOfTypeGet
{
    
    self = [super initWithType:kMSGIPs andSubType:kMSGGetIPs];
    
    if(self){
        
        _pdi = nil;
    }
    
    return self;
    
}

-(id) initMessageOfTypeSetWithPDI:(PackedDeviceInformations *) pdi
{
    
    
    self = [super initWithType:kMSGIPs andSubType:kMSGSetIPs];
    if(self){
        
        _pdi = pdi; 
    }
    
    return  self;
}

+(CodeineMessageIPs *) messageOfTypeGet
{
    
    return [[CodeineMessageIPs alloc] initMessageOfTypeGet];
}

+(CodeineMessageIPs *) messageOfTypeSetWithPDI:(PackedDeviceInformations *) pdi
{
    
    return [[CodeineMessageIPs alloc] initMessageOfTypeSetWithPDI:pdi];
}

+(CodeineMessageIPs *) messageFromData:(NSData *)data
{
    
    CodeineMessageIPs* cmIPs;
    
    const unsigned char* bytes = [data bytes];
    
    if(bytes[1] == kMSGGetIPs){
    
        cmIPs = [CodeineMessageIPs messageOfTypeGet];
    }
    else if(bytes[1] == kMSGSetIPs){
        
        int pos = 2*sizeof(unsigned char);
        NSData* pdiData = [NSData dataWithBytes:&(bytes[pos]) length:data.length];
        
        PackedDeviceInformations* pdi = [PackedDeviceInformations packedDeviceInformationsFromData:pdiData];
        cmIPs = [CodeineMessageIPs messageOfTypeSetWithPDI:pdi];
    }
    
    return cmIPs;
    
}

-(NSData *) data
{
    
    NSMutableData* data = [NSMutableData data];
    [data appendData:[super data]];
    
    if(self.subType == kMSGGetIPs)
    /* Do nothing */ ;
    else 
        if(self.subType == kMSGSetIPs){
            
            [data appendData:[self.pdi data]];
        } 
    
    return data;
    
}

@end

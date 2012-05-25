//
//  PackedDeviceInformations.m
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

#import "PackedDeviceInformations.h"

@implementation PackedDeviceInformations

@synthesize devices = _devices;
@synthesize count = _count;

-(PackedDeviceInformations *) initWithDIArray:(NSArray *)devices
{

    self = [super init];
    
    if(self){
    
        self.devices = devices;
        _count = (unsigned char) devices.count;
    }
    
    return self;

}

+(PackedDeviceInformations *) packedDeviceInformationsWithDIArray:(NSArray *)devices
{

    return [[PackedDeviceInformations alloc] initWithDIArray:devices];

}

+(PackedDeviceInformations *) packedDeviceInformationsFromData:(NSData *) data
{
    
    unsigned char* bytes =(unsigned char*) [data bytes];
    
    unsigned char count = bytes[0];
    
    NSMutableArray* devices = [NSMutableArray arrayWithCapacity:count];
    
    int ipStrLen_pos = 2;
    unsigned char ipStrLen = 0;
    
    
    for(int i  = 0; i < count; i++){
        
        int startPos = ipStrLen_pos - 1;
    
        ipStrLen = bytes[ipStrLen_pos];
        
        int endPos = ipStrLen_pos + ipStrLen;
        
        NSData* data = [NSData dataWithBytes:&(bytes[startPos]) length:ipStrLen+2];
        
        [devices insertObject:[DeviceInformation deviceInfoFromData:data] atIndex:i];
        
        ipStrLen_pos = endPos + 2;
    
    }
    
    PackedDeviceInformations* pdi = [PackedDeviceInformations packedDeviceInformationsWithDIArray:devices];
    
    return pdi;
}

-(NSData *) data
{
    
    unsigned char bytes[1];
    bytes[0] = self.count;
    NSMutableData* data = [NSMutableData dataWithBytes:&bytes length:1];

    for(int i = 0; i < self.count; i++){
    
        DeviceInformation *di = [self.devices objectAtIndex:i];
        [data appendData:[di data]];
    
    }
    
    return data;

}

@end

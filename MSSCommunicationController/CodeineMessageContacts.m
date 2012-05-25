//
//  CodeineContactsMessage.m
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

#import "CodeineMessageContacts.h"

@implementation CodeineMessageContacts
@synthesize pcd = _pcd;

-(id) initMessageOfTypeGet
{

    self = [super initWithType:kMSGContacts andSubType:kMSGGetContacts];
    
    if(self){
    
        _pcd = nil;
    }
    
    return self;

}

-(id) initMessageOfTypeSetWithPCD:(PackedContacDescriptors *)pcd
{


    self = [super initWithType:kMSGContacts andSubType:kMSGSetContacts];
    if(self){
    
        _pcd = pcd; 
    }

    return  self;
}

+(CodeineMessageContacts *) messageOfTypeGet
{

    return [[CodeineMessageContacts alloc] initMessageOfTypeGet];
}

+(CodeineMessageContacts *) messageOfTypeSetWithPCD:(PackedContacDescriptors *)pcd
{

    return [[CodeineMessageContacts alloc] initMessageOfTypeSetWithPCD:pcd];
}

+(CodeineMessageContacts *) messageFromData:(NSData *)data
{

    CodeineMessageContacts* cmC;
    
    const unsigned char* bytes = [data bytes];
    
    if(bytes[1] == kMSGGetContacts){
    
        cmC = [CodeineMessageContacts messageOfTypeGet];
    }
    else if(bytes[1] == kMSGSetContacts){
        

        int pos = 2*sizeof(unsigned char);
        NSData* pcdData = [NSData dataWithBytes:&(bytes[pos]) length:data.length];
        
        PackedContacDescriptors* pcd = [PackedContacDescriptors packedContactDescriptorsFromData:pcdData];
        cmC = [CodeineMessageContacts messageOfTypeSetWithPCD:pcd];
    
    }
    return cmC;
    
}

-(NSData *) data
{

    NSMutableData* data = [NSMutableData data];
     [data appendData:[super data]];
    
    if(self.subType == kMSGGetContacts)
        /* Do nothing */ ;
    else 
        if(self.subType == kMSGSetContacts){
        
            [data appendData:[self.pcd data]];
        } 
        
    return data;
    
}


@end

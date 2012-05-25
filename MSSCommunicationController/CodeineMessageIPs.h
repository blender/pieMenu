//
//  CodeineMessageIPs.h
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
#import "PackedDeviceInformations.h"

@interface CodeineMessageIPs : CodeineMessage
{
    PackedDeviceInformations* _pdi;
}

@property (nonatomic, strong) PackedDeviceInformations* pdi;

+(CodeineMessageIPs *) messageOfTypeGet;
+(CodeineMessageIPs *) messageOfTypeSetWithPDI:(PackedDeviceInformations *) pdi;
+(CodeineMessageIPs *) messageFromData:(NSData *) data;
-(id) initMessageOfTypeGet;
-(id) initMessageOfTypeSetWithPDI:(PackedDeviceInformations *) pdi;
-(NSData*) data;

@end

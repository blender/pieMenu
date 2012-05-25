//
//  MSSCommunicationController.h
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
#import "GCDAsyncUdpSocket.h"
#import "CodeineMessageContacts.h"
#import "CodeineMessageIPs.h"


@protocol MSSCommunicationProtocol <NSObject>

@required

-(void) newContacs:(NSDictionary *) contacDictionary;

@optional

-(void) newIPs:(NSDictionary *) ipDictionary;

@end


@interface MSSCommunicationController : NSObject <GCDAsyncUdpSocketDelegate>
{
    
    GCDAsyncUdpSocket *udpSocket;
    NSMutableDictionary *_contacDescriptorsDictionaty;
    NSMutableDictionary *_deviceInformationsDictionary;
    __weak id <MSSCommunicationProtocol> _delegate;
    
}

@property (strong, atomic) NSMutableDictionary* contactDictionary;
@property (strong, atomic) NSMutableDictionary* deviceDictionary;
@property (weak, nonatomic) id <MSSCommunicationProtocol> delegate;

+(id)sharedController;
+ (NSString *) deviceIp;
-(MSSCommunicationController *) init;
-(void) hasContactData:(PackedContacDescriptors *) pcd;
-(void) hasIPData:(PackedDeviceInformations *) pdi;
-(void) connectToHost:(NSString *)host onPort:(uint16_t) port;
-(void) sendData:(NSData *) data;
-(void) getContacsFromCodeine;
-(void) getDevicesFromCodeine;
-(void) setDeviceToCodeine:(DeviceInformation *) thisDeviceInformation;

@end

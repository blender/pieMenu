//
//  MSSCommunicationController.h
//  pieMenu
//
//  Created by Tommaso Piazza on 2/23/12.
//  Copyright (c) 2012 ChalmersTH. All rights reserved.
//

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
    __weak id <MSSCommunicationProtocol> _delegate;
    
}

@property (strong, atomic) NSMutableDictionary* contactDictionary;
@property (weak, nonatomic) id <MSSCommunicationProtocol> delegate;

+(id)sharedController;
+(NSString *) deviceIP;
-(MSSCommunicationController *) init;
-(void) hasContactData:(PackedContactDescriptors *) pcd;
-(void) hasIPData:(PackedDeviceInformations *) pdi;
-(void) connectToHost:(NSString *)host onPort:(uint16_t) port;
-(void) sendData:(NSData *) data;
-(void) getContacsFromCodeineServer;
-(void) setIpToCodeineServer;

@end

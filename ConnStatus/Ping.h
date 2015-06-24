//
//  Ping.h
//  ConnStatus
//
//  Created by Alex Nichol on 6/23/15.
//  Copyright (c) 2015 Alex Nichol. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol PingDelegate

- (void)pingSucceeded;
- (void)pingTimeout;

@end

@interface Ping : NSObject

@property (nonatomic, weak) NSObject<PingDelegate> * delegate;

@end

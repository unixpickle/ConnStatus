//
//  AppDelegate.h
//  ConnStatus
//
//  Created by Alex Nichol on 6/23/15.
//  Copyright (c) 2015 Alex Nichol. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "StatusBarItem.h"
#import "Ping.h"

@interface AppDelegate : NSObject <NSApplicationDelegate, PingDelegate> {
  StatusBarItem * statusBarItem;
  NSDate * lastSuccess;
}

@end


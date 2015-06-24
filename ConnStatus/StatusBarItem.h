//
//  StatusBarItem.h
//  ConnStatus
//
//  Created by Alex Nichol on 6/23/15.
//  Copyright (c) 2015 Alex Nichol. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface StatusBarItem : NSObject {
  NSStatusItem * statusItem;
  NSMenuItem * menuItem;
}

- (void)setHappy:(BOOL)happy;

@end

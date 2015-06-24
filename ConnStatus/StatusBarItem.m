//
//  StatusBarItem.m
//  ConnStatus
//
//  Created by Alex Nichol on 6/23/15.
//  Copyright (c) 2015 Alex Nichol. All rights reserved.
//

#import "StatusBarItem.h"

@implementation StatusBarItem

- (id)init {
  if ((self = [super init])) {
    NSMenu * menu = [[NSMenu alloc] init];
    menuItem = [[NSMenuItem alloc] initWithTitle:@"Never connected"
                                                   action:0 keyEquivalent:@""];
    NSMenuItem * quit = [[NSMenuItem alloc] initWithTitle:@"Quit"
                                                   action:@selector(terminate:)
                                            keyEquivalent:@""];
    [menu addItem:menuItem];
    [menu addItem:quit];
    
    statusItem = [[NSStatusBar systemStatusBar]
                  statusItemWithLength:NSVariableStatusItemLength];
    [statusItem setMenu:menu];
    [statusItem setImage:[NSImage imageNamed:@"smile"]];
    [statusItem setHighlightMode:YES];
  }
  return self;
}

- (void)setHappy:(BOOL)happy lastConnected:(NSDate *)date {
  // TODO: this
}

@end

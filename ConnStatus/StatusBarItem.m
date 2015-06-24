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
    [statusItem setImage:[NSImage imageNamed:@"frown"]];
    [statusItem setHighlightMode:YES];
  }
  return self;
}

- (void)setHappy:(BOOL)happy {
  if (happy) {
    [statusItem setImage:[NSImage imageNamed:@"smile"]];
  } else {
    [statusItem setImage:[NSImage imageNamed:@"frown"]];
  }
  if (happy) {
    [menuItem setTitle:[NSString stringWithFormat:@"Last ping was %@",
                        [NSDate date]]];
  }
}

@end

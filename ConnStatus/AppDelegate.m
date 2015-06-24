//
//  AppDelegate.m
//  ConnStatus
//
//  Created by Alex Nichol on 6/23/15.
//  Copyright (c) 2015 Alex Nichol. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@property (weak) IBOutlet NSWindow * window;

@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
  statusBarItem = [[StatusBarItem alloc] init];
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
  // Insert code here to tear down your application
}

@end

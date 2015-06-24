//
//  Ping.m
//  ConnStatus
//
//  Created by Alex Nichol on 6/23/15.
//  Copyright (c) 2015 Alex Nichol. All rights reserved.
//

#import "Ping.h"

@interface Ping ()

- (void)backgroundThread;
- (void)sendDelegateStatus:(BOOL)success;

@end

@implementation Ping

- (id)init {
  if ((self = [super init])) {
    NSThread * thread = [[NSThread alloc] initWithTarget:self
                                                selector:@selector(backgroundThread)
                                                  object:nil];
    [thread start];
  }
  return self;
}

- (void)backgroundThread {
  while (true) {
    @autoreleasepool {
      NSPipe * pipe = [[NSPipe alloc] init];
      NSTask * task = [[NSTask alloc] init];
      [task setLaunchPath:@"/sbin/ping"];
      [task setArguments:@[@"/sbin/ping", @"-t 1", @"google.com"]];
      [task setStandardOutput:pipe];
      [task launch];
      [task waitUntilExit];
      NSData * data = [[pipe fileHandleForReading] readDataToEndOfFile];
      if (!data) {
        continue;
      }
      NSString * str = [[NSString alloc] initWithUTF8String:[data bytes]];
      if ([str rangeOfString:@" 0.0% packet loss"].location == NSNotFound) {
        [self sendDelegateStatus:NO];
      } else {
        [self sendDelegateStatus:YES];
      }
    }
  }
}

- (void)sendDelegateStatus:(BOOL)success {
  dispatch_sync(dispatch_get_main_queue(), ^{
    if (success) {
      [self.delegate pingSucceeded];
    } else {
      [self.delegate pingTimeout];
    }
  });
}

@end

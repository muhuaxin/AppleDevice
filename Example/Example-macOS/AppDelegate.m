//
//  AppDelegate.m
//  Example-macOS
//
//  Created by muhuaxin on 2019/1/31.
//  Copyright © 2019 muhuaxin. All rights reserved.
//

#import "AppDelegate.h"
#import <AppleDevice/AppleDevice.h>

@interface AppDelegate ()

@property (weak) IBOutlet NSWindow *window;
@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    NSLog(@"%@", [AppleDevice currentDevice].deviceModel);
    NSLog(@"%@", [AppleDevice currentDevice].deviceModelName);
}


- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}


@end

//
//  InterfaceController.m
//  Example-watchOS Extension
//
//  Created by muhuaxin on 2019/1/31.
//  Copyright © 2019 muhuaxin. All rights reserved.
//

#import "InterfaceController.h"

@interface InterfaceController ()

@end


@implementation InterfaceController

- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];

    // Configure interface objects here.
}

- (void)willActivate {
    // This method is called when watch view controller is about to be visible to user
    [super willActivate];
}

- (void)didDeactivate {
    // This method is called when watch view controller is no longer visible
    [super didDeactivate];
}

@end




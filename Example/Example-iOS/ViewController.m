//
//  ViewController.m
//  Example
//
//  Created by muhuaxin on 2019/1/25.
//  Copyright © 2019 muhuaxin. All rights reserved.
//

#import "ViewController.h"
#import <AppleDevice/AppleDevice.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSLog(@"%@", [AppleDevice currentDevice].deviceModel);
    NSLog(@"%@", [AppleDevice currentDevice].deviceModelName);
}


@end

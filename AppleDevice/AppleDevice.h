//
//  AppleDevice.h
//  AppleDevice
//
//  Created by muhuaxin on 2019/1/25.
//  Copyright © 2019 muhuaxin. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface AppleDevice : NSObject

+ (instancetype)currentDevice;

/**
 iPhone11,1 / MacBookPro15,1 / AppleTV2,1
 */
@property (nonatomic, strong, readonly, nullable) NSString *deviceModel;

/**
 iPhone 7 Plus / MacBook Pro (15-inch, 2018) / AppleTV 2
 */
@property (nonatomic, strong, readonly, nullable) NSString *deviceModelName;


@property (nonatomic, assign, readonly, getter=isSimulator) BOOL simulator;

@end

NS_ASSUME_NONNULL_END

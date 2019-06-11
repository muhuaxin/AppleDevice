//
//  AppleDevice.m
//  AppleDevice
//
//  Created by muhuaxin on 2019/1/25.
//  Copyright © 2019 muhuaxin. All rights reserved.
//

#import "AppleDevice.h"

#if TARGET_OS_IOS || TARGET_OS_TV || TARGET_OS_WATCH
#include <sys/utsname.h>
#elif TARGET_OS_MAC
#include <sys/sysctl.h>
#endif

@interface AppleDevice()

@property (nonatomic, strong) NSString *deviceModel;
@property (nonatomic, strong) NSString *deviceModelName;

@end

@implementation AppleDevice

+ (instancetype)currentDevice {
    static AppleDevice *_currentDevice;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _currentDevice = [[self alloc] init];
    });
    return _currentDevice;
}

- (NSString *)deviceModel {

    if (_deviceModel == nil) {
#if TARGET_OS_IOS || TARGET_OS_TV || TARGET_OS_WATCH
        struct utsname systemInfo;
        uname(&systemInfo);
        NSString *deviceModel = [NSString stringWithCString:systemInfo.machine encoding:NSUTF8StringEncoding];
        _deviceModel = deviceModel;
#elif TARGET_OS_MAC
        size_t size = 0;
        sysctlbyname("hw.model", NULL, &size, NULL, 0);
        if (size > 0) {
            char model[size];
            sysctlbyname("hw.model", model, &size, NULL, 0);
            NSString *deviceModel = [NSString stringWithCString:model encoding:NSUTF8StringEncoding];
            _deviceModel = deviceModel;
        }
#endif
    }
    return _deviceModel;
}

- (NSString *)deviceModelName {
    if (_deviceModelName == nil) {
        NSString *deviceModel = self.deviceModel;
        NSDictionary *dict = nil;
#if TARGET_OS_IOS || TARGET_OS_TV || TARGET_OS_WATCH
        if ([deviceModel hasPrefix:@"iPhone"]) {
            dict = @{
                     @"iPhone1,1": @"iPhone",
                     @"iPhone1,2": @"iPhone 3G",
                     @"iPhone2,1": @"iPhone 3GS",
                     @"iPhone3,1": @"iPhone 4",
                     @"iPhone3,3": @"iPhone 4",
                     @"iPhone4,1": @"iPhone 4S",
                     @"iPhone5,1": @"iPhone 5",
                     @"iPhone5,2": @"iPhone 5",
                     @"iPhone5,3": @"iPhone 5C",
                     @"iPhone5,4": @"iPhone 5C",
                     @"iPhone6,1": @"iPhone 5S",
                     @"iPhone6,2": @"iPhone 5S",
                     @"iPhone7,2": @"iPhone 6",
                     @"iPhone7,1": @"iPhone 6 Plus",
                     @"iPhone8,1": @"iPhone 6S",
                     @"iPhone8,2": @"iPhone 6S Plus",
                     @"iPhone8,4": @"iPhone SE",
                     @"iPhone9,1": @"iPhone 7",
                     @"iPhone9,2": @"iPhone 7 Plus",
                     @"iPhone9,3": @"iPhone 7",
                     @"iPhone9,4": @"iPhone 7 Plus",
                     @"iPhone10,1": @"iPhone 8",
                     @"iPhone10,4": @"iPhone 8",
                     @"iPhone10,2": @"iPhone 8 Plus",
                     @"iPhone10,5": @"iPhone 8 Plus",
                     @"iPhone10,3": @"iPhone X",
                     @"iPhone10,6": @"iPhone X",
                     @"iPhone11,2": @"iPhone XS",
                     @"iPhone11,4": @"iPhone XS Max",
                     @"iPhone11,6": @"iPhone XS Max",
                     @"iPhone11,8": @"iPhone XR",
                     };
        } else if ([deviceModel hasPrefix:@"iPad"]) {
            dict = @{
                     @"iPad1,1": @"iPad 1",
                     @"iPad1,2": @"iPad 3G",
                     @"iPad2,1": @"iPad 2",
                     @"iPad2,2": @"iPad 2",
                     @"iPad2,3": @"iPad 2",
                     @"iPad2,4": @"iPad 2",
                     @"iPad2,5": @"iPad Mini",
                     @"iPad2,6": @"iPad Mini",
                     @"iPad2,7": @"iPad Mini",
                     @"iPad3,1": @"iPad 3",
                     @"iPad3,2": @"iPad 3",
                     @"iPad3,3": @"iPad 3",
                     @"iPad3,4": @"iPad 4",
                     @"iPad3,5": @"iPad 4",
                     @"iPad3,6": @"iPad 4",
                     @"iPad4,1": @"iPad Air",
                     @"iPad4,2": @"iPad Air",
                     @"iPad4,4": @"iPad Mini 2",
                     @"iPad4,5": @"iPad Mini 2",
                     @"iPad4,7": @"iPad Mini 3",
                     @"iPad4,8": @"iPad Mini 3",
                     @"iPad4,9": @"iPad Mini 3",
                     @"iPad5,1": @"iPad Mini 4",
                     @"iPad5,2": @"iPad Mini 4",
                     @"iPad5,3": @"iPad Air 2",
                     @"iPad5,4": @"iPad Air 2",
                     @"iPad6,3": @"iPad Pro 9.7inch",
                     @"iPad6,4": @"iPad Pro 9.7inch",
                     @"iPad6,7": @"iPad Pro 12.9inch",
                     @"iPad6,8": @"iPad Pro 12.9inch",
                     @"iPad6,11": @"iPad 5",
                     @"iPad6,12": @"iPad 5",
                     @"iPad7,1": @"iPad Pro 12.9inch 2G",
                     @"iPad7,2": @"iPad Pro 12.9inch 2G",
                     @"iPad7,3": @"iPad Pro 10.5inch",
                     @"iPad7,4": @"iPad Pro 10.5inch",
                     @"iPad7,5": @"iPad 6",
                     @"iPad7,6": @"iPad 6",
                     @"iPad8,1": @"iPad Pro 11inch",
                     @"iPad8,2": @"iPad Pro 11inch",
                     @"iPad8,3": @"iPad Pro 11inch",
                     @"iPad8,4": @"iPad Pro 11inch",
                     @"iPad8,5": @"iPad Pro 12.9inch 3G",
                     @"iPad8,6": @"iPad Pro 12.9inch 3G",
                     @"iPad8,7": @"iPad Pro 12.9inch 3G",
                     @"iPad8,8": @"iPad Pro 12.9inch 3G",
                     @"iPad11,1": @"iPad Mini 5",
                     @"iPad11,2": @"iPad Mini 5",
                     @"iPad11,3": @"iPad Air 3",
                     @"iPad11,4": @"iPad Air 3",
                     };
        } else if ([deviceModel hasPrefix:@"iPod"]) {
            dict = @{
                     @"iPod1,1": @"iPod Touch 1G",
                     @"iPod2,1": @"iPod Touch 2G",
                     @"iPod3,1": @"iPod Touch 3G",
                     @"iPod4,1": @"iPod Touch 4G",
                     @"iPod5,1": @"iPod Touch 5G",
                     @"iPod7,1": @"iPod Touch 6G",
                     @"iPod9,1": @"iPod Touch 7G",
                     };
        } else if ([deviceModel hasPrefix:@"AppleTV"]) {
            dict = @{
                     @"AppleTV2,1": @"AppleTV 2",
                     @"AppleTV3,1": @"AppleTV 3",
                     @"AppleTV3,2": @"AppleTV 3",
                     @"AppleTV5,3": @"AppleTV 4",
                     @"AppleTV6,2": @"AppleTV 4K",
                     };
        } else if ([deviceModel hasPrefix:@"Watch"]) {
            dict = @{
                     @"Watch1,1": @"Apple Watch (38 mm)",
                     @"Watch1,2": @"Apple Watch (42 mm)",
                     @"Watch2,6": @"Apple Watch Series 1 (38 mm)",
                     @"Watch2,7": @"Apple Watch Series 1 (42 mm)",
                     @"Watch2,3": @"Apple Watch Series 2 (38 mm)",
                     @"Watch2,4": @"Apple Watch Series 2 (42 mm)",
                     @"Watch3,1": @"Apple Watch Series 3 (38 mm)",
                     @"Watch3,2": @"Apple Watch Series 3 (42 mm)",
                     @"Watch3,3": @"Apple Watch Series 3 (38 mm)",
                     @"Watch3,4": @"Apple Watch Series 3 (42 mm)",
                     @"Watch4,1": @"Apple Watch Series 4 (40 mm)",
                     @"Watch4,2": @"Apple Watch Series 4 (44 mm)",
                     @"Watch4,3": @"Apple Watch Series 4 (40 mm)",
                     @"Watch4,4": @"Apple Watch Series 4 (44 mm)",
                     };
        } else if ([deviceModel isEqualToString:@"i386"] || [deviceModel isEqualToString:@"x86_64"]){
            dict = @{
                     @"i386": @"i386",
                     @"x86_64": @"x86_64",
                     };
        }
        
#elif TARGET_OS_MAC
        
        if ([deviceModel hasPrefix:@"MacBookPro"]) {
            dict = @{
                     @"MacBookPro4,1": @"MacBook Pro (15-inch / 17-inch, Early 2008)",
                     @"MacBookPro5,1": @"MacBook Pro (15-inch, Late 2008)",
                     @"MacBookPro5,2": @"MacBook Pro (17-inch, Early 2009)",
                     @"MacBookPro5,3": @"MacBook Pro (15-inch, Mid 2009)",
                     @"MacBookPro5,5": @"MacBook Pro (13-inch, Mid 2009)",
                     @"MacBookPro6,1": @"MacBook Pro (17-inch, Mid 2010)",
                     @"MacBookPro6,2": @"MacBook Pro (15-inch, Mid 2010)",
                     @"MacBookPro7,1": @"MacBook Pro (13-inch, Mid 2010)",
                     @"MacBookPro8,1": @"MacBook Pro (13-inch, 2011)",
                     @"MacBookPro8,2": @"MacBook Pro (15-inch, 2011)",
                     @"MacBookPro8,3": @"MacBook Pro (17-inch, 2011)",
                     @"MacBookPro9,1": @"MacBook Pro (15-inch, Mid 2012)",
                     @"MacBookPro9,2": @"MacBook Pro (13-inch, Mid 2012)",
                     @"MacBookPro10,1": @"MacBook Pro (Retina, 15-inch, Mid 2012 / Early 2013)",
                     @"MacBookPro10,2": @"MacBook Pro (Retina, 13-inch, Late 2012 / Early 2013)",
                     @"MacBookPro11,1": @"MacBook Pro (Retina, 13-inch, Late 2013 / Mid 2014)",
                     @"MacBookPro11,2": @"MacBook Pro (Retina, 15-inch, Late 2013 / Mid 2014)",
                     @"MacBookPro11,3": @"MacBook Pro (Retina, 15-inch, Late 2013 / Mid 2014)",
                     @"MacBookPro11,4": @"MacBook Pro (Retina, 15-inch, Mid 2015)",
                     @"MacBookPro11,5": @"MacBook Pro (Retina, 15-inch, Mid 2015)",
                     @"MacBookPro12,1": @"MacBook Pro (Retina, 13-inch, Early 2015)",
                     @"MacBookPro13,1": @"MacBook Pro (13-inch, 2016, Two Thunderbolt 3 ports)",
                     @"MacBookPro13,2": @"MacBook Pro (13-inch, 2016, Four Thunderbolt 3 ports)",
                     @"MacBookPro13,3": @"MacBook Pro (15-inch, 2016)",
                     @"MacBookPro14,1": @"MacBook Pro (13-inch, 2017, Two Thunderbolt 3 ports)",
                     @"MacBookPro14,2": @"MacBook Pro (13-inch, 2017, Four Thunderbolt 3 ports)",
                     @"MacBookPro14,3": @"MacBook Pro (15-inch, 2017)",
                     @"MacBookPro15,1": @"MacBook Pro (15-inch, 2018)",
                     @"MacBookPro15,2": @"MacBook Pro (13-inch, 2018, Four Thunderbolt 3 ports)",
                     };
        } else if ([deviceModel hasPrefix:@"MacBookAir"]) {
            dict = @{
                     @"MacBookAir2,1": @"MacBook Air (Mid 2009)",
                     @"MacBookAir3,1": @"MacBook Air (11-inch, Late 2010)",
                     @"MacBookAir3,2": @"MacBook Air (13-inch, Late 2010)",
                     @"MacBookAir4,1": @"MacBook Air (11-inch, Mid 2011)",
                     @"MacBookAir4,2": @"MacBook Air (13-inch, Mid 2011)",
                     @"MacBookAir5,1": @"MacBook Air (11-inch, Mid 2012)",
                     @"MacBookAir5,2": @"MacBook Air (13-inch, Mid 2012)",
                     @"MacBookAir6,1": @"MacBook Air (11-inch, Mid 2013 / Early 2014)",
                     @"MacBookAir6,2": @"MacBook Air (13-inch, Mid 2013 / Early 2014)",
                     @"MacBookAir7,1": @"MacBook Air (11-inch, Early 2015)",
                     @"MacBookAir7,2": @"MacBook Air (13-inch, Early 2015 / 2017)",
                     @"MacBookAir8,1": @"MacBook Air (Retina, 13-inch, 2018)",
                     };
        } else if ([deviceModel hasPrefix:@"MacBook"]) {
            dict = @{
                     @"MacBook5,2": @"MacBook (13-inch, Early 2009 / Mid 2009)",
                     @"MacBook6,1": @"MacBook (13-inch, Late 2009)",
                     @"MacBook7,1": @"MacBook (13-inch, Mid 2010)",
                     @"MacBook8,1": @"MacBook (Retina, 12-inch, Early 2015)",
                     @"MacBook9,1": @"MacBook (Retina, 12-inch, Early 2016)",
                     @"MacBook10,1": @"MacBook (Retina, 12-inch, 2017)",
                     };
        } else if ([deviceModel hasPrefix:@"iMac"]) {
            dict = @{
                     @"iMac9,1": @"iMac (20-inch / 24-inch, Early 2009)",
                     @"iMac10,1": @"iMac (21.5-inch / 27-inch, Late 2009)",
                     @"iMac11,2": @"iMac (21.5-inch, Mid 2010)",
                     @"iMac11,3": @"iMac (27-inch, Mid 2010)",
                     @"iMac12,1": @"iMac (21.5-inch, Mid 2011)",
                     @"iMac12,2": @"iMac (27-inch, Mid 2011)",
                     @"iMac13,1": @"iMac (21.5-inch, Late 2012)",
                     @"iMac13,2": @"iMac (27-inch, Late 2012)",
                     @"iMac14,1": @"iMac (21.5-inch, Late 2013)",
                     @"iMac14,2": @"iMac (27-inch, Late 2013)",
                     @"iMac14,4": @"iMac (21.5-inch, Mid 2014)",
                     @"iMac15,1": @"iMac (Retina 5K, 27-inch, Late 2014 / Mid 2015)",
                     @"iMac16,1": @"iMac (21.5-inch, Late 2015)",
                     @"iMac16,2": @"iMac (Retina 4K, 21.5-inch, Late 2015)",
                     @"iMac17,1": @"iMac (Retina 5K, 27-inch, Late 2015)",
                     @"iMac18,1": @"iMac (21.5-inch, 2017)",
                     @"iMac18,2": @"iMac (Retina 4K, 21.5-inch, 2017)",
                     @"iMac18,3": @"iMac (Retina 5K, 27-inch, 2017)",
                     };
        } else if ([deviceModel hasPrefix:@"MacPro"]) {
            dict = @{
                     @"MacPro4,1": @"Mac Pro (Early 2009)",
                     @"MacPro5,1": @"Mac Pro (Mid 2010 / Mid 2012)",
                     @"MacPro6,1": @"Mac Pro (Late 2013)",
                     };
        } else if ([deviceModel hasPrefix:@"Macmini3,1"]) {
            dict = @{
                     @"Macmini3,1": @"Mac mini (2009)",
                     @"Macmini4,1": @"Mac mini (Mid 2010)",
                     @"Macmini5,1": @"Mac mini (Mid 2011)",
                     @"Macmini5,2": @"Mac mini (Mid 2011)",
                     @"Macmini6,1": @"Mac mini (Late 2012)",
                     @"Macmini6,2": @"Mac mini (Late 2012)",
                     @"Macmini7,1": @"Mac mini (Late 2014)",
                     @"Macmini8,1": @"Mac mini (2018)",
                     };
        }
#endif
        _deviceModelName = dict[deviceModel];
    }
    return _deviceModelName;
}

- (BOOL)isSimulator {
    NSString *deviceModel = self.deviceModel;
    return [deviceModel isEqualToString:@"i386"] || [deviceModel isEqualToString:@"x86_64"];
}

@end

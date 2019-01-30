//
//  AppleDevice.m
//  AppleDevice
//
//  Created by muhuaxin on 2019/1/25.
//  Copyright © 2019 muhuaxin. All rights reserved.
//

#import "AppleDevice.h"

#if TARGET_OS_IOS || TARGET_OS_TV
#include <sys/utsname.h>
#elif TARGET_OS_MAC
#include <sys/sysctl.h>
#endif

@implementation AppleDevice

+ (instancetype)currentDevice {
    static AppleDevice *_currentDevice;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _currentDevice = [[super alloc] init];
    });
    return _currentDevice;
}

- (NSString *)deviceModel {
#if TARGET_OS_IOS || TARGET_OS_TV
    struct utsname systemInfo;
    uname(&systemInfo);
    NSString *deviceModel = [NSString stringWithCString:systemInfo.machine encoding:NSUTF8StringEncoding];
    return deviceModel;
#elif TARGET_OS_MAC
    size t size = 0;
    sysctlbyname("hw.model", NULL, &size, NULL, 0);
    if (size > 0) {
        char model[size];
        sysctlbyname("hw.model", model, &size, NULL, 0);
        NSString *deviceModel = [NSString stringWithCString:model encoding:NSUTF8StringEncoding];
        return deviceModel;
    }
    return nil;
#endif
}

static NSString * _deviceModelName = nil;

- (NSString *)deviceModelName {
    if (_deviceModelName == nil) {
        NSString *machineString = [self deviceModel];
#if TARGET_OS_IOS || TARGET_OS_TV
        if ([machineString isEqualToString:@"iPhone1,1"])   _deviceModelName = @"iPhone";
        if ([machineString isEqualToString:@"iPhone1,2"])   _deviceModelName = @"iPhone 3G";
        if ([machineString isEqualToString:@"iPhone2,1"])   _deviceModelName = @"iPhone 3GS";
        if ([machineString isEqualToString:@"iPhone3,1"])   _deviceModelName = @"iPhone 4";
        if ([machineString isEqualToString:@"iPhone3,3"])   _deviceModelName = @"iPhone 4";
        if ([machineString isEqualToString:@"iPhone4,1"])   _deviceModelName = @"iPhone 4S";
        if ([machineString isEqualToString:@"iPhone5,1"])   _deviceModelName = @"iPhone 5";
        if ([machineString isEqualToString:@"iPhone5,2"])   _deviceModelName = @"iPhone 5";
        if ([machineString isEqualToString:@"iPhone5,3"])   _deviceModelName = @"iPhone 5C";
        if ([machineString isEqualToString:@"iPhone5,4"])   _deviceModelName = @"iPhone 5C";
        if ([machineString isEqualToString:@"iPhone6,1"])   _deviceModelName = @"iPhone 5S";
        if ([machineString isEqualToString:@"iPhone6,2"])   _deviceModelName = @"iPhone 5S";
        if ([machineString isEqualToString:@"iPhone7,2"])   _deviceModelName = @"iPhone 6";
        if ([machineString isEqualToString:@"iPhone7,1"])   _deviceModelName = @"iPhone 6 Plus";
        if ([machineString isEqualToString:@"iPhone8,1"])   _deviceModelName = @"iPhone 6S";
        if ([machineString isEqualToString:@"iPhone8,2"])   _deviceModelName = @"iPhone 6S Plus";
        if ([machineString isEqualToString:@"iPhone8,4"])   _deviceModelName = @"iPhone SE";
        if ([machineString isEqualToString:@"iPhone9,1"])   _deviceModelName = @"iPhone 7";
        if ([machineString isEqualToString:@"iPhone9,2"])   _deviceModelName = @"iPhone 7 Plus";
        if ([machineString isEqualToString:@"iPhone9,3"])   _deviceModelName = @"iPhone 7";
        if ([machineString isEqualToString:@"iPhone9,4"])   _deviceModelName = @"iPhone 7 Plus";
        if ([machineString isEqualToString:@"iPhone10,1"])  _deviceModelName = @"iPhone 8";
        if ([machineString isEqualToString:@"iPhone10,4"])  _deviceModelName = @"iPhone 8";
        if ([machineString isEqualToString:@"iPhone10,2"])  _deviceModelName = @"iPhone 8 Plus";
        if ([machineString isEqualToString:@"iPhone10,5"])  _deviceModelName = @"iPhone 8 Plus";
        if ([machineString isEqualToString:@"iPhone10,3"])  _deviceModelName = @"iPhone X";
        if ([machineString isEqualToString:@"iPhone10,6"])  _deviceModelName = @"iPhone X";
        if ([machineString isEqualToString:@"iPhone11,2"])  _deviceModelName = @"iPhone XS";
        if ([machineString isEqualToString:@"iPhone11,4"])  _deviceModelName = @"iPhone XS Max";
        if ([machineString isEqualToString:@"iPhone11,6"])  _deviceModelName = @"iPhone XS Max";
        if ([machineString isEqualToString:@"iPhone11,8"])  _deviceModelName = @"iPhone XR";
        
        if ([machineString isEqualToString:@"iPod1,1"])     _deviceModelName = @"iPod Touch 1G";
        if ([machineString isEqualToString:@"iPod2,1"])     _deviceModelName = @"iPod Touch 2G";
        if ([machineString isEqualToString:@"iPod3,1"])     _deviceModelName = @"iPod Touch 3G";
        if ([machineString isEqualToString:@"iPod4,1"])     _deviceModelName = @"iPod Touch 4G";
        if ([machineString isEqualToString:@"iPod5,1"])     _deviceModelName = @"iPod Touch 5G";
        if ([machineString isEqualToString:@"iPod7,1"])     _deviceModelName = @"iPod Touch 6G";
        
        
        if ([machineString isEqualToString:@"iPad1,1"])     _deviceModelName = @"iPad 1";
        if ([machineString isEqualToString:@"iPad1,2"])     _deviceModelName = @"iPad 3G";
        if ([machineString isEqualToString:@"iPad2,1"])     _deviceModelName = @"iPad 2";
        if ([machineString isEqualToString:@"iPad2,2"])     _deviceModelName = @"iPad 2";
        if ([machineString isEqualToString:@"iPad2,3"])     _deviceModelName = @"iPad 2";
        if ([machineString isEqualToString:@"iPad2,4"])     _deviceModelName = @"iPad 2";
        if ([machineString isEqualToString:@"iPad2,5"])     _deviceModelName = @"iPad Mini";
        if ([machineString isEqualToString:@"iPad2,6"])     _deviceModelName = @"iPad Mini";
        if ([machineString isEqualToString:@"iPad2,7"])     _deviceModelName = @"iPad Mini";
        if ([machineString isEqualToString:@"iPad3,1"])     _deviceModelName = @"iPad 3";
        if ([machineString isEqualToString:@"iPad3,2"])     _deviceModelName = @"iPad 3";
        if ([machineString isEqualToString:@"iPad3,3"])     _deviceModelName = @"iPad 3";
        if ([machineString isEqualToString:@"iPad3,4"])     _deviceModelName = @"iPad 4";
        if ([machineString isEqualToString:@"iPad3,5"])     _deviceModelName = @"iPad 4";
        if ([machineString isEqualToString:@"iPad3,6"])     _deviceModelName = @"iPad 4";
        if ([machineString isEqualToString:@"iPad4,1"])     _deviceModelName = @"iPad Air";
        if ([machineString isEqualToString:@"iPad4,2"])     _deviceModelName = @"iPad Air";
        if ([machineString isEqualToString:@"iPad4,4"])     _deviceModelName = @"iPad Mini 2";
        if ([machineString isEqualToString:@"iPad4,5"])     _deviceModelName = @"iPad Mini 2";
        if ([machineString isEqualToString:@"iPad4,7"])     _deviceModelName = @"iPad Mini 3";
        if ([machineString isEqualToString:@"iPad4,8"])     _deviceModelName = @"iPad Mini 3";
        if ([machineString isEqualToString:@"iPad4,9"])     _deviceModelName = @"iPad Mini 3";
        if ([machineString isEqualToString:@"iPad5,1"])     _deviceModelName = @"iPad Mini 4";
        if ([machineString isEqualToString:@"iPad5,2"])     _deviceModelName = @"iPad Mini 4";
        if ([machineString isEqualToString:@"iPad5,3"])     _deviceModelName = @"iPad Air 2";
        if ([machineString isEqualToString:@"iPad5,4"])     _deviceModelName = @"iPad Air 2";
        if ([machineString isEqualToString:@"iPad6,3"])     _deviceModelName = @"iPad Pro 9.7inch";
        if ([machineString isEqualToString:@"iPad6,4"])     _deviceModelName = @"iPad Pro 9.7inch";
        if ([machineString isEqualToString:@"iPad6,7"])     _deviceModelName = @"iPad Pro 12.9inch";
        if ([machineString isEqualToString:@"iPad6,8"])     _deviceModelName = @"iPad Pro 12.9inch";
        if ([machineString isEqualToString:@"iPad6,11"])    _deviceModelName = @"iPad 5";
        if ([machineString isEqualToString:@"iPad6,12"])    _deviceModelName = @"iPad 5";
        if ([machineString isEqualToString:@"iPad7,1"])     _deviceModelName = @"iPad Pro 12.9inch 2G";
        if ([machineString isEqualToString:@"iPad7,2"])     _deviceModelName = @"iPad Pro 12.9inch 2G";
        if ([machineString isEqualToString:@"iPad7,3"])     _deviceModelName = @"iPad Pro 10.5inch";
        if ([machineString isEqualToString:@"iPad7,4"])     _deviceModelName = @"iPad Pro 10.5inch";
        if ([machineString isEqualToString:@"iPad7,5"])     _deviceModelName = @"iPad 6";
        if ([machineString isEqualToString:@"iPad7,6"])     _deviceModelName = @"iPad 6";
        if ([machineString isEqualToString:@"iPad8,1"])     _deviceModelName = @"iPad Pro 11inch";
        if ([machineString isEqualToString:@"iPad8,2"])     _deviceModelName = @"iPad Pro 11inch";
        if ([machineString isEqualToString:@"iPad8,3"])     _deviceModelName = @"iPad Pro 11inch";
        if ([machineString isEqualToString:@"iPad8,4"])     _deviceModelName = @"iPad Pro 11inch";
        if ([machineString isEqualToString:@"iPad8,5"])     _deviceModelName = @"iPad Pro 12.9inch 3G";
        if ([machineString isEqualToString:@"iPad8,6"])     _deviceModelName = @"iPad Pro 12.9inch 3G";
        if ([machineString isEqualToString:@"iPad8,7"])     _deviceModelName = @"iPad Pro 12.9inch 3G";
        if ([machineString isEqualToString:@"iPad8,8"])     _deviceModelName = @"iPad Pro 12.9inch 3G";
        
        
        if ([machineString isEqualToString:@"AppleTV2,1"])  _deviceModelName = @"AppleTV 2";
        if ([machineString isEqualToString:@"AppleTV3,1"])  _deviceModelName = @"AppleTV 3";
        if ([machineString isEqualToString:@"AppleTV3,2"])  _deviceModelName = @"AppleTV 3";
        if ([machineString isEqualToString:@"AppleTV5,3"])  _deviceModelName = @"AppleTV 4";
        if ([machineString isEqualToString:@"AppleTV6,2"])  _deviceModelName = @"AppleTV 4K";
        
        
        if ([machineString isEqualToString:@"i386"])        _deviceModelName = @"i386";
        if ([machineString isEqualToString:@"x86_64"])      _deviceModelName = @"x86_64";
        
        
#elif TARGET_OS_MAC
        if ([machineString isEqualToString:@"MacBookPro4,1"])  _deviceModelName = @"MacBook Pro (15-inch / 17-inch, Early 2008)";
        if ([machineString isEqualToString:@"MacBookPro5,1"])  _deviceModelName = @"MacBook Pro (15-inch, Late 2008)";
        if ([machineString isEqualToString:@"MacBookPro5,2"])  _deviceModelName = @"MacBook Pro (17-inch, Early 2009)";
        if ([machineString isEqualToString:@"MacBookPro5,3"])  _deviceModelName = @"MacBook Pro (15-inch, Mid 2009)";
        if ([machineString isEqualToString:@"MacBookPro5,5"])  _deviceModelName = @"MacBook Pro (13-inch, Mid 2009)";
        if ([machineString isEqualToString:@"MacBookPro6,1"])  _deviceModelName = @"MacBook Pro (17-inch, Mid 2010)";
        if ([machineString isEqualToString:@"MacBookPro6,2"])  _deviceModelName = @"MacBook Pro (15-inch, Mid 2010)";
        if ([machineString isEqualToString:@"MacBookPro7,1"])  _deviceModelName = @"MacBook Pro (13-inch, Mid 2010)";
        if ([machineString isEqualToString:@"MacBookPro8,1"])  _deviceModelName = @"MacBook Pro (13-inch, 2011)";
        if ([machineString isEqualToString:@"MacBookPro8,2"])  _deviceModelName = @"MacBook Pro (15-inch, 2011)";
        if ([machineString isEqualToString:@"MacBookPro8,3"])  _deviceModelName = @"MacBook Pro (17-inch, 2011)";
        if ([machineString isEqualToString:@"MacBookPro9,1"])  _deviceModelName = @"MacBook Pro (15-inch, Mid 2012)";
        if ([machineString isEqualToString:@"MacBookPro9,2"])  _deviceModelName = @"MacBook Pro (13-inch, Mid 2012)";
        if ([machineString isEqualToString:@"MacBookPro10,1"])  _deviceModelName = @"MacBook Pro (Retina, 15-inch, Mid 2012 / Early 2013)";
        if ([machineString isEqualToString:@"MacBookPro10,2"])  _deviceModelName = @"MacBook Pro (Retina, 13-inch, Late 2012 / Early 2013)";
        if ([machineString isEqualToString:@"MacBookPro11,1"])  _deviceModelName = @"MacBook Pro (Retina, 13-inch, Late 2013 / Mid 2014)";
        if ([machineString isEqualToString:@"MacBookPro11,2"])  _deviceModelName = @"MacBook Pro (Retina, 15-inch, Late 2013 / Mid 2014)";
        if ([machineString isEqualToString:@"MacBookPro11,3"])  _deviceModelName = @"MacBook Pro (Retina, 15-inch, Late 2013 / Mid 2014)";
        if ([machineString isEqualToString:@"MacBookPro11,4"])  _deviceModelName = @"MacBook Pro (Retina, 15-inch, Mid 2015)";
        if ([machineString isEqualToString:@"MacBookPro11,5"])  _deviceModelName = @"MacBook Pro (Retina, 15-inch, Mid 2015)";
        if ([machineString isEqualToString:@"MacBookPro12,1"])  _deviceModelName = @"MacBook Pro (Retina, 13-inch, Early 2015)";
        if ([machineString isEqualToString:@"MacBookPro13,1"])  _deviceModelName = @"MacBook Pro (13-inch, 2016, Two Thunderbolt 3 ports)";
        if ([machineString isEqualToString:@"MacBookPro13,2"])  _deviceModelName = @"MacBook Pro (13-inch, 2016, Four Thunderbolt 3 ports)";
        if ([machineString isEqualToString:@"MacBookPro13,3"])  _deviceModelName = @"MacBook Pro (15-inch, 2016)";
        if ([machineString isEqualToString:@"MacBookPro14,1"])  _deviceModelName = @"MacBook Pro (13-inch, 2017, Two Thunderbolt 3 ports)";
        if ([machineString isEqualToString:@"MacBookPro14,2"])  _deviceModelName = @"MacBook Pro (13-inch, 2017, Four Thunderbolt 3 ports)";
        if ([machineString isEqualToString:@"MacBookPro14,3"])  _deviceModelName = @"MacBook Pro (15-inch, 2017)";
        if ([machineString isEqualToString:@"MacBookPro15,1"])  _deviceModelName = @"MacBook Pro (15-inch, 2018)";
        if ([machineString isEqualToString:@"MacBookPro15,2"])  _deviceModelName = @"MacBook Pro (13-inch, 2018, Four Thunderbolt 3 ports)";
        
        
        if ([machineString isEqualToString:@"MacBook5,2"])  _deviceModelName = @"MacBook (13-inch, Early 2009 / Mid 2009)";
        if ([machineString isEqualToString:@"MacBook6,1"])  _deviceModelName = @"MacBook (13-inch, Late 2009)";
        if ([machineString isEqualToString:@"MacBook7,1"])  _deviceModelName = @"MacBook (13-inch, Mid 2010)";
        if ([machineString isEqualToString:@"MacBook8,1"])  _deviceModelName = @"MacBook (Retina, 12-inch, Early 2015)";
        if ([machineString isEqualToString:@"MacBook9,1"])  _deviceModelName = @"MacBook (Retina, 12-inch, Early 2016)";
        if ([machineString isEqualToString:@"MacBook10,1"])  _deviceModelName = @"MacBook (Retina, 12-inch, 2017)";
        
        
        if ([machineString isEqualToString:@"iMac9,1"])  _deviceModelName = @"iMac (20-inch / 24-inch, Early 2009)";
        if ([machineString isEqualToString:@"iMac10,1"])  _deviceModelName = @"iMac (21.5-inch / 27-inch, Late 2009)";
        if ([machineString isEqualToString:@"iMac11,2"])  _deviceModelName = @"iMac (21.5-inch, Mid 2010)";
        if ([machineString isEqualToString:@"iMac11,3"])  _deviceModelName = @"iMac (27-inch, Mid 2010)";
        if ([machineString isEqualToString:@"iMac12,1"])  _deviceModelName = @"iMac (21.5-inch, Mid 2011)";
        if ([machineString isEqualToString:@"iMac12,2"])  _deviceModelName = @"iMac (27-inch, Mid 2011)";
        if ([machineString isEqualToString:@"iMac13,1"])  _deviceModelName = @"iMac (21.5-inch, Late 2012)";
        if ([machineString isEqualToString:@"iMac13,2"])  _deviceModelName = @"iMac (27-inch, Late 2012)";
        if ([machineString isEqualToString:@"iMac14,1"])  _deviceModelName = @"iMac (21.5-inch, Late 2013)";
        if ([machineString isEqualToString:@"iMac14,2"])  _deviceModelName = @"iMac (27-inch, Late 2013)";
        if ([machineString isEqualToString:@"iMac14,4"])  _deviceModelName = @"iMac (21.5-inch, Mid 2014)";
        if ([machineString isEqualToString:@"iMac15,1"])  _deviceModelName = @"iMac (Retina 5K, 27-inch, Late 2014 / Mid 2015)";
        if ([machineString isEqualToString:@"iMac16,1"])  _deviceModelName = @"iMac (21.5-inch, Late 2015)";
        if ([machineString isEqualToString:@"iMac16,2"])  _deviceModelName = @"iMac (Retina 4K, 21.5-inch, Late 2015)";
        if ([machineString isEqualToString:@"iMac17,1"])  _deviceModelName = @"iMac (Retina 5K, 27-inch, Late 2015)";
        if ([machineString isEqualToString:@"iMac18,1"])  _deviceModelName = @"iMac (21.5-inch, 2017)";
        if ([machineString isEqualToString:@"iMac18,2"])  _deviceModelName = @"iMac (Retina 4K, 21.5-inch, 2017)";
        if ([machineString isEqualToString:@"iMac18,3"])  _deviceModelName = @"iMac (Retina 5K, 27-inch, 2017)";
        
        
        if ([machineString isEqualToString:@"MacBookAir2,1"])  _deviceModelName = @"MacBook Air (Mid 2009)";
        if ([machineString isEqualToString:@"MacBookAir3,1"])  _deviceModelName = @"MacBook Air (11-inch, Late 2010)";
        if ([machineString isEqualToString:@"MacBookAir3,2"])  _deviceModelName = @"MacBook Air (13-inch, Late 2010)";
        if ([machineString isEqualToString:@"MacBookAir4,1"])  _deviceModelName = @"MacBook Air (11-inch, Mid 2011)";
        if ([machineString isEqualToString:@"MacBookAir4,2"])  _deviceModelName = @"MacBook Air (13-inch, Mid 2011)";
        if ([machineString isEqualToString:@"MacBookAir5,1"])  _deviceModelName = @"MacBook Air (11-inch, Mid 2012)";
        if ([machineString isEqualToString:@"MacBookAir5,2"])  _deviceModelName = @"MacBook Air (13-inch, Mid 2012)";
        if ([machineString isEqualToString:@"MacBookAir6,1"])  _deviceModelName = @"MacBook Air (11-inch, Mid 2013 / Early 2014)";
        if ([machineString isEqualToString:@"MacBookAir6,2"])  _deviceModelName = @"MacBook Air (13-inch, Mid 2013 / Early 2014)";
        if ([machineString isEqualToString:@"MacBookAir7,1"])  _deviceModelName = @"MacBook Air (11-inch, Early 2015)";
        if ([machineString isEqualToString:@"MacBookAir7,2"])  _deviceModelName = @"MacBook Air (13-inch, Early 2015 / 2017)";
        if ([machineString isEqualToString:@"MacBookAir8,1"])  _deviceModelName = @"MacBook Air (Retina, 13-inch, 2018)";
        
        
        if ([machineString isEqualToString:@"Macmini3,1"])  _deviceModelName = @"Mac mini (2009)";
        if ([machineString isEqualToString:@"Macmini4,1"])  _deviceModelName = @"Mac mini (Mid 2010)";
        if ([machineString isEqualToString:@"Macmini5,1"])  _deviceModelName = @"Mac mini (Mid 2011)";
        if ([machineString isEqualToString:@"Macmini5,2"])  _deviceModelName = @"Mac mini (Mid 2011)";
        if ([machineString isEqualToString:@"Macmini6,1"])  _deviceModelName = @"Mac mini (Late 2012)";
        if ([machineString isEqualToString:@"Macmini6,2"])  _deviceModelName = @"Mac mini (Late 2012)";
        if ([machineString isEqualToString:@"Macmini7,1"])  _deviceModelName = @"Mac mini (Late 2014)";
        if ([machineString isEqualToString:@"Macmini8,1"])  _deviceModelName = @"Mac mini (2018)";
        
        
        if ([machineString isEqualToString:@"MacPro4,1"])  _deviceModelName = @"Mac Pro (Early 2009)";
        if ([machineString isEqualToString:@"MacPro5,1"])  _deviceModelName = @"Mac Pro (Mid 2010 / Mid 2012)";
        if ([machineString isEqualToString:@"MacPro6,1"])  _deviceModelName = @"Mac Pro (Late 2013)";
        
        
        if ([machineString isEqualToString:@"MacBookPro"])  _deviceModelName = @"";
        if ([machineString isEqualToString:@"MacBookPro"])  _deviceModelName = @"";
        if ([machineString isEqualToString:@"MacBookPro"])  _deviceModelName = @"";
        if ([machineString isEqualToString:@"MacBookPro"])  _deviceModelName = @"";
#endif
    }
    return _deviceModelName;
}

- (BOOL)isSimulator {
    NSString *deviceModel = [self deviceModel];
    return [deviceModel isEqualToString:@"i386"] || [deviceModel isEqualToString:@"x86_64"];
}

@end

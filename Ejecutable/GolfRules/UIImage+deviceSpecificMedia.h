//
//  UIImage+deviceSpecificMedia.h
//  Noticias AM
//
//  Created by Carlos Vela on 08/11/14.
//  Copyright (c) 2014 Carlos Vela. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, thisDeviceClass) {
    thisDeviceClass_iPhone,
    thisDeviceClass_iPhoneRetina,
    thisDeviceClass_iPhone5,
    thisDeviceClass_iPhone6,
    thisDeviceClass_iPhone6plus,
    
    thisDeviceClass_iPad,
    thisDeviceClass_iPadRetina,
    
    thisDeviceClass_unknown
};


thisDeviceClass currentDeviceClass();

@interface UIImage (deviceSpecificMedia)

+(instancetype )imageForDeviceWithName:(NSString *)fileName;
+(instancetype )launchImageForDeviceWithName:(NSString *)fileName;

@end

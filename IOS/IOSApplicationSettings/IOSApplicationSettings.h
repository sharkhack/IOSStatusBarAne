//
//  IOSApplicationSettings.h
//  IOSApplicationSettings
//
//  Created by Azer Bulbul on 12/29/13.
//  Copyright (c) 2013 Azer Bulbul. All rights reserved.
//
#import "FlashRuntimeExtensions.h"
#import <UIKit/UIKit.h>

@interface IOSApplicationSettings : NSObject

+ (IOSApplicationSettings *)sharedInstance;

- (void) refreshStatusBar:(NSString*)styleType;

- (void) hideStatusBar:(BOOL)hidden;

@end

//native extension caller...
void IOSAppSettingsContextInitializer(void* extData, const uint8_t* ctxType, FREContext ctx,
						uint32_t* numFunctionsToTest, const FRENamedFunction** functionsToSet);

void IOSAppSettingsContextFinalizer(FREContext ctx);

void IOSAppSettingsExtInitializer(void** extDataToSet, FREContextInitializer* ctxInitializerToSet,
                    FREContextFinalizer* ctxFinalizerToSet);

void IOSAppSettingsExtFinalizer(void* extData);
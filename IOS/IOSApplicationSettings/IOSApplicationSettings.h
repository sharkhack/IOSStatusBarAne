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


@end

void ContextInitializer(void* extData, const uint8_t* ctxType, FREContext ctx,
						uint32_t* numFunctionsToTest, const FRENamedFunction** functionsToSet);

void ContextFinalizer(FREContext ctx);

void ExtInitializer(void** extDataToSet, FREContextInitializer* ctxInitializerToSet,
                    FREContextFinalizer* ctxFinalizerToSet);

void ExtFinalizer(void* extData);
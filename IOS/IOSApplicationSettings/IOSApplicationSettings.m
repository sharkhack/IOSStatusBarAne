//
//  IOSApplicationSettings.m
//  IOSApplicationSettings
//
//  Created by Azer Bulbul on 12/29/13.
//  Copyright (c) 2013 Azer Bulbul. All rights reserved.
//

#import "IOSApplicationSettings.h"

@implementation IOSApplicationSettings

static IOSApplicationSettings *sharedInstance = nil;

+ (IOSApplicationSettings *)sharedInstance
{
    if (sharedInstance == nil)
    {
        sharedInstance = [[super allocWithZone:NULL] init];
    }
    
    return sharedInstance;
}

+ (id)allocWithZone:(NSZone *)zone
{
    return [self sharedInstance];
}

- (id)copy
{
    return self;
}

@end

FREObject RefreshStatusBar(FREContext ctx, void* funcData, uint32_t argc, FREObject argv[]) {
    
    uint32_t STYLE_CTYPE_LENTH;
    const uint8_t *STYLE_CTYPE;
    NSString *STYLE_TYPE = nil;
    
    if (FRE_OK == FREGetObjectAsUTF8(argv[0], &STYLE_CTYPE_LENTH, &STYLE_CTYPE)) {
        STYLE_TYPE = [NSString stringWithUTF8String:(char*)STYLE_CTYPE];
    }
    
    if([STYLE_TYPE  isEqualToString:@"UIStatusBarStyleLightContent"]){
        [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent animated:YES];
    } else if ([STYLE_TYPE  isEqualToString:@"UIStatusBarStyleBlackOpaque"]){
        [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleBlackOpaque animated:YES];
    } else if ([STYLE_TYPE  isEqualToString:@"UIStatusBarStyleBlackTranslucent"]){
        [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleBlackTranslucent animated:YES];
    } else if ([STYLE_TYPE  isEqualToString:@"UIStatusBarStyleDefault"]){
        [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault animated:YES];
    }
    
    //[UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
    
	return NULL;
}

void ContextInitializer(void* extData, const uint8_t* ctxType, FREContext ctx,
						uint32_t* numFunctionsToTest, const FRENamedFunction** functionsToSet) {
    
    NSLog(@"Entering ContextInitializer()");
    
	*numFunctionsToTest = 1;
    
	FRENamedFunction* func = (FRENamedFunction*) malloc(sizeof(FRENamedFunction) * 1);
	func[0].name = (const uint8_t*) "RefreshStatusBar";
	func[0].functionData = NULL;
    func[0].function = &RefreshStatusBar;
	
	*functionsToSet = func;
    
    NSLog(@"Exiting ContextInitializer()");
    
}


void ContextFinalizer(FREContext ctx) {
    return;
}

void ExtInitializer(void** extDataToSet, FREContextInitializer* ctxInitializerToSet,
                    FREContextFinalizer* ctxFinalizerToSet) {
    
    *extDataToSet = NULL;
    *ctxInitializerToSet = &ContextInitializer;
    *ctxFinalizerToSet = &ContextFinalizer;
}

void ExtFinalizer(void* extData) {
    return;
}
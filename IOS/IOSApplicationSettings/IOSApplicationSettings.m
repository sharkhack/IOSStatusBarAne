//
//  IOSApplicationSettings.m
//  IOSApplicationSettings
//
//  Created by Azer Bulbul on 12/29/13.
//  Copyright (c) 2013 Azer Bulbul. All rights reserved.
//

#import "IOSApplicationSettings.h"

FREContext AirIPCtx = nil;

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
    return [IOSApplicationSettings sharedInstance];
}

- (id)copy
{
    return self;
}

- (void)dealloc
{
    [super dealloc];
}

- (BOOL)prefersStatusBarHidden {
    return YES;
}

- (void) hideStatusBar:(BOOL)hidden{
    [[UIApplication sharedApplication] setStatusBarHidden:hidden];
}

- (void) refreshStatusBar:(NSString*)styleType
{
    if([styleType  isEqualToString:@"UIStatusBarStyleLightContent"]){
        [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent animated:YES];
    } else if ([styleType  isEqualToString:@"UIStatusBarStyleBlackOpaque"]){
        [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleBlackOpaque animated:YES];
    } else if ([styleType  isEqualToString:@"UIStatusBarStyleBlackTranslucent"]){
        [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleBlackTranslucent animated:YES];
    } else if ([styleType  isEqualToString:@"UIStatusBarStyleDefault"]){
        [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault animated:YES];
    }
}
@end




FREObject RefreshStatusBar(FREContext ctx, void* funcData, uint32_t argc, FREObject argv[]) {
    
    uint32_t STYLE_CTYPE_LENTH;
    const uint8_t *STYLE_CTYPE;
    NSString *STYLE_TYPE = nil;
    
    if (FRE_OK == FREGetObjectAsUTF8(argv[0], &STYLE_CTYPE_LENTH, &STYLE_CTYPE)) {
        STYLE_TYPE = [NSString stringWithUTF8String:(char*)STYLE_CTYPE];
    }
    
    [[IOSApplicationSettings sharedInstance] refreshStatusBar:STYLE_TYPE];
    
	return NULL;
}

FREObject HiddenhStatusBar(FREContext ctx, void* funcData, uint32_t argc, FREObject argv[]) {
    
    uint32_t HIDDEN_CLENTH;
    const uint8_t *HIDDEN_C;
    NSString *HIDDEN = nil;
    
    if (FRE_OK == FREGetObjectAsUTF8(argv[0], &HIDDEN_CLENTH, &HIDDEN_C)) {
        HIDDEN = [NSString stringWithUTF8String:(char*)HIDDEN_C];
    }
    
    BOOL shidden = NO;
    
    if([HIDDEN isEqualToString:@"YES"]){
        shidden = YES;
    } else {
        shidden = NO;
    }
    
    [[IOSApplicationSettings sharedInstance] hideStatusBar:shidden];
    
	return NULL;
}


void ContextInitializer(void* extData, const uint8_t* ctxType, FREContext ctx,
						uint32_t* numFunctionsToTest, const FRENamedFunction** functionsToSet) {
    
    NSLog(@"Entering ContextInitializer()");
    
	*numFunctionsToTest = 2;
    
	FRENamedFunction* func = (FRENamedFunction*) malloc(sizeof(FRENamedFunction) * 2);
	func[0].name = (const uint8_t*) "RefreshStatusBar";
	func[0].functionData = NULL;
    func[0].function = &RefreshStatusBar;
    
    func[1].name = (const uint8_t*) "HiddenhStatusBar";
	func[1].functionData = NULL;
    func[1].function = &HiddenhStatusBar;
    
	*functionsToSet = func;
    
    AirIPCtx = ctx;
    
    NSLog(@"Exiting ContextInitializer()");
    
}


void ContextFinalizer(FREContext ctx) {
    AirIPCtx = nil;
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
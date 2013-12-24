/**
 * Your Copyright Here
 *
 * Appcelerator Titanium is Copyright (c) 2009-2010 by Appcelerator, Inc.
 * and licensed under the Apache Public License (version 2)
 */
#import "TiModule.h"
#import <AVFoundation/AVFoundation.h>

@interface ComGiorgosTtsios7Module : TiModule 
{
    NSString *textToDictate;
    AVSpeechUtterance *utter;
    AVSpeechSynthesizer *speech;
    NSMutableArray *availableLanguages;
}

@end

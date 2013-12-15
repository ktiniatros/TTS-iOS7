/**
 * Your Copyright Here
 *
 * Appcelerator Titanium is Copyright (c) 2009-2010 by Appcelerator, Inc.
 * and licensed under the Apache Public License (version 2)
 */
#import "ComGiorgosTtsios7Module.h"
#import "TiBase.h"
#import "TiHost.h"
#import "TiUtils.h"

@implementation ComGiorgosTtsios7Module

#pragma mark Internal

// this is generated for your module, please do not change it
-(id)moduleGUID
{
	return @"a0214249-2a96-406f-bb44-b6f0ad4c3c00";
}

// this is generated for your module, please do not change it
-(NSString*)moduleId
{
	return @"com.giorgos.ttsios7";
}

#pragma mark Lifecycle

-(void)startup
{
	// this method is called when the module is first loaded
	// you *must* call the superclass
	[super startup];
    
    //speech synthesizer is up and ready for getting text to dictate
    //Should I clean this up when finished? Memory ?
    speech = [[AVSpeechSynthesizer alloc] init];
	
	NSLog(@"[GIORGOS] %@ loaded",self);
}

-(void)shutdown:(id)sender
{
	// this method is called when the module is being unloaded
	// typically this is during shutdown. make sure you don't do too
	// much processing here or the app will be quit forceably
	
	// you *must* call the superclass
    NSLog(@"[GIORGOS] TTS7 MODULE is shutting down, bye bye cruel world..");
	[super shutdown:sender];
}

#pragma mark Cleanup

-(void)dealloc
{
	// release any resources that have been retained by the module
	[super dealloc];
}

#pragma mark Internal Memory Management

-(void)didReceiveMemoryWarning:(NSNotification*)notification
{
	// optionally release any resources that can be dynamically
	// reloaded once memory is available - such as caches
	[super didReceiveMemoryWarning:notification];
}

#pragma mark Listener Notifications

-(void)_listenerAdded:(NSString *)type count:(int)count
{
	if (count == 1 && [type isEqualToString:@"my_event"])
	{
		// the first (of potentially many) listener is being added
		// for event named 'my_event'
	}
}

-(void)_listenerRemoved:(NSString *)type count:(int)count
{
	if (count == 0 && [type isEqualToString:@"my_event"])
	{
		// the last listener called for event named 'my_event' has
		// been removed, we can optionally clean up any resources
		// since no body is listening at this point for that event
	}
}

#pragma Public APIs

-(void)speak:(id)args
{
    //text:$text,
    //pitch:1.5,
    //rate:0.1,
    //language:"nl"
    ENSURE_ARG_COUNT(args,1);
	NSLog(@"passing stuff: %@", args);
    NSDictionary *ttsArgs =[args objectAtIndex:0];
    if([ttsArgs objectForKey:@"text"]){
        float pitchMultiplier = 1.5, rate = 0.1;
        if([ttsArgs objectForKey:@"pitch"]){
            pitchMultiplier = [TiUtils floatValue:[ttsArgs objectForKey:@"pitch"]];
        }
        if([ttsArgs objectForKey:@"rate"]){
            rate = [TiUtils floatValue:[ttsArgs objectForKey:@"rate"]];
        }
        if([ttsArgs objectForKey:@"language"]){
            
        }
        textToDictate = [TiUtils stringValue:[ttsArgs objectForKey:@"text"]];
        utter = [[AVSpeechUtterance alloc] initWithString:textToDictate];
        utter.pitchMultiplier = pitchMultiplier;
        utter.rate = rate;
        utter.voice = [AVSpeechSynthesisVoice voiceWithLanguage:@"nl-NL"];
        [speech speakUtterance:utter];
    }else{
        NSLog(@"[INFO] [TTSIOS7] No text passed! You will not hear a thing :)");
    }
        
        }
        
        -(void)shutup:(id)args
    {
        NSLog(@"[GIORGOS] Enjoy the silence");
        [speech stopSpeakingAtBoundary:AVSpeechBoundaryImmediate];
    }
        
        -(BOOL)pause:(id)args
    {
        if(speech.paused){
            return [speech continueSpeaking];
        }
        return [speech pauseSpeakingAtBoundary:AVSpeechBoundaryImmediate];
    }
        
        -(BOOL)speaking
    {
        return [speech speaking];
    }
        
        -(BOOL)paused
    {
        return [speech paused];
    }
        
        //-(id)example:(id)args
        //{
        //	// example method
        //	return @"hello world";
        //}
        //
        //-(id)exampleProp
        //{
        //	// example property getter
        //	return @"hello world";
        //}
        //
        //-(void)setExampleProp:(id)value
        //{
        //	// example property setter
        //}
        
        @end

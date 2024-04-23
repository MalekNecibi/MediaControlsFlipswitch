#import <Flipswitch/FSSwitchDataSource.h>
#import <Flipswitch/FSSwitchPanel.h>
// #import <Foundation/NSUserDefaults+Private.h>
#import <Foundation/Foundation.h>

static NSString *nsDomainString = @"us.necibi.mediacontrols";
static NSString *nsNotificationString = @"us.necibi.mediacontrols/preferences.changed";

@interface SBMediaController
- (BOOL)playForEventSource:(long long)arg1;
- (BOOL)pauseForEventSource: (long long)arg1;
+ (id)sharedInstance;
- (BOOL)isPaused;
- (BOOL)isPlaying;
@end


@interface MediaControlsSwitch : NSObject <FSSwitchDataSource>
@end

@implementation MediaControlsSwitch

- (NSString *)titleForSwitchIdentifier:(NSString *)switchIdentifier {
    return @"Media Controls";
}

- (FSSwitchState)stateForSwitchIdentifier:(NSString *)switchIdentifier {
    return [[%c(SBMediaController) sharedInstance] isPlaying] ? FSSwitchStateOn : FSSwitchStateOff;
}

- (void)applyState:(FSSwitchState)newState forSwitchIdentifier:(NSString *)switchIdentifier {
    switch (newState) {
        case FSSwitchStateIndeterminate:
            break;
        
        case FSSwitchStateOn:
            if ( [[%c(SBMediaController) sharedInstance] isPaused] ) {          
                [[%c(SBMediaController) sharedInstance] playForEventSource: 0]; 
            }
            break;
        
        case FSSwitchStateOff:
            if ( [[%c(SBMediaController) sharedInstance] isPlaying] ) { 
                [[%c(SBMediaController) sharedInstance] pauseForEventSource: 0];
            }
            break;
    }
}

@end

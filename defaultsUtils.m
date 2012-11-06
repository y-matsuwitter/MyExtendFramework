//
//  defaultsUtils.m
//
//  Created by Sugamiya Yusuke on 12/02/18.
//

#import "defaultsUtils.h"

@implementation defaultsUtils

+ (defaultsUtils*)use
{
    return DNPP_AUTORELEASE([[defaultsUtils alloc] init]);
}

- (id)get:(NSString*)aKey
{
    if (![aKey isEmpty]) {
        NSUserDefaults* defaults = [NSUserDefaults standardUserDefaults];
        return [defaults objectForKey:aKey];
    } else {
        return nil;
    }
}

- (void)setAndSync:(id)target forKey:(NSString*)forKey
{
    if (target != nil && ![forKey isEmpty]) {
        NSUserDefaults* defaults = [NSUserDefaults standardUserDefaults];
        [defaults setObject:target forKey:forKey];
        [defaults synchronize];
    }
}

- (void)removeAndSync:(NSString*)forKey
{
    if (![forKey isEmpty]) {
        NSUserDefaults* defaults = [NSUserDefaults standardUserDefaults];
        if ([defaults objectForKey:forKey]) {
            [defaults removeObjectForKey:forKey];
            [defaults synchronize];
        }
    }
}

- (NSDictionary*)getMyAppDefaults
{
    NSUserDefaults* defaults = [NSUserDefaults standardUserDefaults];
    NSString* appDomain = [[NSBundle mainBundle] bundleIdentifier];
    return [defaults persistentDomainForName:appDomain];
}

- (void)removeAllMyAppDefaults
{
    NSUserDefaults* defaults = [NSUserDefaults standardUserDefaults];
    NSArray* keyArray = [[self getMyAppDefaults] allKeys];
    for (NSString* key in keyArray) {
        [defaults removeObjectForKey:key];
    }
}

@end

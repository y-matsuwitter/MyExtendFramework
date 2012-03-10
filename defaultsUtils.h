//
//  defaultsUtils.h
//
//  Created by Sugamiya Yusuke on 12/02/18.
//

#import <Foundation/Foundation.h>

@interface defaultsUtils : NSObject

+ (defaultsUtils*)use;
- (id)get:(NSString*)aKey;
- (void)setAndSync:(id)target forKey:(NSString*)forKey;
- (void)removeAndSync:(NSString*)forKey;
- (NSDictionary*)getMyAppDefaults;
- (void)removeAllMyAppDefaults;

@end

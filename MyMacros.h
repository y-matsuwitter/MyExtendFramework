//
//  MyUtilityMacros.h
//
//  Created by Sugamiya Yusuke on 12/03/01.
//

#ifndef DNPP_MyMacros_h
#define DNPP_MyMacros_h

#ifndef __has_feature
    #define __has_feature(x) 0
#endif

#ifndef __has_extension
    #define __has_extension __has_feature // Compatibility with pre-3.0 compilers.
#endif

#if __has_feature(objc_arc) && __clang_major__ >= 3
    #define DNPP_ARC_ENABLED 1
#endif // __has_feature(objc_arc)

#if DNPP_ARC_ENABLED
    #define DNPP_RETAIN(xx) (xx)
    #define DNPP_RELEASE(xx)  xx = nil
    #define DNPP_AUTORELEASE(xx)  (xx)
    #define DNPP_RETAINCOUNT(xx)  (xx)
#else
    #define DNPP_RETAIN(xx)           [xx retain]
    #define DNPP_RELEASE(xx)          [xx release], xx = nil
    #define DNPP_AUTORELEASE(xx)      [xx autorelease]
    #define DNPP_RETAINCOUNT(xx)      [xx retainCount]
#endif


#ifdef DEBUG
    #define MyLog(format, ...) NSLog((@"(%s:%d) " format), __FUNCTION__, __LINE__, ##__VA_ARGS__)
    #define Reach MyLog(@"Reach")
    #define ShowObject(target) MyLog(@"%s => (%@)%@", #target,[target class] , target)
    #define ShowInt(target) MyLog(@"%s = > %d", #target, target)
    #define ShowFloat(target) MyLog(@"%s = > %f", #target, target)
    #define ShowBool(target) (target)?MyLog(@"%s = > YES", #target):MyLog(@"%s = > NO", #target)
    #define ViewRed(targetView) [targetView setBackgroundColor:[UIColor redColor]]
    #define ShowRetainCount(target) MyLog(@"%s's reference count => %d",#target,DNPP_RETAINCOUNT(target))
    #define ShowCGPoint(target) MyLog(@"%s => %@",#target , NSStringFromCGPoint(target))
    #define ShowCGSize(target) MyLog(@"%s => %@",#target , NSStringFromCGSize(target))
    #define ShowCGRect(target) MyLog(@"%s => %@",#target , NSStringFromCGRect(target))
    #define ShowUIViewBounds(target) ShowCGRect(target.bounds)
    #define ShowUIViewFrame(target) ShowCGRect(target.frame)
    #define ShowViewDetail(target) ShowObject([target performSelector:@selector(recursiveDescription)])
#else
    #define MyLog(format, ...) ;
    #define Reach ;
    #define ShowObject(target) ;
    #define ShowInt(target) ;
    #define ShowFloat(target) ;
    #define ShowBool(target) ;
    #define ViewRed(targetView) ;
    #define ShowRetainCount(target) ;
    #define ShowCGPoint(target) ;
    #define ShowCGSize(target) ;
    #define ShowSGRect(target) ;
    #define ShowUIViewBounds(target) ;
    #define ShowUIViewFrame(target) ;
    #define ShowViewDetail(target) ;
#endif

#define Destroy(target) DNPP_RELEASE(target), target = nil
#define SAFE_RELEASE(target) DNPP_RELEASE(target)
#define SAFE_AUTORELEASE(target) DNPP_AUTORELEASE(target), target = nil
#define DestroyWithLog(target) Destroy(target), MyLog(@"%s Destroyed", #target)

#define allocInitWithNibName(target) [[target alloc] initWithNibName:[NSString stringWithFormat:@"%s",#target] bundle:nil]

#define _null [NSNull null]

#define NSStringFromInt(target) [NSString stringWithFormat:@"%d", target]
#define NSStringFromFloat(target) [NSString stringWithFormat:@"%f", target]

#endif

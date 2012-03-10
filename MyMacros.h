//
//  MyUtilityMacros.h
//
//  Created by Sugamiya Yusuke on 12/03/01.
//

#ifndef DNPP_MyMacros_h
#define DNPP_MyMacros_h

#ifdef DEBUG
    #define MyLog(format, ...) NSLog((@"(%s:%d) " format), __FUNCTION__, __LINE__, ##__VA_ARGS__)
    #define Reach MyLog(@"Reach")
    #define ShowObject(target) MyLog(@"%s => (%@)%@", #target,[target class] , target)
    #define ShowInt(target) MyLog(@"%s = > %d", #target, target)
    #define ShowFloat(target) MyLog(@"%s = > %f", #target, target)
    #define ShowBool(target) (target)?MyLog(@"%s = > YES", #target):MyLog(@"%s = > NO", #target)
    #define ViewRed(targetView) [targetView setBackgroundColor:[UIColor redColor]]
    #define ShowRetainCount(target) MyLog(@"%s's reference count => %d",#target,[target retainCount])
    #define ShowCGPoint(target) MyLog(@"%s => %@",#target , NSStringFromCGPoint(target))
    #define ShowCGSize(target) MyLog(@"%s => %@",#target , NSStringFromCGSize(target))
    #define ShowCGRect(target) MyLog(@"%s => %@",#target , NSStringFromCGRect(target))
    #define ShowUIViewBounds(target) ShowCGRect(target.bounds)
    #define ShowUIViewFrame(target) ShowCGRect(target.frame)
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
#endif

#define Destroy(target) [target release], target = nil
#define DestroyWithLog(target) [target release], target = nil, MyLog(@"%s Destroyed", #target)

#define allocInitWithNibName(target) [[target alloc] initWithNibName:[NSString stringWithFormat:@"%s",#target] bundle:nil]

#define _null [NSNull null]

#endif

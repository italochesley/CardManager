//
//  CMNetwork.m
//  CardManager
//
//  Created by Italo Chesley on 8/24/16.
//  Copyright © 2016 Italo Chesley. All rights reserved.
//

#import "CMNetworkProvider.h"
#import <SystemConfiguration/SCNetworkReachability.h>

@interface CMNetworkProvider()

@end

@implementation CMNetworkProvider
+(BOOL)CheckNetworkStatus
{
    SCNetworkReachabilityFlags flags;
    SCNetworkReachabilityRef address;
    address = SCNetworkReachabilityCreateWithName(NULL, "www.google.com.br" );
    Boolean success = SCNetworkReachabilityGetFlags(address, &flags);
    CFRelease(address);
    
    bool canReach = success
    && !(flags & kSCNetworkReachabilityFlagsConnectionRequired)
    && (flags & kSCNetworkReachabilityFlagsReachable);
    
    return canReach;
}
@end

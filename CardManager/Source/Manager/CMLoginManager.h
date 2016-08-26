//
//  CMLogin.h
//  CardManager
//
//  Created by Italo Chesley on 8/24/16.
//  Copyright © 2016 Italo Chesley. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"

@interface CMLoginManager : NSObject
+ (void)postLogin:(NSString *)email withPassword:(NSString *)password onSuccess:(void (^)()) success
        onFailure:(void (^)()) failure;

@end

//
//  CMUser.m
//  CardManager
//
//  Created by Italo Chesley on 8/25/16.
//  Copyright © 2016 Italo Chesley. All rights reserved.
//

#import "CMUserProvider.h"

@interface CMUserProvider()

@end

@implementation CMUserProvider
+ (void)save:(NSDictionary *)users
{
    [[NSUserDefaults standardUserDefaults]setValuesForKeysWithDictionary:users];
    [[NSUserDefaults standardUserDefaults] synchronize];
}
@end

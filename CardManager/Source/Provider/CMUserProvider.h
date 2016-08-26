//
//  CMUser.h
//  CardManager
//
//  Created by Italo Chesley on 8/25/16.
//  Copyright © 2016 Italo Chesley. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CMUserProvider : NSObject
+ (void)save:(NSDictionary *)users;
@end

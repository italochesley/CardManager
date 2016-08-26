//
//  CMLogin.m
//  CardManager
//
//  Created by Italo Chesley on 8/24/16.
//  Copyright © 2016 Italo Chesley. All rights reserved.
//

#import "CMLoginManager.h"
#import "AFNetworking.h"
#import "CMUserProvider.h"

@interface CMLoginManager()

@end
static NSString * const urlLogin = @"http://cardmanagerserver.herokuapp.com/login";

@implementation CMLoginManager

+ (void)postLogin:(NSString *)email withPassword:(NSString *)password onSuccess:(void (^)()) success
        onFailure:(void (^)()) failure{
    
    NSDictionary *parametersDictionary = [NSDictionary dictionaryWithObjectsAndKeys:email, @"email", password, @"password", nil];

    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc]initWithSessionConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    [manager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [manager POST: urlLogin
       parameters:parametersDictionary
         progress:nil
          success:^(NSURLSessionTask *task, id responseObject)
            {
                NSDictionary *jsonDictionary = (NSDictionary *) responseObject;
                BOOL logged = [[jsonDictionary valueForKey:@"result"]isEqualToString:@"success"];
                NSString *message = [jsonDictionary valueForKey:@"message"];
                success(logged, message);
                
                //gravar tudo no UserDefaults
                if (logged) {
                    [CMUserProvider save:jsonDictionary];
                }
            }
          failure:^(NSURLSessionTask *task, NSError *error)
            {
                failure([error localizedDescription]);
            }
     ];
}


@end

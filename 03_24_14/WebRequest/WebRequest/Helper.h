//
//  Helper.h
//  twitterdemo
//
//  Created by Joseph on 3/28/13.
//  Copyright (c) 2013 Humboldt Technology Group, LLC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Helper : NSObject


{
    
}


+ (NSString *)hmacsha1:(NSString *)text key:(NSString *)secret;
+ (NSString *)bodyEncode:(NSString *) contents;
+ (NSString *) urlEncode:(NSString *) strURL;
+(NSString *)getCurrentDateUTC;
+(NSMutableDictionary *) ParseQueryString:(NSString *) queryString;

@end

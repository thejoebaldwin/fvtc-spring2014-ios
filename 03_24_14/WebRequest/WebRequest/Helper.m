//
//  Helper.m
//  twitterdemo
//
//  Created by Joseph on 3/28/13.
//  Copyright (c) 2013 Humboldt Technology Group, LLC. All rights reserved.
//

#import "Helper.h"

#import <CommonCrypto/CommonHMAC.h>
#import "Base64Transcoder.h"

@implementation Helper


+ (NSString *)hmacsha1:(NSString *)text key:(NSString *)secret {
    NSData *secretData = [secret dataUsingEncoding:NSUTF8StringEncoding];
    NSData *clearTextData = [text dataUsingEncoding:NSUTF8StringEncoding];
    unsigned char result[20];
	CCHmac(kCCHmacAlgSHA1, [secretData bytes], [secretData length], [clearTextData bytes], [clearTextData length], result);
    
    char base64Result[32];
    size_t theResultLength = 32;
    Base64EncodeData(result, 20, base64Result, &theResultLength);
    NSData *theData = [NSData dataWithBytes:base64Result length:theResultLength];
    
    NSString *base64EncodedResult = [[NSString alloc] initWithData:theData encoding:NSASCIIStringEncoding];
    
    return base64EncodedResult;
}

+ (NSString *)bodyEncode:(NSString *) contents {
    NSMutableString *output = [NSMutableString string];
    const unsigned char *source = (const unsigned char *)[contents UTF8String];
    int sourceLen = strlen((const char *)source);
    for (int i = 0; i < sourceLen; ++i) {
        const unsigned char thisChar = source[i];
        if (thisChar == ' '){
            [output appendString:@"+"];
        } else if (thisChar == '.' || thisChar == '-' || thisChar == '_' || thisChar == '~' ||
                   (thisChar >= 'a' && thisChar <= 'z') ||
                   (thisChar >= 'A' && thisChar <= 'Z') ||
                   (thisChar >= '0' && thisChar <= '9')) {
            [output appendFormat:@"%c", thisChar];
        } else {
            [output appendFormat:@"%%%02X", thisChar];
        }
    }
    return output;
}

+ (NSString *) urlEncode:(NSString *) strURL
{
    NSString *encodedString = [strURL stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    encodedString = (__bridge_transfer NSString *)CFURLCreateStringByAddingPercentEscapes(
                                                                                          NULL,
                                                                                          (__bridge CFStringRef)encodedString,
                                                                            NULL,
                                                            (CFStringRef)@"!*'\"();:%@&=/+$,?%#[]% ",
                                                                                          kCFStringEncodingUTF8);
    
       
    encodedString = [encodedString stringByReplacingOccurrencesOfString:@"%40"
                                         withString:@"%2540"];
    encodedString = [encodedString stringByReplacingOccurrencesOfString:@"%2B"
                                                             withString:@"%252B"];

    //encodedString = [encodedString stringByReplacingOccurrencesOfString:@"%2F"
      //                                                       withString:@"%252F"];
    return encodedString;
}


+(NSString *)getCurrentDateUTC
{
    float seconds = [[NSDate date] timeIntervalSince1970];
    NSString *t =  [NSString stringWithFormat:@"%i", (int) floor(seconds)];
    return t;
}

+(NSMutableDictionary *) ParseQueryString:(NSString *) queryString
{
    NSMutableDictionary *queryStringDictionary = [[NSMutableDictionary alloc] init];
    
    NSString *word = @"&";
    if ([queryString rangeOfString:word].location != NSNotFound) {
        NSArray *urlComponents = [queryString componentsSeparatedByString:@"&"];
        //Then populate the dictionary :
        
        for (NSString *keyValuePair in urlComponents)
        {
            NSArray *pairComponents = [keyValuePair componentsSeparatedByString:@"="];
            //THIS MIGHT BREAK SOMETHING ELSE?
                      NSString *value = @"";
            NSString *key = [pairComponents objectAtIndex:0];
              if ([pairComponents count] > 1) {
             value = [pairComponents objectAtIndex:1];
            
                       }
            
            [queryStringDictionary setObject:value forKey:key];

        }
        
        
    }
    
    
    return queryStringDictionary;
    
}



@end

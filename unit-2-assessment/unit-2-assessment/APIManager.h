//
//  APIManager.h
//  unit-2-assessment
//
//  Created by Zoufishan Mehdi on 10/17/15.
//  Copyright © 2015 Michael Kavouras. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface APIManager : NSObject



+(void) GETRequestWithURL:(NSURL *)URL
        completionHandler:(void(^)(NSData *, NSURLResponse *, NSError *))
completionBlock;


@end

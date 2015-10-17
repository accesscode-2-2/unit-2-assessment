//
//  APIMomager.h
//  unit-2-assessment
//
//  Created by Natalia Estrella on 10/17/15.
//  Copyright © 2015 Michael Kavouras. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface APIMomager : NSObject

+ (void)GETRequestWithURL:(NSURL *)URL
        completionHandler:(void(^)(NSData *data, NSURLResponse *response, NSError *error)) completionHandler ;


@end

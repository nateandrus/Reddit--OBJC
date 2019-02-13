//
//  DVMPost.h
//  Reddit_OBJ_GP
//
//  Created by Nathan Andrus on 2/13/19.
//  Copyright © 2019 Nathan Andrus. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DVMPost : NSObject

@property (nonatomic, copy, readonly) NSString *title;
@property (nonatomic, readonly) NSInteger ups;
@property (nonatomic, readonly) NSInteger commentCount;

- (instancetype)initWithTitle: (NSString *)title
                          ups: (NSInteger)ups
                 commentCount: (NSInteger)commentCount;

- (instancetype)initWithDictionary: (NSDictionary *)dictionary;

@end


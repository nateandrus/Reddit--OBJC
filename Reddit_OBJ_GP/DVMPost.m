//
//  DVMPost.m
//  Reddit_OBJ_GP
//
//  Created by Nathan Andrus on 2/13/19.
//  Copyright © 2019 Nathan Andrus. All rights reserved.
//

#import "DVMPost.h"

@implementation DVMPost

- (instancetype)initWithTitle:(NSString *)title ups:(NSInteger)ups commentCount:(NSInteger)commentCount
{
    self = [super init];
    if (self) {
        _title = title;
        _ups = ups;
        _commentCount = commentCount;
    }
    return self;
}

- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    NSDictionary *dataDictionary = dictionary[@"data"];
    
    NSString *title = dataDictionary[[DVMPost titleKey]];
    NSInteger ups = [dataDictionary[[DVMPost upsKey]]integerValue];
    NSInteger commentCount = [dataDictionary[[DVMPost commentCountKey]]integerValue];
    
    return [self initWithTitle:title ups:ups commentCount:commentCount];
}

//KEYS
+ (NSString *)titleKey { return @"title"; }
+ (NSString *)upsKey { return @"ups"; }
+ (NSString *)commentCountKey { return @"num_comments"; }

@end

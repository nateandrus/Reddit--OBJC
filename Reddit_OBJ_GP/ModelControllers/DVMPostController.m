//
//  DVMPostController.m
//  Reddit_OBJ_GP
//
//  Created by Nathan Andrus on 2/13/19.
//  Copyright © 2019 Nathan Andrus. All rights reserved.
//

#import "DVMPostController.h"
#import "DVMPost.h"

@implementation DVMPostController

+(instancetype)sharedController
{
    static DVMPostController *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[DVMPostController alloc] init];
    });
    return sharedInstance;
}

- (NSURL *)baseURL { return [NSURL URLWithString:@"https://www.reddit.com/r/"]; }

- (void)fetchPostWithSearchTerm:(NSString *)searchTerm completion:(void (^)(NSArray<DVMPost *> *, NSError *))completion
{
    NSURL *searchURL = [self baseURL];
    searchURL = [searchURL URLByAppendingPathComponent:searchTerm];
    searchURL = [searchURL URLByAppendingPathExtension:@"json"];
    
    [[[NSURLSession sharedSession] dataTaskWithURL:searchURL completionHandler:^(NSData *  data, NSURLResponse *  response, NSError *  error) {
        if (error) {
            NSLog(@"Error receiving data from URL:%@", error.localizedDescription);
            completion(nil,nil);
            return;
        }
        if (!data) {
            NSLog(@"Error: no data");
            completion(nil,nil);
            return;
        }
        NSDictionary *topLevelDictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error: &error];
        
        if (!topLevelDictionary || ![topLevelDictionary isKindOfClass:[NSDictionary class]]) {
            NSLog(@"This just isn't going to work out...");
        }
        
        NSDictionary *postDictionaries = topLevelDictionary[@"data"];
        NSArray *childrensArray = postDictionaries[@"children"];
        NSMutableArray *postsArray = [NSMutableArray array];
        
        for (NSDictionary *dataDictionary in childrensArray) {
            
            DVMPost *newPost = [[DVMPost alloc] initWithDictionary:dataDictionary];
            [postsArray addObject:newPost];
        }
        completion(postsArray, nil);
        
    }]resume ];

}

@end

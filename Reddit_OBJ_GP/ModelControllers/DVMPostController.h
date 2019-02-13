//
//  DVMPostController.h
//  Reddit_OBJ_GP
//
//  Created by Nathan Andrus on 2/13/19.
//  Copyright © 2019 Nathan Andrus. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DVMPost.h"


@interface DVMPostController : NSObject

+ (instancetype)sharedController;

- (void)fetchPostWithSearchTerm:(NSString *)searchTerm completion: (void(^) (NSArray<DVMPost *> *posts, NSError *error))completion;

@end


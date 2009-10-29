//
//  NSDateAdditions.h
//  JobStairs
//
//  Created by Jens Kohl on 29.10.09.
//  Copyright 2009 Philipps-Universität Marburg. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface NSDate (JKAdditions)
+ (NSDate*)dateWithToday;
- (NSString*)formatRelativeTime;
@end

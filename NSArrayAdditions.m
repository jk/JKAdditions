//
//  NSArrayAdditions.m
//  JobStairs
//
//  Created by Jens Kohl on 23.02.10.
//  Copyright 2010 Jens Kohl. All rights reserved.
//

#import "NSArrayAdditions.h"


@implementation NSArray (JKAdditions)

- (NSString*)asStringWithDelimiter:(NSString *)delimiter {
	NSMutableString *string = [NSMutableString string];
	NSUInteger countdown = [self count];

	for (id item in self) {
		[string appendString:[item description]];
		countdown--;
		if (countdown > 0) {
			[string appendString:delimiter];
		}
	}

	return [NSString stringWithString:string];
}

@end

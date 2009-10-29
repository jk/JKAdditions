//
//  NSStringAdditions.m
//  JobStairs
//
//  Created by Jens Kohl on 29.10.09.
//  Copyright 2009 Philipps-Universität Marburg. All rights reserved.
//

#import "NSStringAdditions.h"


@implementation NSString (JKAdditions)

- (BOOL)isWhitespace {
	NSCharacterSet* whitespace = [NSCharacterSet whitespaceAndNewlineCharacterSet];
	for (NSInteger i = 0; i < self.length; ++i) {
		unichar c = [self characterAtIndex:i];
		if (![whitespace characterIsMember:c]) {
			return NO;
		}
	}
	return YES;
}

- (BOOL)isEmptyOrWhitespace {
	return !self.length || 
	![self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]].length;
}

@end

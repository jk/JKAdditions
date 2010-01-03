//
//  NSDateAdditions.m
//  JobStairs
//
//  Created by Jens Kohl on 29.10.09.
//  Copyright 2009 Milch und Zucker AG. All rights reserved.
//

#import "NSDateAdditions.h"

#define JK_MINUTE 60
#define JK_HOUR (60*JK_MINUTE)
#define JK_DAY (24*JK_HOUR)
#define JK_WEEK (7*JK_DAY)
#define JK_MONTH (30.5*JK_DAY)
#define JK_YEAR (365*JK_DAY)


@implementation NSDate (JKAdditions)

+ (NSDate*)dateWithToday {
	NSDateFormatter* formatter = [[[NSDateFormatter alloc] init] autorelease];
	formatter.dateFormat = @"yyyy-d-M";
	
	NSString* time = [formatter stringFromDate:[NSDate date]];
	NSDate* date = [formatter dateFromString:time];
	return date;
}

- (NSDate*)dateAtMidnight {
	NSDateFormatter* formatter = [[[NSDateFormatter alloc] init] autorelease];
	formatter.dateFormat = @"yyyy-d-M";
	
	NSString* time = [formatter stringFromDate:self];
	NSDate* date = [formatter dateFromString:time];
	return date;
}

- (NSString*)formatTime {
	static NSDateFormatter* formatter = nil;
	if (!formatter) {
		formatter = [[NSDateFormatter alloc] init];
		formatter.dateFormat = NSLocalizedString(@"h:mm a", @"Date format: 1:05 pm");
//		formatter.locale = NSCurrentLocale();
	}
	return [formatter stringFromDate:self];
}

- (NSString*)formatDate {
	static NSDateFormatter* formatter = nil;
	if (!formatter) {
		formatter = [[NSDateFormatter alloc] init];
		formatter.dateFormat =
		NSLocalizedString(@"EEEE, LLLL d, YYYY", @"Date format: Monday, July 27, 2009");
//		formatter.locale = TTCurrentLocale();
	}
	return [formatter stringFromDate:self];
}

- (NSString*)formatShortTime {
	NSTimeInterval diff = abs([self timeIntervalSinceNow]);
	if (diff < JK_DAY) {
		return [self formatTime];
	} else if (diff < JK_WEEK) {
		static NSDateFormatter* formatter = nil;
		if (!formatter) {
			formatter = [[NSDateFormatter alloc] init];
			formatter.dateFormat = NSLocalizedString(@"EEEE", @"Date format: Monday");
//			formatter.locale = TTCurrentLocale();
		}
		return [formatter stringFromDate:self];
	} else {
		static NSDateFormatter* formatter = nil;
		if (!formatter) {
			formatter = [[NSDateFormatter alloc] init];
			formatter.dateFormat = NSLocalizedString(@"M/d/yy", @"Date format: 7/27/09");
//			formatter.locale = TTCurrentLocale();
		}
		return [formatter stringFromDate:self];
	}
}

- (NSString*)formatDateTime {
	NSTimeInterval diff = abs([self timeIntervalSinceNow]);
	if (diff < JK_DAY) {
		return [self formatTime];
	} else if (diff < JK_WEEK) {
		static NSDateFormatter* formatter = nil;
		if (!formatter) {
			formatter = [[NSDateFormatter alloc] init];
			formatter.dateFormat = NSLocalizedString(@"EEE h:mm a", @"Date format: Mon 1:05 pm");
//			formatter.locale = TTCurrentLocale();
		}
		return [formatter stringFromDate:self];
	} else {
		static NSDateFormatter* formatter = nil;
		if (!formatter) {
			formatter = [[NSDateFormatter alloc] init];
			formatter.dateFormat = NSLocalizedString(@"MMM d h:mm a", @"Date format: Jul 27 1:05 pm");
//			formatter.locale = TTCurrentLocale();
		}
		return [formatter stringFromDate:self];
	}
}

- (NSString*)formatRelativeTime {
	NSTimeInterval elapsed = abs([self timeIntervalSinceNow]);
	if (elapsed <= 1) {
		return NSLocalizedString(@"just a moment ago", @"Time string: just a moment ago");
	} else if (elapsed < JK_MINUTE) {
		int seconds = (int)(elapsed);
		return [NSString stringWithFormat:NSLocalizedString(@"%d seconds ago", @"Time string: x seconds ago"), seconds];
	} else if (elapsed < 2*JK_MINUTE) {
		return NSLocalizedString(@"about a minute ago", @"Time string: about a minute ago");
	} else if (elapsed < JK_HOUR) {
		int mins = (int)(elapsed/JK_MINUTE);
		return [NSString stringWithFormat:NSLocalizedString(@"%d minutes ago", @"Time string: x minutes ago"), mins];
	} else if (elapsed < JK_HOUR*1.5) {
		return NSLocalizedString(@"about an hour ago", @"Time string: about an hour ago");
	} else if (elapsed < JK_DAY) {
		int hours = (int)((elapsed+JK_HOUR/2)/JK_HOUR);
		return [NSString stringWithFormat:NSLocalizedString(@"%d hours ago", @"Time string: x hours ago"), hours];
	} else {
		return [self formatDateTime];
	}
}

@end

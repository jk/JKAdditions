//
//  NSStringAdditions.h
//  JobStairs
//
//  Created by Jens Kohl on 29.10.09.
//  Copyright 2009 Milch und Zucker AG. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface NSString (JKAdditions)

/**
 * @brief If there are any whitespaces in the string, this method returns YES
 * @see Three20
 */
- (BOOL)isWhitespace;
/**
 * @brief Returns YES if the string is empty or if it only consists of whitespaces
 * @see Three20
 */
- (BOOL)isEmptyOrWhitespace;

@end

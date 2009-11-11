//
//  NSManagedObjectContextAdditions.h
//  CD Test
//
//  Created by Jens Kohl on 11.11.09.
//  Copyright 2009 milch & zucker AG. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface NSManagedObjectContext (JKAdditions)
-(void)deleteAllObjectsForEntity:(NSString *)entityName;

@end

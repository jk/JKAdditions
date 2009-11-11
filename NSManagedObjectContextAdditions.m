//
//  NSManagedObjectContextAdditions.m
//  CD Test
//
//  Created by Jens Kohl on 11.11.09.
//  Copyright 2009 milch & zucker AG. All rights reserved.
//

#import "NSManagedObjectContextAdditions.h"


@implementation NSManagedObjectContext (JKAdditions)

-(void)deleteAllObjectsForEntity:(NSString *)entityName {
	NSManagedObjectContext *context = self;
	NSFetchRequest *allEntities = [[NSFetchRequest alloc] init];
	[allEntities setEntity:[NSEntityDescription entityForName:entityName inManagedObjectContext:context]];
	
	NSError *error = nil;
	NSArray *allObjects = [context executeFetchRequest:allEntities error:&error];
	[allEntities release];
	
	for (NSManagedObject *object in allObjects) {
		[context deleteObject:object];
	}
}

@end

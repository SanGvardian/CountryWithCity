//
//  Country+CoreDataProperties.m
//  
//
//  Created by Alexander on 10.05.17.
//
//

#import "Country+CoreDataProperties.h"

@implementation Country (CoreDataProperties)

+ (NSFetchRequest<Country *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"Country"];
}

@dynamic name;
@dynamic cities;

@end

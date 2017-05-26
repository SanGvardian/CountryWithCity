//
//  Country+CoreDataProperties.m
//  
//
//  Created by Alexander on 18.05.17.
//
//  This file was automatically generated and should not be edited.
//

#import "Country+CoreDataProperties.h"

@implementation Country (CoreDataProperties)

+ (NSFetchRequest<Country *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"Country"];
}

@dynamic name;
@dynamic cities;

@end

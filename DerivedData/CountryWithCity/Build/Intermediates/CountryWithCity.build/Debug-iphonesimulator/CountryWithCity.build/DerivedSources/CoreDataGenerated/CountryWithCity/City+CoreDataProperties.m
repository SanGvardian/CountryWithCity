//
//  City+CoreDataProperties.m
//  
//
//  Created by Alexander on 18.05.17.
//
//  This file was automatically generated and should not be edited.
//

#import "City+CoreDataProperties.h"

@implementation City (CoreDataProperties)

+ (NSFetchRequest<City *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"City"];
}

@dynamic name;
@dynamic country;

@end

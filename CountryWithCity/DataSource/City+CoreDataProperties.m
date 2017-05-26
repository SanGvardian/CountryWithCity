//
//  City+CoreDataProperties.m
//  
//
//  Created by Alexander on 26.04.17.
//
//

#import "City+CoreDataProperties.h"

@implementation City (CoreDataProperties)

+ (NSFetchRequest<City *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"City"];
}

@dynamic name;
@dynamic country;

@end

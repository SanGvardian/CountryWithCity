//
//  City+CoreDataProperties.h
//  
//
//  Created by Alexander on 18.05.17.
//
//  This file was automatically generated and should not be edited.
//

#import "City+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface City (CoreDataProperties)

+ (NSFetchRequest<City *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *name;
@property (nullable, nonatomic, retain) Country *country;

@end

NS_ASSUME_NONNULL_END

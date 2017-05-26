//
//  City+CoreDataProperties.h
//  
//
//  Created by Alexander on 26.04.17.
//
//

#import "City+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface City (CoreDataProperties)

+ (NSFetchRequest<City *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *name;
@property (nullable, nonatomic, retain) Country *country;

@end

NS_ASSUME_NONNULL_END

//
//  Country+CoreDataProperties.h
//  
//
//  Created by Alexander on 18.05.17.
//
//  This file was automatically generated and should not be edited.
//

#import "Country+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface Country (CoreDataProperties)

+ (NSFetchRequest<Country *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *name;
@property (nullable, nonatomic, retain) NSOrderedSet<City *> *cities;

@end

@interface Country (CoreDataGeneratedAccessors)

- (void)insertObject:(City *)value inCitiesAtIndex:(NSUInteger)idx;
- (void)removeObjectFromCitiesAtIndex:(NSUInteger)idx;
- (void)insertCities:(NSArray<City *> *)value atIndexes:(NSIndexSet *)indexes;
- (void)removeCitiesAtIndexes:(NSIndexSet *)indexes;
- (void)replaceObjectInCitiesAtIndex:(NSUInteger)idx withObject:(City *)value;
- (void)replaceCitiesAtIndexes:(NSIndexSet *)indexes withCities:(NSArray<City *> *)values;
- (void)addCitiesObject:(City *)value;
- (void)removeCitiesObject:(City *)value;
- (void)addCities:(NSOrderedSet<City *> *)values;
- (void)removeCities:(NSOrderedSet<City *> *)values;

@end

NS_ASSUME_NONNULL_END

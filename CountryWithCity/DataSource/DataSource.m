//
//  DataSource.m
//  CountryWithCity
//
//  Created by Alexander on 24.04.17.
//  Copyright © 2017 Alexander. All rights reserved.
//

#import "CountryTableViewController.h"

@interface DataSource ()

@end

@implementation DataSource

+ (instancetype)sharedInstance
{
    static DataSource *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[DataSource alloc] init];
    });
    return sharedInstance;
}

- (void) loadData:(myCompletion) compblock {
    
    AFHTTPSessionManager* manager = [AFHTTPSessionManager manager];
    
    NSString* path = [NSString stringWithFormat:@"https://raw.githubusercontent.com/David-Haim/CountriesToCitiesJSON/master/countriesToCities.json"];
    
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    [manager GET:path
      parameters:nil
        progress:nil
         success:^(NSURLSessionTask *task, id responseObject) {
             
             NSError* error;
             NSDictionary* response = [NSJSONSerialization JSONObjectWithData:responseObject
                                                                      options:kNilOptions
                                                                        error:&error];
             
//             NSLog(@"JSON: %@", response);
             NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithDictionary:response];
             [dict removeObjectForKey:@""];
             
             NSArray *countriesNames = dict.allKeys;
             NSArray *countriesInfo  = dict.allValues;
             
             NSManagedObjectContext *context = [self _defaultContext];
             
             for (int i = 0; i < countriesNames.count; i++) {
                 
                 Country* currentCountry = [NSEntityDescription insertNewObjectForEntityForName:@"Country" inManagedObjectContext:context];
                
                    currentCountry.name = countriesNames[i];
               
                 NSArray  *countryInfo = countriesInfo[i];
                 
                 for (int j = 0; j < countryInfo.count; j++) {
                     
                     City *city = [NSEntityDescription insertNewObjectForEntityForName:@"City" inManagedObjectContext:context];
                    
                     NSString *cityInfo = countryInfo[j];

                         city.name = cityInfo;
                                                 
                         city.country = currentCountry;
                 }
             }
             
             if (context == nil) {
                 
                 [context save:&error];
                 
             }
             compblock(YES);
         }
         failure:^(NSURLSessionTask *operation, NSError *error) {
             NSLog(@"Error: %@", error);
         }];
    
}

- (NSArray<Country*>*) loadContries {
    NSManagedObjectContext *context = [self _defaultContext];
    
    NSEntityDescription *descr = [NSEntityDescription entityForName:@"Country"
                                             inManagedObjectContext:context];
    
    NSFetchRequest *request = [NSFetchRequest new];

    [request setEntity:descr];
    [request setReturnsObjectsAsFaults:NO];
   
    NSError *error = nil;
    NSArray *loadListOfCountries = [context executeFetchRequest:request error:&error];
//    NSLog(@"%lu",(unsigned long)loadListOfCountries.count);
    return loadListOfCountries;
}

- (NSManagedObjectContext*)_defaultContext
{
    AppDelegate *appDelegate =  (AppDelegate*)[[UIApplication sharedApplication] delegate];
    NSManagedObjectContext *context = appDelegate.persistentContainer.viewContext;
    
    return context;
}


@end

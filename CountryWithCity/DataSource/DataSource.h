//
//  DataSource.h
//  CountryWithCity
//
//  Created by Alexander on 24.04.17.
//  Copyright © 2017 Alexander. All rights reserved.
//

#import <Foundation/Foundation.h>


typedef void(^myCompletion)(BOOL);

@interface DataSource : NSObject

@property (nonatomic, strong) NSManagedObjectContext *context;

- (void) loadData:(myCompletion) compblock;
- (NSArray*) loadContries;

+ (instancetype)sharedInstance;

@end

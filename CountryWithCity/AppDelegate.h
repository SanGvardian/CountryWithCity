//
//  AppDelegate.h
//  CountryWithCity
//
//  Created by Alexander on 24.04.17.
//  Copyright © 2017 Alexander. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;
@property (nonatomic, strong) UINavigationController* navigationController;

- (void)saveContext;


@end


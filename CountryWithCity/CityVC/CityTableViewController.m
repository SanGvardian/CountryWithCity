//
//  CityTableViewController.m
//  CountryWithCity
//
//  Created by Alexander on 16.05.17.
//  Copyright © 2017 Alexander. All rights reserved.
//

#import "CityTableViewController.h"
#import "CityOfCountriesTableViewCell.h"
#import "CountryTableViewController.h"
#import "CityInfoTableViewController.h"

@interface CityTableViewController ()

@end

@implementation CityTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView reloadData];

}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return [self.country.cities.array count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    CityOfCountriesTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CellCity"];

    
    City *city = [[self.country.cities.array
                   sortedArrayUsingComparator:^NSComparisonResult(Country*  obj1, Country*  obj2) {
        return [(NSString *)obj1.name compare:(NSString *)obj2.name];
    }]
                  objectAtIndex:indexPath.row];
    
 
    NSString* str = [NSString stringWithCString:[city.name cStringUsingEncoding:NSUTF8StringEncoding] encoding:NSUTF8StringEncoding];
   
    cell.cityLabel.text = str;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    City *city = [[self.country.cities.array
                   sortedArrayUsingComparator:^NSComparisonResult(Country*  obj1, Country*  obj2) {
                       return [(NSString *)obj1.name compare:(NSString *)obj2.name];
                   }]
                  objectAtIndex:indexPath.row];
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    CityInfoTableViewController *cityInfo = (CityInfoTableViewController*)[storyboard instantiateViewControllerWithIdentifier:@"cityInfo"];
    cityInfo.city = city ;
    [self.navigationController pushViewController:cityInfo animated:YES];
    
}
@end

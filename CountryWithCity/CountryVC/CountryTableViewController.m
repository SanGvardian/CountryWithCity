//
//  CountryTableViewController.m
//  CountryWithCity
//
//  Created by Alexander on 28.04.17.
//  Copyright © 2017 Alexander. All rights reserved.
//

#import "CountryTableViewController.h"
#import "CityTableViewCell.h"
#import "CityTableViewController.h"


@interface CountryTableViewController ()

@property (strong, nonatomic) NSArray <Country*> *countries;

@end

@implementation CountryTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[DataSource sharedInstance] loadData:^(BOOL finished) {
        if(finished) {
            self.countries = [[[DataSource sharedInstance] loadContries] sortedArrayUsingComparator:^NSComparisonResult(Country*  obj1, Country*  obj2) {
                return [(NSString *)obj1.name compare:(NSString *)obj2.name];
            }];
            
            [self.tableView reloadData];
        }
    }];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return [self.countries count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    CityTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    
    Country *country = self.countries[indexPath.row];
  
    cell.countryLabel.text = country.name;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    Country *country = self.countries[indexPath.row];

    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    CityTableViewController *cityVC = (CityTableViewController*)[storyboard instantiateViewControllerWithIdentifier:@"cityVC"];
    
    cityVC.country = country;
    
    [self.navigationController pushViewController:cityVC animated:YES];
    
}

@end

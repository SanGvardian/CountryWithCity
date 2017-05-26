//
//  CityInfoTableViewController.m
//  CountryWithCity
//
//  Created by Alexander on 18.05.17.
//  Copyright © 2017 Alexander. All rights reserved.
//

#import "CityInfoTableViewController.h"
#import "CityInfoTableViewCell.h"

@interface CityInfoTableViewController ()

@property (nonatomic, strong)  NSDictionary* response;
@property (nonatomic, strong) NSDictionary* cityInfo;

@end

@implementation CityInfoTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadNews:^(BOOL finished) {
        if(finished) {
          [self.tableView reloadData];
    }
    }];
}

- (void)loadNews: (myCompletion) compblock {
    
//    NSLog(@"%@",self.city.name);
    
    NSString *string = self.city.name;
    
    const char *c = [string cStringUsingEncoding:NSISOLatin1StringEncoding];
    
    NSString *newString = [[NSString alloc]initWithCString:c encoding:NSUTF8StringEncoding];
    
//    NSLog(@"%@",newString);
    
    NSString *encoded1 = [newString stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    
//    NSLog(@"encode1 = %@",encoded1);
    
    NSString *path = [NSString stringWithFormat:@"%@%@%@", kApiBaseUrl, encoded1, kApiInfo];
    
//    NSLog(@"%@",path);
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    [manager GET:path
      parameters:nil
        progress:nil
         success:^(NSURLSessionTask *task, NSData* responseObject) {
             NSError* error;
             NSDictionary* response =
             [NSJSONSerialization JSONObjectWithData:responseObject
                                             options:NSJSONReadingMutableLeaves
                                               error:&error];

             if ([[response valueForKey:@"geonames"]  isEqual: @[]]) {
                 
                 self.cityInfo = @{@"summary":@"No info",
                                   @"title":@"No info",
                                   @"thumbnailImg":@[]};
             
             } else {
                 self.cityInfo = [[response objectForKey:@"geonames"] objectAtIndex:0];
                 
             }
//             NSLog(@"%@", self.cityInfo);
             

             compblock(YES);
         }
         failure:^(NSURLSessionTask *operation, NSError *error) {
             NSLog(@"Error: %@", error);
         }];
    
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
   
    CityInfoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"infoCell" forIndexPath:indexPath];
    
    if (self.cityInfo != nil) {
        
        cell.cityInfoTextView.text = [self.cityInfo valueForKey:@"summary"];
        cell.cityNameLabel.text = [self.cityInfo valueForKey:@"title"];
    
        if (!([[self.cityInfo valueForKey:@"thumbnailImg"]isEqual: @[]])) {
        
        NSData *imageData = [NSData dataWithContentsOfURL:[NSURL URLWithString:[self.cityInfo valueForKey:@"thumbnailImg"]]];
        
            if (imageData != nil) {
            
                cell.cityInfoImageView.image = [UIImage imageWithData:imageData];
            
            } else {
            
            cell.cityInfoImageView.image = [UIImage imageNamed:@"error"];
            
            }
            
        } else {
            
            cell.cityInfoImageView.image = [UIImage imageNamed:@"error"];
        }
    } else {
        
        cell.cityInfoTextView.text = @"No info";
        cell.cityNameLabel.text = @"No info";
        cell.cityInfoImageView.image = [UIImage imageNamed:@"error"];
    }
    return cell;
}



@end

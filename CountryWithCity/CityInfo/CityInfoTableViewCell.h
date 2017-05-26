//
//  CityInfoTableViewCell.h
//  CountryWithCity
//
//  Created by Alexander on 18.05.17.
//  Copyright © 2017 Alexander. All rights reserved.
//



@interface CityInfoTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *cityInfoImageView;
@property (weak, nonatomic) IBOutlet UILabel *cityNameLabel;
@property (weak, nonatomic) IBOutlet UITextView *cityInfoTextView;

@end

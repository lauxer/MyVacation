//
//  HotelTableViewCell.h
//  MyVacation
//
//  Created by Cyril Lauxerrois on 06/07/2017.
//  Copyright © 2017 Cyril Lauxerrois. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HotelTableViewCell : UITableViewCell

@property (nonatomic, strong) IBOutlet UILabel      *hotelLabel;
@property (nonatomic, strong) IBOutlet UILabel      *hotelLocation;
@property (nonatomic, strong) IBOutlet UILabel      *hotelReview;

@end

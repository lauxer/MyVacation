//
//  WeekendTableViewCell.h
//  MyVacation
//
//  Created by Cyril Lauxerrois on 06/07/2017.
//  Copyright © 2017 Cyril Lauxerrois. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WeekendTableViewCell : UITableViewCell

@property (nonatomic, strong) IBOutlet UILabel      *weekendLabel;
@property (nonatomic, strong) IBOutlet UILabel      *themeLabel;
@property (nonatomic, strong) IBOutlet UIImageView  *img;

@end

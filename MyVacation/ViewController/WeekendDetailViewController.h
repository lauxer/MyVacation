//
//  WeekendDetailViewController.h
//  MyVacation
//
//  Created by Cyril Lauxerrois on 06/07/2017.
//  Copyright © 2017 Cyril Lauxerrois. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Weekend.h"
#import "Hotel.h"

@interface WeekendDetailViewController : UIViewController

@property (nonatomic, weak) Hotel                   *hotel;
@property (nonatomic, weak) Weekend                 *weekend;

@property (nonatomic, weak) IBOutlet UIImageView    *imgView;
@property (nonatomic, weak) IBOutlet UILabel        *hotelLabel;
@property (nonatomic, weak) IBOutlet UILabel        *addressLabel;
@property (nonatomic, weak) IBOutlet UILabel        *themeLabel;
@property (nonatomic, weak) IBOutlet UITextView     *introView;
@property (nonatomic, weak) IBOutlet UILabel        *sellPriceLabel;
@property (nonatomic, weak) IBOutlet UILabel        *refPriceLabel;
@property (nonatomic, weak) IBOutlet UILabel        *promoLabel;
@property (nonatomic, weak) IBOutlet UILabel        *weekendLabel;

@end

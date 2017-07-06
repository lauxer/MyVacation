//
//  HotelListViewController.h
//  MyVacation
//
//  Created by Cyril Lauxerrois on 06/07/2017.
//  Copyright © 2017 Cyril Lauxerrois. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HotelListViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) IBOutlet UITableView                *tableView;
@property (nonatomic, strong) IBOutlet UIActivityIndicatorView    *indicator;

@end

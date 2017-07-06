//
//  HotelListViewController.m
//  MyVacation
//
//  Created by Cyril Lauxerrois on 06/07/2017.
//  Copyright © 2017 Cyril Lauxerrois. All rights reserved.
//

#import "HotelListViewController.h"
#import "HotelManager.h"
#import "HotelTableViewCell.h"
#import "WeekendTableViewCell.h"
#import "WeekendDetailViewController.h"

#define _HOTEL_CELL @"hotelCell"
#define _WEEKEND_CELL @"weekendCell"
#define _WEEKENDDETAIL_SEGUE @"showWeekendDetail"


@interface HotelListViewController () <HotelManagerDelegate>

@property (nonatomic, strong) HotelManager      *hotelManager;

@end


@implementation HotelListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.hotelManager = [HotelManager sharedManager];
    self.hotelManager.delegate = self;
    [self.hotelManager requestHotels];
    
    [self.indicator startAnimating];
    self.tableView.hidden = YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.hotelManager.hotelList.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return ((Hotel *)self.hotelManager.hotelList[section]).weekends.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 60;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    WeekendTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:_WEEKEND_CELL forIndexPath:indexPath];
    Hotel   *hotel = self.hotelManager.hotelList[indexPath.section];
    Weekend *weekend = hotel.weekends[indexPath.row];
    
    cell.weekendLabel.text  = weekend.label;
    cell.themeLabel.text    = weekend.theme;
    [cell.img setImage:[UIImage imageWithData:weekend.imgData]];
    
    return cell;
}



#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 60;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {

    
    HotelTableViewCell  *cell = [tableView dequeueReusableCellWithIdentifier:_HOTEL_CELL];
    Hotel               *hotel = self.hotelManager.hotelList[section];
    
    cell.hotelLabel.text    = hotel.label;
    cell.hotelLocation.text = hotel.location;
    cell.hotelReview.text   = [NSString stringWithFormat:@"%.2f (%ld)", hotel.reviewAverage.doubleValue, (long)hotel.reviewCount];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
     [self performSegueWithIdentifier:_WEEKENDDETAIL_SEGUE sender:indexPath];
}



#pragma mark - Navigation


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if([segue.identifier isEqualToString:_WEEKENDDETAIL_SEGUE]) {
        NSIndexPath *indexPath = (NSIndexPath *)sender;
        
        Hotel   *hotel = self.hotelManager.hotelList[indexPath.section];
        Weekend *weekend = hotel.weekends[indexPath.row];
        WeekendDetailViewController *detailController = (WeekendDetailViewController *)segue.destinationViewController;
        
        detailController.hotel      = hotel;
        detailController.weekend    = weekend;
    }
}



#pragma mark - HotelManagerDelegate

- (void)handleSuccess {
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.tableView reloadData];
        [self.indicator stopAnimating];
        self.indicator.hidden = YES;
        self.tableView.hidden = NO;
    });
}




@end

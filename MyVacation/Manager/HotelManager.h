//
//  HotelManager.h
//  MyVacation
//
//  Created by Cyril Lauxerrois on 06/07/2017.
//  Copyright © 2017 Cyril Lauxerrois. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Hotel.h"
#import "Weekend.h"


@protocol HotelManagerDelegate <NSObject>

- (void)handleSuccess;

@end



@interface HotelManager : NSObject

@property (nonatomic, weak) id<HotelManagerDelegate> delegate;
@property (nonatomic, strong) NSArray      *hotelList;

+ (id)sharedManager;
- (void)requestHotels;


@end

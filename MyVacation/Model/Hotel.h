//
//  Hotel.h
//  MyVacation
//
//  Created by Cyril Lauxerrois on 06/07/2017.
//  Copyright © 2017 Cyril Lauxerrois. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Hotel : NSObject

@property (nonatomic, assign) NSInteger         hotelId;
@property (nonatomic, strong) NSString          *label;
@property (nonatomic, strong) NSString          *location;
@property (nonatomic, strong) NSNumber          *reviewAverage;
@property (nonatomic, assign) NSInteger         reviewCount;
@property (nonatomic, strong) NSArray           *weekends;

@end

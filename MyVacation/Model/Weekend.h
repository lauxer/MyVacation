//
//  Weekend.h
//  MyVacation
//
//  Created by Cyril Lauxerrois on 06/07/2017.
//  Copyright © 2017 Cyril Lauxerrois. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Hotel.h"

@interface Weekend : NSObject

@property (nonatomic, assign) NSInteger         weekendId;
@property (nonatomic, strong) NSString          *label;
@property (nonatomic, strong) NSString          *theme;
@property (nonatomic, strong) NSData            *imgData;
@property (nonatomic, strong) NSString          *intro;
@property (nonatomic, strong) NSNumber          *sellPrice;
@property (nonatomic, strong) NSNumber          *refPrice;
@property (nonatomic, strong) NSNumber          *promo;

@end

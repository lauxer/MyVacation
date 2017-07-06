//
//  HotelManager.m
//  MyVacation
//
//  Created by Cyril Lauxerrois on 06/07/2017.
//  Copyright © 2017 Cyril Lauxerrois. All rights reserved.
//

#import "HotelManager.h"
#import "AppDelegate.h"


#define _API_URL @"http://api.weekendesk.com/api/weekends.json?orderBy=priceQuality&locale=fr_FR&limit=50&page=0"

@interface HotelManager ()

@property (nonatomic, strong) NSArray      *imgList;

@end


@implementation HotelManager

#pragma mark - Singleton

+ (id)sharedManager {
    static HotelManager *manager = nil;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        manager = [[self alloc] init];
    });
    
    return manager;
}



#pragma mark - Request

- (void)requestHotels {
    NSURL *URL = [NSURL URLWithString:_API_URL];
    NSURLRequest *request = [NSURLRequest requestWithURL:URL];
    
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *task = [session dataTaskWithRequest:request
                                            completionHandler:
                                  ^(NSData *data, NSURLResponse *response, NSError *error) {
                                      
                                      NSMutableDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
                                      if (!error) {
                                          [self parseHotels:json];
                                          [self.delegate handleSuccess];
                                      }
                                  }];
    
    [task resume];
}



#pragma mark - Parse


- (void)parseHotels:(NSDictionary *)json {
    NSMutableArray *mutableHotelList = [NSMutableArray array];
    NSArray *hotels = json[@"exactMatch"];
    
    for (int i = 0; i < hotels.count; i++) {
        Hotel *hotel = [[Hotel alloc] init];
        
        hotel.hotelId       = ((NSNumber *)hotels[i][@"id"]).integerValue;
        hotel.label         = hotels[i][@"label"];
        hotel.location      = hotels[i][@"location"][@"address"];
        hotel.reviewAverage = hotels[i][@"review"][@"average"];
        hotel.reviewCount = ((NSNumber *)hotels[i][@"review"][@"count"]).integerValue;
        hotel.weekends      = [self parseWeekends:hotels[i][@"weekend"]];
        
        [mutableHotelList addObject:hotel];
    }

    self.hotelList = [NSArray arrayWithArray:mutableHotelList];
}


- (NSArray *)parseWeekends:(NSArray *)weekends {
    NSMutableArray *mutableWeekendList = [NSMutableArray array];
    
    for (int i = 0; i < weekends.count; i++) {
        Weekend *weekend = [[Weekend alloc] init];
        
        weekend.weekendId   = ((NSNumber *)weekends[i][@"id"]).integerValue;
        weekend.label       = weekends[i][@"label"];
        weekend.sellPrice   = weekends[i][@"price"][@"sellPrice"];
        weekend.refPrice    = weekends[i][@"price"][@"refPrice"];
        weekend.promo       = weekends[i][@"price"][@"promoPercentageRounded"];
        

        NSMutableString *str = [NSMutableString string];
        for (NSString *string in weekends[i][@"topTheme"]) {
            [str appendFormat:@" - %@", string];
        }
        weekend.theme = [[NSString alloc] initWithString:str];
        
        
        str = [NSMutableString string];
        for (NSString *string in weekends[i][@"programIntro"]) {
            [str appendFormat:@"- %@\n", string];
        }
        weekend.intro = str;
        
        
       
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0),
                       ^{
                          NSURL *imageURL = [NSURL URLWithString:weekends[i][@"imageUrl"]];
                          weekend.imgData = [NSData dataWithContentsOfURL:imageURL];
                       });
    
       [mutableWeekendList addObject:weekend];
    }
    
    return mutableWeekendList;
}













@end

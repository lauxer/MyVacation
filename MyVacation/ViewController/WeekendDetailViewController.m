//
//  WeekendDetailViewController.m
//  MyVacation
//
//  Created by Cyril Lauxerrois on 06/07/2017.
//  Copyright © 2017 Cyril Lauxerrois. All rights reserved.
//

#import "WeekendDetailViewController.h"

@interface WeekendDetailViewController ()

@end

@implementation WeekendDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupUI];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - View

- (void)setupUI {
    [self.imgView setImage:[UIImage imageWithData:self.weekend.imgData]];
    self.hotelLabel.text = self.hotel.label;
    self.addressLabel.text = self.hotel.location;
    self.themeLabel.text = self.weekend.theme;
    self.weekendLabel.text = self.weekend.label;
    [self.introView setText:self.weekend.intro];
    
    self.sellPriceLabel.text = [NSString stringWithFormat:@"%8.2f €", self.weekend.sellPrice.floatValue / 100];
    self.promoLabel.text = [NSString stringWithFormat:@"- %@ %%", self.weekend.promo.stringValue];
    
    NSDictionary *attributes = [(NSAttributedString *)self.refPriceLabel.attributedText attributesAtIndex:0 effectiveRange:NULL];
    self.refPriceLabel.attributedText = [[NSAttributedString alloc] initWithString:[NSString stringWithFormat:@"%8.2f €", self.weekend.refPrice.floatValue / 100] attributes:attributes];
}


#pragma mark - IBAction

- (IBAction)backButtonPressed:(UIButton *)backButton {
    [self dismissViewControllerAnimated:YES completion:NULL];
}


@end

//
//  AppDelegate.h
//  MyVacation
//
//  Created by Cyril Lauxerrois on 06/07/2017.
//  Copyright © 2017 Cyril Lauxerrois. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end


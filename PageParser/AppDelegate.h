//
//  AppDelegate.h
//  PageParser
//
//  Created by Ozzy on 14.07.17.
//  Copyright © 2017 Empty. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>
@property (strong, nonatomic) UIWindow *window;
- (void)showAlertWithTitle:(NSString *)title titleActions:(NSArray<NSString *> *)titleActions completion:(void (^)(NSString *actionTitle))completion;
- (void)showAlertWithError:(NSError *)error;

@end


//
//  AppDelegate.m
//  PageParser
//
//  Created by Ozzy on 14.07.17.
//  Copyright © 2017 Empty. All rights reserved.
//

#import "AppDelegate.h"
#import "Firebase.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    [FIRApp configure];
    
    return YES;
}
//
//#pragma mark - Private
//
//+ (UIViewController *)visibleViewController:(UIViewController *)rootViewController
//{
//    if ([rootViewController isKindOfClass:[UINavigationController class]])
//    {
//        UINavigationController *navigationController = (UINavigationController *)rootViewController;
//        UIViewController *lastViewController = [[navigationController viewControllers] lastObject];
//        
//        return [self visibleViewController:lastViewController];
//    }
//    if ([rootViewController isKindOfClass:[UITabBarController class]])
//    {
//        UITabBarController *tabBarController = (UITabBarController *)rootViewController;
//        UIViewController *selectedViewController = tabBarController.selectedViewController;
//        
//        return [self visibleViewController:selectedViewController];
//    }
//    
//    if (rootViewController.presentedViewController != nil)
//    {
//        UIViewController *presentedViewController = (UIViewController *)rootViewController.presentedViewController;
//        return [self visibleViewController:presentedViewController];
//    }
//    
//    return rootViewController;
//}
//
//
//#pragma mark - Public
//
//- (UIViewController *)topViewController
//{
//    UIViewController *rootController = self.window.rootViewController;
//    return [AppDelegate visibleViewController:rootController];
//}
//
//- (void)showAlertWithTitle:(NSString *)title titleActions:(NSArray<NSString *> *)titleActions completion:(void (^)(NSString *actionTitle))completion
//{
//    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:@"" preferredStyle:UIAlertControllerStyleAlert];
//    
//    for (NSString *titleAction in titleActions) {
//        UIAlertAction *action = [UIAlertAction actionWithTitle:titleAction style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
//            if (completion != nil) {
//                completion(titleAction);
//            }
//        }];
//        
//        [alertController addAction:action];
//    }
//    
//    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"Отмена" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
//        [alertController dismissViewControllerAnimated:YES completion:nil];
//    }];
//    
//    [alertController addAction:cancelAction];
//    
//    [self presentAlertController:alertController];
//}
//
//- (void)presentAlertController:(UIAlertController *)alertController
//{
//    UIViewController *topViewController = [self topViewController];
//    [topViewController presentViewController:alertController animated:YES completion:nil];
//    
//}

@end

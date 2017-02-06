//
//  ViewControllerLifecycleBehavior.h
//  ViewControllerBehaviors
//
//  Created by Dudarenko Ilya on 06.02.17.
//  Copyright © 2017 DIO. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


@protocol ViewControllerLifecycleBehavior <NSObject>

@optional

- (void)afterLoading:(UIViewController *)viewController;

- (void)beforeAppearing:(UIViewController *)viewController;

- (void)afterAppearing:(UIViewController *)viewController;

- (void)beforeDisappearing:(UIViewController *)viewController;

- (void)afterDisappearing:(UIViewController *)viewController;

- (void)beforeLayingOutSubviews:(UIViewController *)viewController;

- (void)afterLayingOutSubviews:(UIViewController *)viewController;

@end

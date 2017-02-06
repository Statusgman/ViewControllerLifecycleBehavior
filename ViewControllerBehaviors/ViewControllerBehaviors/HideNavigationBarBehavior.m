//
//  HideNavigationBarBehavior.m
//  ViewControllerBehaviors
//
//  Created by Dudarenko Ilya on 06.02.17.
//  Copyright © 2017 DIO. All rights reserved.
//

#import "HideNavigationBarBehavior.h"


@implementation HideNavigationBarBehavior

- (void)afterAppearing:(UIViewController *)viewController {
    [viewController.navigationController setNavigationBarHidden:YES animated:YES];
}

- (void)beforeDisappearing:(UIViewController *)viewController {
    [viewController.navigationController setNavigationBarHidden:NO animated:NO];
}

@end

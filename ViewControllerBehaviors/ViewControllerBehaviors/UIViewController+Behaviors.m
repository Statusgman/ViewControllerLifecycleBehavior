//
//  UIViewController+Behaviors.m
//  ViewControllerBehaviors
//
//  Created by Dudarenko Ilya on 06.02.17.
//  Copyright © 2017 DIO. All rights reserved.
//

#import "UIViewController+Behaviors.h"

#import "LifecycleBehaviorViewController.h"


@implementation UIViewController (Behaviors)

- (void)addBehaviors:(NSArray < id<ViewControllerLifecycleBehavior> > *)behaviors {
    LifecycleBehaviorViewController *behaviorViewController = [[LifecycleBehaviorViewController alloc] initWithBehaviors:behaviors];
    
    [self addChildViewController:behaviorViewController];
    [self.view addSubview:behaviorViewController.view];
    [behaviorViewController didMoveToParentViewController:self];
}

@end

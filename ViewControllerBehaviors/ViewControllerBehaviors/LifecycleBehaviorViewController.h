//
//  LifecycleBehaviorViewController.h
//  ViewControllerBehaviors
//
//  Created by Dudarenko Ilya on 06.02.17.
//  Copyright © 2017 DIO. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ViewControllerLifecycleBehavior;


@interface LifecycleBehaviorViewController : UIViewController

- (instancetype)initWithBehaviors:(NSArray < id<ViewControllerLifecycleBehavior> > *)behaviors;

@end

//
//  LifecycleBehaviorViewController.m
//  ViewControllerBehaviors
//
//  Created by Dudarenko Ilya on 06.02.17.
//  Copyright © 2017 DIO. All rights reserved.
//

#import "LifecycleBehaviorViewController.h"
#import "ViewControllerLifecycleBehavior.h"


@interface LifecycleBehaviorViewController ()

@property (nonatomic, strong) NSArray < id<ViewControllerLifecycleBehavior> > *behaviors;

@end


@implementation LifecycleBehaviorViewController

#pragma mark -
#pragma mark Init

- (instancetype)initWithBehaviors:(NSArray < id<ViewControllerLifecycleBehavior> > *)behaviors {
    self = [super init];
    if (self) {
        self.behaviors = behaviors;
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    assert(NO);
    return nil;
}

#pragma mark -
#pragma mark UIViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.hidden = YES;
    
    [self applyBehaviors:^(id<ViewControllerLifecycleBehavior> behavior, UIViewController *viewController) {
        if ([behavior respondsToSelector:@selector(afterLoading:)]) {
            [behavior afterLoading:viewController];
        }
    }];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self applyBehaviors:^(id<ViewControllerLifecycleBehavior> behavior, UIViewController *viewController) {
        if ([behavior respondsToSelector:@selector(beforeAppearing:)]) {
            [behavior beforeAppearing:viewController];
        }
    }];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    [self applyBehaviors:^(id<ViewControllerLifecycleBehavior> behavior, UIViewController *viewController) {
        if ([behavior respondsToSelector:@selector(afterAppearing:)]) {
            [behavior afterAppearing:viewController];
        }
    }];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    [self applyBehaviors:^(id<ViewControllerLifecycleBehavior> behavior, UIViewController *viewController) {
        if ([behavior respondsToSelector:@selector(beforeDisappearing:)]) {
            [behavior beforeDisappearing:viewController];
        }
    }];
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    
    [self applyBehaviors:^(id<ViewControllerLifecycleBehavior> behavior, UIViewController *viewController) {
        if ([behavior respondsToSelector:@selector(afterDisappearing:)]) {
            [behavior afterDisappearing:viewController];
        }
    }];
}

- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    
    [self applyBehaviors:^(id<ViewControllerLifecycleBehavior> behavior, UIViewController *viewController) {
        if ([behavior respondsToSelector:@selector(beforeLayingOutSubviews:)]) {
            [behavior beforeLayingOutSubviews:viewController];
        }
    }];
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    
    [self applyBehaviors:^(id<ViewControllerLifecycleBehavior> behavior, UIViewController *viewController) {
        if ([behavior respondsToSelector:@selector(afterLayingOutSubviews:)]) {
            [behavior afterLayingOutSubviews:viewController];
        }
    }];
}

#pragma mark -
#pragma mark Private

- (void)applyBehaviors:(void (^)(id<ViewControllerLifecycleBehavior>, UIViewController *))body; {
    if (!self.parentViewController) {
        return;
    }
    
    for (id<ViewControllerLifecycleBehavior> behavior in _behaviors) {
        body(behavior, self.parentViewController);
    }
}

@end

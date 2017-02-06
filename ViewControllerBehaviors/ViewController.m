//
//  ViewController.m
//  ViewControllerBehaviors
//
//  Created by Dudarenko Ilya on 06.02.17.
//  Copyright © 2017 DIO. All rights reserved.
//

#import "ViewController.h"

#import "UIViewController+Behaviors.h"
#import "HideNavigationBarBehavior.h"


@interface ViewController ()

@end


@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    if (self.navigationController.viewControllers.count % 2 == 0) {
        HideNavigationBarBehavior *behavior = [HideNavigationBarBehavior new];
        [self addBehaviors:@[behavior]];
    }
}

- (IBAction)didTaped:(id)sender {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    ViewController *vc = [storyboard instantiateViewControllerWithIdentifier:@"viewController"];
    [self.navigationController pushViewController:vc animated:YES];
}

@end

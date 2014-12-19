#import "ViewController.h"

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.view removeConstraint:self.topConstraint];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.containerView
                                                          attribute:NSLayoutAttributeTop
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeTop
                                                         multiplier:1.0
                                                           constant:0]];

    UISplitViewController * svc = [self.childViewControllers firstObject];
    svc.preferredDisplayMode = UISplitViewControllerDisplayModeAllVisible;
    
    svc.preferredPrimaryColumnWidthFraction = 0.5;
    svc.maximumPrimaryColumnWidth = 500;
}

- (void)addChildViewController:(UIViewController *)childController
{
    // Called before ViewDidLoad invoked.
    [super addChildViewController:childController];
    UISplitViewController * svc = [self.childViewControllers firstObject];

    if (svc) {
        svc.delegate = self;
    }
}

#pragma mark == UISplitViewControllerDelegate ==

- (BOOL)splitViewController:(UISplitViewController *)splitViewController collapseSecondaryViewController:(UIViewController *)secondaryViewController ontoPrimaryViewController:(UIViewController *)primaryViewController
{
    // If "YES" returned on any iPhone devide, Detail ViewController is collapsed on launch.
    // "No" returned, Master ViewController is collapsed.
    return YES;
}

@end

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
    
    // UISplitViewControllerの
    UISplitViewController * svc = self.childViewControllers[0];
    svc.preferredDisplayMode = UISplitViewControllerDisplayModeAllVisible;
    
    svc.preferredPrimaryColumnWidthFraction = 0.5;
    svc.maximumPrimaryColumnWidth = 500;
}

- (void)addChildViewController:(UIViewController *)childController
{
    [super addChildViewController:childController];
    UISplitViewController * svc = self.childViewControllers[0];
    
    if (svc) {
        svc.delegate = self;
    }
}

#pragma mark == UISplitViewControllerDelegate ==

- (BOOL)splitViewController:(UISplitViewController *)splitViewController collapseSecondaryViewController:(UIViewController *)secondaryViewController ontoPrimaryViewController:(UIViewController *)primaryViewController
{
    return YES;
}

@end

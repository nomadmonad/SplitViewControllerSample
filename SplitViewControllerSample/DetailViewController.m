#import "DetailViewController.h"

@implementation DetailViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self configureView];
}

- (void)setDetailItem:(NSDate *)detailItem
{
    _detailItem = detailItem;
    [self configureView];
}

- (void)configureView
{
    NSDate * detail = self.detailItem;
    if(detail) {
        UILabel * label = self.detailDescriptionLabel;
        if (label) {
            self.detailDescriptionLabel.text = detail.description;
        }
    }
}

- (void)dismissPopOver
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier compare:@"showPopOver"] == NSOrderedSame) {
        UINavigationController * nvc = segue.destinationViewController;
        UIPresentationController * pc = nvc.presentationController;
        pc.delegate = self;
        // In WWDC 2014 "View Controller Advancements in iOS8",
        // below codes can show popover on iPhone (Adaptive popover).
        //
        // UINavigationController * nvc = segue.destinationViewController;
        // UIPopoverPresentationController * pvc = nvc.popoverPresentationController;
        // pvc.delegate = self;
        //
        // But On Xcode 6.1, these codes shows FullScreen presentation...
        // (nvc.popoverPresentationController is nil)
        // For workarounds, I use presentationController's delegate instead of popoverController's.
    }
}

- (IBAction)tapped:(UIButton *)sender
{
    UIViewController * vc = [UIViewController new];
    vc.preferredContentSize = CGSizeMake(400, 500);
    vc.modalPresentationStyle = UIModalPresentationPopover;
    vc.popoverPresentationController.delegate = self;
    
    UIView * view = [[UIView alloc] initWithFrame:vc.view.bounds];
    view.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    
    vc.popoverPresentationController.sourceView = (UIView *)sender;
    vc.popoverPresentationController.sourceRect = ((UIView *)sender).bounds;
    
    [self presentViewController:vc animated:YES completion:nil];
}

#pragma mark == UIPopoverPresentationControllerDelegate ==

- (UIModalPresentationStyle)adaptivePresentationStyleForPresentationController:(UIPresentationController *)controller
{
    UIModalPresentationStyle ret = UIModalPresentationNone;
    if (self.segueSwitch.on == YES) {
        ret = UIModalPresentationFormSheet;
    }
    return ret;
}

- (UIViewController *)presentationController:(UIPresentationController *)controller viewControllerForAdaptivePresentationStyle:(UIModalPresentationStyle)style
{
    UIViewController * vc = controller.presentedViewController;
    UIBarButtonItem * btn = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel
                                                                          target:self
                                                                          action:@selector(dismissPopOver)];
    vc.navigationItem.rightBarButtonItem = btn;
    return vc;
}

@end

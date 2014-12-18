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

#pragma mark == UIPopoverPresentationControllerDelegate ==

- (UIModalPresentationStyle)adaptivePresentationStyleForPresentationController:(UIPresentationController *)controller
{
    return UIModalPresentationFullScreen;
}


@end

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController <UIPopoverPresentationControllerDelegate>

@property (nonatomic) IBOutlet UILabel * detailDescriptionLabel;
@property (nonatomic, setter=setDetailItem:) NSDate * detailItem;
@property (weak, nonatomic) IBOutlet UISwitch *segueSwitch;
- (IBAction)tapped:(UIButton *)sender;
@end

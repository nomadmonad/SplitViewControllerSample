#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController <UIPopoverPresentationControllerDelegate>

@property (nonatomic) IBOutlet UILabel * detailDescriptionLabel;
@property (nonatomic, setter=setDetailItem:) NSDate * detailItem;
- (IBAction)tapped:(UIButton *)sender;
@end

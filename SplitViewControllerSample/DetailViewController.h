#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController <UIAdaptivePresentationControllerDelegate>

@property (nonatomic) IBOutlet UILabel * detailDescriptionLabel;
@property (nonatomic, setter=setDetailItem:) NSDate * detailItem;
@end

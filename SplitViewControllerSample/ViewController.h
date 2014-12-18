#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UISplitViewControllerDelegate>

@property (nonatomic, weak) IBOutlet UIView * containerView;
@property (nonatomic) IBOutlet NSLayoutConstraint * topConstraint;

@end


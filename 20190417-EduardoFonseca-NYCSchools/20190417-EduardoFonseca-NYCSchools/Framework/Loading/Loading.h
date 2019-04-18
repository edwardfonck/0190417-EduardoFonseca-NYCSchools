//
//  LoadingView.h
//
//

#import <UIKit/UIKit.h>

@interface Loading : UIView

+ (void)showWithText:(NSString *)text;
+ (void)show;
+ (void)remove;
+ (void)setText:(NSString *)text;

@end

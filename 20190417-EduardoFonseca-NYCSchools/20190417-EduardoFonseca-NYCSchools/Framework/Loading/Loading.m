//
//  LoadingView.m


#import "Loading.h"

static Loading *instance = nil;
static DotActivityIndicatorView *dotsLoader = nil;
static UIView *lb_text = nil;

@interface Loading ()

@property (nonatomic, retain) IBOutlet UILabel *textLabel;



@end

@implementation Loading

+ (Loading *)shareInstance
{
    if (!instance)
        instance = [Loading newInstance];
    
    return instance;
}

+ (Loading *)newInstance
{
    Loading *customView = [[[NSBundle mainBundle] loadNibNamed:@"Loading" owner:nil options:nil] lastObject];
    
    if ([customView isKindOfClass:[Loading class]])
    {
        customView.textLabel.text = @"";
        return customView;
    }
    
    return nil;
}

+ (void)setText:(NSString *)text
{
    dispatch_async(dispatch_get_main_queue(), ^{
        
        Loading *lView = [Loading shareInstance];
        lView.textLabel.text=text;
    });
}

+ (void)show
{
    [self showWithText:@"Loading schools..."];
}

+ (void)showWithText:(NSString *)text
{
    dispatch_async(dispatch_get_main_queue(), ^{
        
    
        Loading *lView = [Loading shareInstance];
        [Loading setText:text];
        [lView removeFromSuperview];
        
        UIWindow *w = [[UIApplication sharedApplication].delegate window];
        
        lView.frame = w.frame;
        lView.alpha = 0;
        
        [w addSubview:lView];
        
        NSArray *subviews = lView.subviews.firstObject.subviews;
        lb_text = nil;
        
        for (UIView *view in subviews)
            if(view.tag == 1){
                lb_text = view;
            }
        
        
        dotsLoader= [[DotActivityIndicatorView alloc] initWithFrame:lb_text.frame];
        dotsLoader.center  = w.center;
        dotsLoader.dotParms = [self loadDotActivityIndicatorParms];

        [UIView animateWithDuration:0.2 delay:0 options:UIViewAnimationOptionCurveEaseIn animations:^{
            
            lView.alpha = 1;
        } completion:^(BOOL finished) {
            [lView addSubview:dotsLoader];
            [dotsLoader startAnimating];

        }];
    });
}

+ (void)remove
{
    dispatch_async(dispatch_get_main_queue(), ^{
        
        Loading *lView = [Loading shareInstance];
        [UIView animateWithDuration:0.2 delay:0 options:UIViewAnimationOptionCurveEaseIn animations:^{
            lView.alpha = 0;
        } completion:^(BOOL finished) {
            [lView removeFromSuperview];
        }];
    });
}

+ (DotActivityIndicatorParms *)loadDotActivityIndicatorParms
{
    DotActivityIndicatorParms *dotParms = [DotActivityIndicatorParms new];
    dotParms.activityViewWidth = lb_text.frame.size.width;
    dotParms.activityViewHeight = lb_text.frame.size.height;
    dotParms.numberOfCircles = 4;
    dotParms.internalSpacing = 5;
    dotParms.animationDelay = 0.2;
    dotParms.animationDuration = 0;
    dotParms.animationFromValue = 0.3;
    dotParms.defaultColor = [UIColor colorWithRed:255.0/255.0 green:209.0/255.0 blue:24.0/255.0 alpha:1];
    dotParms.isDataValidationEnabled = YES;
    return dotParms;
}


@end

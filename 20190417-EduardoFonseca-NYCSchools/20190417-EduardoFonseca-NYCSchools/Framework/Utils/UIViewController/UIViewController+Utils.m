//
//  UIViewController+Utils.m
//  Template
//
//  Copyright © 2018. All rights reserved.
//

#import "UIViewController+Utils.h"

@implementation UIViewController (Utils)

# pragma mark - STATUS BAR

- (void)showStatusBarWithStyle:(UIStatusBarStyle)statusBarStyle
{
    //[UIApplication sharedApplication].statusBarHidden = NO;
    //[UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
}

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wobjc-protocol-method-implementation"

- (void)viewWillAppear:(BOOL)animated
{
    [self setNeedsStatusBarAppearanceUpdate];
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleDefault;
}

-(float)sizeByHeightLabel:(NSString *)msg
{
    float margin = 25;
    UIFont *font = [UIFont fontWithName:@"OpenSans" size:12];
    CGSize maximumLabelSize = CGSizeMake(190, 1000);
    
    CGSize expectedLabelSize = [msg boundingRectWithSize:maximumLabelSize options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:font} context:nil].size;
    
    return expectedLabelSize.height + margin;
}

- (float)sizeByWidthString:(NSString *)string
{
    UIFont *font = [UIFont fontWithName:@"Century Gothic" size:12];
    NSDictionary *attributes = [NSDictionary dictionaryWithObjectsAndKeys:font, NSFontAttributeName, nil];
    return [[[NSAttributedString alloc] initWithString:string attributes:attributes] size].width;
}

+ (UIViewController *)topViewController
{
    UIViewController *topController = [[UIApplication sharedApplication].delegate window].rootViewController;
    
    while (topController.presentedViewController)
    {
        topController = topController.presentedViewController;
    }
    
    if ([topController isKindOfClass:UINavigationController.class])
    {
        topController = ((UINavigationController *)topController).topViewController;
    }
    
    return topController;
}

@end

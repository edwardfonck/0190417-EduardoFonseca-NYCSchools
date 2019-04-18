//
//  UIViewController+Utils.h
//  Template
//
//  Copyright © 2018. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (Utils)

+ (UIViewController *)topViewController;

- (void)showStatusBarWithStyle:(UIStatusBarStyle)statusBarStyle;
-(float)sizeByHeightLabel:(NSString *)msg;
- (float)sizeByWidthString:(NSString *)string;

@end

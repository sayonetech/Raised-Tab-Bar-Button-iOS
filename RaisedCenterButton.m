//
//  RaisedCenterButton.m
//  RaisedCenterButton
//
//  Created by SayOne on 16/03/16.
//  Copyright © 2016 SayOne. All rights reserved.
//

#import "RaisedCenterButton.h"

@interface RaisedCenterButton ()

@property (strong, nonatomic) UITabBarController *tabBarController;

- (IBAction)buttonAction:(id)sender;

@end

@implementation RaisedCenterButton

@synthesize tabBarController = _tabBarController;
@synthesize buttonImage = _buttonImage;

+ (id)buttonWithImage:(UIImage *)image forTabBarController:(UITabBarController *)tabBarController
{
    RaisedCenterButton *button = [RaisedCenterButton buttonWithType:UIButtonTypeCustom];
    
    // we use this to center our button and take action when the button is used.
    [button setTabBarController:tabBarController];
   // [button setButtonImage:image];
    
    [button setButtonImage:image];
    return button;
}

- (void)setButtonImage:(UIImage *)buttonImage
{
    if (buttonImage != _buttonImage) {
        _buttonImage = buttonImage;
        
        self.frame = CGRectMake(0.0, 0.0, buttonImage.size.width, buttonImage.size.height);
        [self setBackgroundImage:buttonImage forState:UIControlStateNormal];
        self.autoresizingMask = UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleTopMargin;
        CGFloat heightDifference = buttonImage.size.height - self.tabBarController.tabBar.frame.size.height;
        if (heightDifference < 0)
            self.center = self.tabBarController.tabBar.center;
        else
        {
            CGPoint center = self.tabBarController.tabBar.center;
            center.y = center.y - heightDifference/2.0;
            self.center = center;
        }
        [self addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    }

}

// replicating the action of touching the center button on the tab bar.
- (IBAction)buttonAction:(id)sender
{
    [self.tabBarController setSelectedIndex:2];
}

@end

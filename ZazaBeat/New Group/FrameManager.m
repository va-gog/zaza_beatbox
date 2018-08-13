//
//  FrameManager.m
//  ZazaBeat
//
//  Created by Gohar on 6/21/18.
//  Copyright © 2018 Gohar Vardanyan. All rights reserved.
//

#import "FrameManager.h"

@implementation FrameManager

- (BOOL)frameForView:(UIView *)view isFullScreen:(BOOL)isFullScreen withCompletion:(nullable void(^)(void))completion {
    __block BOOL isFull;
    CGSize screenSize = [[UIScreen mainScreen] bounds].size;
    [UIView transitionWithView:view duration:0.3 options:UIViewAnimationOptionCurveLinear animations:^{
        if (isFullScreen) {
            CGRect newRect = CGRectMake(screenSize.width * 0.57, screenSize.height * 0.15, screenSize.width * 0.7, screenSize.height * 0.7);
            view.frame = newRect;
            isFull = NO;
        } else {
            view.frame = [[UIScreen mainScreen] bounds];
            isFull = YES;
        }
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.2 animations:^{
            if (completion) {
            completion();
            }
        }];
    }];
    return  isFull;
}

@end

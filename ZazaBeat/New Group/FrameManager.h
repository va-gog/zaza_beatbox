//
//  FrameManager.h
//  ZazaBeat
//
//  Created by Gohar on 6/21/18.
//  Copyright © 2018 Gohar Vardanyan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FrameManager : NSObject

- (BOOL)frameForView:(UIView *)view isFullScreen:(BOOL)isFullScreen withCompletion:(nullable void(^)(void))completion;

@end

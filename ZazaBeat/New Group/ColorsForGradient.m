//
//  ColorsForGradient.m
//  ZazaBeat
//
//  Created by Gohar Vardanyan on 7/22/18.
//  Copyright © 2018 Gohar Vardanyan. All rights reserved.
//

#import "ColorsForGradient.h"

@implementation ColorsForGradient


- (NSArray *)projectsMainGradientColors {
    UIColor *mainGradientStartColor = [UIColor colorWithRed:77/255.f green:77/255.f blue:79/255.f alpha:1.0];
    UIColor *mainGradientEndColor = [UIColor colorWithRed:34/255.f green:1/255.f blue:44/255.f alpha:1.0];
    NSArray *array = @[(id)mainGradientStartColor.CGColor,(id)mainGradientEndColor.CGColor];
    return array;
}

- (NSArray *)projectsSecondGradientColors {
    UIColor *secondGradientStartColor = [UIColor colorWithRed:101/255.f green:41/255.f blue:154/255.f alpha:1.0];
    UIColor *secondGradientEndColor = [UIColor colorWithRed:53/255.f green:15/255.f blue:76/255.f alpha:1.0];
    return @[(id)secondGradientStartColor.CGColor,(id)secondGradientEndColor.CGColor];
}

- (NSArray *)projectsThirdGradientColors {
    UIColor *thirdGradientStartColor = [UIColor colorWithRed:41/255.f green:128/255.f blue:154/255.f alpha:1.0];
    UIColor *thirdGradientEndColor = [UIColor colorWithRed:53/255.f green:15/255.f blue:76/255.f alpha:1.0];
    return @[(id)thirdGradientStartColor.CGColor,(id)thirdGradientEndColor.CGColor];
}

- (NSArray *)projectsFourthGradientColors {
    UIColor *fourthGradientStartColor = [UIColor colorWithRed:49/255.f green:41/255.f blue:154/255.f alpha:1.0];
    UIColor *fourthGradientEndColor = [UIColor colorWithRed:80/255.f green:13/255.f blue:120/255.f alpha:1.0];
    return @[(id)fourthGradientStartColor.CGColor,(id)fourthGradientEndColor.CGColor];
}

- (NSArray *)audioVideoGradientColors {
    UIColor *audioVideoGradientStartColor = [UIColor colorWithRed:41/255.f green:128/255.f blue:154/255.f alpha:1.0];
    UIColor *audioVideoEndColor = [UIColor colorWithRed:10/255.f green:35/255.f blue:55/255.f alpha:1.0];
    return @[(id)audioVideoGradientStartColor.CGColor, (id)audioVideoEndColor.CGColor];
}

@end

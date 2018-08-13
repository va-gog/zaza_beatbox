//
//  GradientMaker.m
//  ZazaBeat
//
//  Created by Gohar Vardanyan on 7/22/18.
//  Copyright © 2018 Gohar Vardanyan. All rights reserved.
//

#import "GradientMaker.h"

@interface GradientMaker()

@property (assign, nonatomic) NSInteger gradientIndex;

@end

@implementation GradientMaker

+ (CAGradientLayer *)makeGradientWithColors:(NSArray *)colors WithFrame:(CGRect)gradientFrame gradientPoints:(NSDictionary *)points{
    
    CAGradientLayer *gradient = [[CAGradientLayer alloc] init];
    
    gradient.frame = gradientFrame;
    gradient.colors = colors;
    gradient.startPoint = [[points valueForKey:@"startPoint"] CGPointValue];
    gradient.endPoint =   [[points valueForKey:@"endPoint"] CGPointValue];
    
    return gradient;
}

@end

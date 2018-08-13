//
//  GradientMaker.h
//  ZazaBeat
//
//  Created by Gohar Vardanyan on 7/22/18.
//  Copyright © 2018 Gohar Vardanyan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GradientMaker : NSObject

+ (CAGradientLayer *)makeGradientWithColors:(NSArray *)colors WithFrame:(CGRect)gradientFrame gradientPoints:(NSDictionary *)points;

@end

//
//  AudiosView.m
//  ZazaBeat
//
//  Created by Gohar Vardanyan on 6/15/18.
//  Copyright © 2018 Gohar Vardanyan. All rights reserved.
//

#import "AudiosView.h"
#import "FrameManager.h"
#import "ColorsForGradient.h"
#import "GradientMaker.h"

@interface AudiosView()

@property (strong, nonatomic) IBOutlet AudiosView *contentView;

@end

@implementation AudiosView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [[NSBundle mainBundle] loadNibNamed:@"AudiosView" owner:self options:nil];
        
        self.tag = 4;
        self.contentView.frame = self.frame;
        self.isFullScreen = YES;
        
        [self addSubview:self.contentView];
    }
    return self;
}

- (void)drawRect:(CGRect)rect {
    [self putGradientOnView];
}

- (void)layoutSubviews {
    CALayer *layer = [self.layer.sublayers objectAtIndex:0];
    layer.frame = self.bounds;
}

- (void)putGradientOnView {
    ColorsForGradient *colorsForGradient = [[ColorsForGradient alloc] init];
    NSDictionary *gradientPoints = @{@"startPoint" : [NSNumber valueWithCGPoint:CGPointMake(0.0, 1.0)], @"endPoint" : [NSNumber valueWithCGPoint:CGPointMake(0.0, 0.0)]};
    CAGradientLayer *gradientLayer = [GradientMaker makeGradientWithColors:colorsForGradient.audioVideoGradientColors WithFrame:self.bounds gradientPoints:gradientPoints];
    [self.layer insertSublayer:gradientLayer atIndex:0];
}

- (IBAction)burgerButtonAction:(UIButton *)sender {
    FrameManager *frameManager = [[FrameManager alloc] init];
    self.isFullScreen = [frameManager frameForView:self isFullScreen:self.isFullScreen withCompletion:nil];
}

@end

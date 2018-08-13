//
//  TimeLineView.m
//  ZazaBeat
//
//  Created by Gohar Vardanyan on 7/28/18.
//  Copyright © 2018 Gohar Vardanyan. All rights reserved.
//

#import "TimeLineView.h"

@interface TimeLineView()

@property (assign, nonatomic) NSInteger lineLenght;
@property (assign, nonatomic) CGFloat moveToX;
@property (assign, nonatomic) CGFloat time;
@end

@implementation TimeLineView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.frame = frame;
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

- (void)drawRect:(CGRect)rect {
    self.moveToX = 0.0;
    self.time = 0.0;
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    
    CGFloat frame = self.frame.size.width;
    NSInteger distanceCount = frame / 5;
    for (int i = 0; i <= distanceCount; i ++) {
        if (i == 0 | i % 4 == 0) {
            [self drawDistancesWithPath:path isForTallLine:YES];
        } else {
            [self drawDistancesWithPath:path isForTallLine:NO];
        }
    }
    
    CAShapeLayer *shapeLayer = [[CAShapeLayer layer] initWithLayer:self.layer];
    shapeLayer.path = [path CGPath];
    shapeLayer.strokeColor = [[UIColor colorWithRed:77/255.f green:77/255.f blue:79/255.f alpha:1.0]  CGColor];
    shapeLayer.lineWidth = 1.0;
    
    [self.layer addSublayer:shapeLayer];
}

- (void)drawDistancesWithPath:(UIBezierPath *)path isForTallLine:(BOOL)isTall {
    CGPoint moveToPoint = CGPointMake(self.moveToX, self.bounds.size.height);
    [path moveToPoint:moveToPoint];
    [path addLineToPoint:CGPointMake(moveToPoint.x + 13.0, moveToPoint.y)];
    [path moveToPoint:moveToPoint];
    if (isTall) {
        [path addLineToPoint:CGPointMake(moveToPoint.x, moveToPoint.y - 19.0)];
        [self timeLabel:CGPointMake(self.moveToX, 0.0)];
        [self seconds];
    } else {
        [path addLineToPoint:CGPointMake(moveToPoint.x, moveToPoint.y - 4.0)];
    }
    self.moveToX += 13.0;
}

- (void)seconds {
    if ((self.time += 0.01) < 60) {
    self.time += 0.01;
    } else {
        self.time += 1.01;
        NSInteger minute = self.time;
        self.time = (CGFloat)minute;
    }
}

- (void)timeLabel:(CGPoint)locat {
    UILabel *timeLabel = [[UILabel alloc] initWithFrame:CGRectMake(locat.x + 4.0, locat.y, 30.0, 14.0)];
    NSInteger minute = self.time;
    CGFloat seconds = (self.time - minute) * 100;
    if (seconds < 10) {
    timeLabel.text = [NSString stringWithFormat:@"%.f:0%.f", self.time, seconds];
    } else {
    timeLabel.text = [NSString stringWithFormat:@"%.f:%.f", self.time, seconds];
    }
    timeLabel.font = [UIFont systemFontOfSize:12.0];
    timeLabel.textColor = [UIColor whiteColor];
    [self addSubview:timeLabel];
}

@end

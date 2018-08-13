//
//  ProjectViewController.m
//  ZazaBeat
//
//  Created by Gohar Vardanyan on 7/21/18.
//  Copyright © 2018 Gohar Vardanyan. All rights reserved.
//

#import "ProjectViewController.h"
#import "TimeLineView.h"
#import "GradientMaker.h"
#import "ColorsForGradient.h"

@interface ProjectViewController ()

@end

@implementation ProjectViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    TimeLineView *timeLine = [[TimeLineView alloc] initWithFrame:CGRectMake(70.0, 100, self.view.bounds.size.width - 70.0, 20)];
    [self.view addSubview:timeLine];
    
    ColorsForGradient *colorsForGradient = [[ColorsForGradient alloc] init];
    NSDictionary *gradientPoints = @{@"startPoint" : [NSNumber valueWithCGPoint:CGPointMake(0.0, 1.0)], @"endPoint" : [NSNumber valueWithCGPoint:CGPointMake(0.0, 0.0)]};

    [self.view.layer insertSublayer:[GradientMaker makeGradientWithColors:colorsForGradient.projectsThirdGradientColors WithFrame:self.view.frame gradientPoints:gradientPoints] atIndex:0];
}

- (BOOL)prefersStatusBarHidden{
    return YES;
}



@end

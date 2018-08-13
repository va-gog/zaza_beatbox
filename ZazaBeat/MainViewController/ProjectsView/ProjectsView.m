//
//  ProjectsView.m
//  ZazaBeat
//
//  Created by Gohar Vardanyan on 6/14/18.
//  Copyright © 2018 Gohar Vardanyan. All rights reserved.
//

#import "ProjectsView.h"
#import "ProjectsCollectionViewCell.h"
#import "FrameManager.h"
#import "GradientMaker.h"
#import "ProjectViewController.h"
#import "ColorsForGradient.h"

#define IDIOM   UI_USER_INTERFACE_IDIOM()
#define IPAD    UIUserInterfaceIdiomPad
#define IPHONE  UIUserInterfaceIdiomPhone
#define MINIMUM_INTERITEM_SPACING 11.0
#define MINIMUM_LINE_SPACING 68.0

@interface ProjectsView() <CAAnimationDelegate>

@property (strong, nonatomic) IBOutlet ProjectsView *contentView;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (strong, nonatomic) UICollectionViewFlowLayout *flowLayout;
@property (strong, nonatomic) NSArray <NSArray *> *gradientsForAnimation;
@property (strong, nonatomic) CAGradientLayer *gradientLayer;
@property (assign, nonatomic) NSInteger gradientIndex;

@end

@implementation ProjectsView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [[NSBundle mainBundle] loadNibNamed:@"ProjectsView" owner:self options:nil];
        [self setupView];
        [self addSubview:self.contentView];
    }
    return self;
}

- (void)setupView {
    self.tag = 2;
    self.isFullScreen = YES;
    self.contentView.frame = self.frame;
    [self.collectionView registerNib:[UINib nibWithNibName:@"ProjectsCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"ProjectCell"];
    
   self.flowLayout = [[UICollectionViewFlowLayout alloc] init];
    self.collectionView.collectionViewLayout = [self collectionViewLayout];
}

- (void)drawRect:(CGRect)rect {
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"Cell"];
    [self putGradientOnView];
}

- (void)layoutSubviews {
    CALayer *layer = [self.layer.sublayers objectAtIndex:0];
    layer.frame = self.bounds;
    
    [self collectionViewLayout];
}

#pragma mark - UICollectionViewDataSource

- (UICollectionViewLayout *)collectionViewLayout {
    CGFloat itemSize = [self collectionViewSpacingSize];
    
    self.flowLayout.minimumInteritemSpacing = MINIMUM_INTERITEM_SPACING;
    self.flowLayout.minimumLineSpacing = MINIMUM_LINE_SPACING;
    self.flowLayout.itemSize = CGSizeMake(itemSize, itemSize);
    self.flowLayout.sectionInset = UIEdgeInsetsMake(MINIMUM_INTERITEM_SPACING, MINIMUM_INTERITEM_SPACING, MINIMUM_INTERITEM_SPACING, MINIMUM_INTERITEM_SPACING);
    
    return self.flowLayout;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 40;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    ProjectsCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ProjectCell" forIndexPath:indexPath];
    cell.alpha = 0.3;
    
    return cell;
}

#pragma mark - Private Functions

- (CGFloat)collectionViewSpacingSize {
    UIDeviceOrientation orientation = [[UIDevice currentDevice] orientation];
    CGFloat spacing = 11.0;
    CGFloat width = (self.bounds.size.width  - 5 * spacing) / 4;

    if ((orientation != UIDeviceOrientationLandscapeLeft & orientation !=  UIDeviceOrientationLandscapeRight) && IDIOM == IPHONE) {
            width = (self.bounds.size.width  - 3 * spacing) / 2;
    }
    return width;
}

- (void)putGradientOnView {
    ColorsForGradient *colorsForGradient = [[ColorsForGradient alloc] init];
    NSDictionary *gradientPoints = @{@"startPoint" : [NSNumber valueWithCGPoint:CGPointMake(0.0, 1.0)], @"endPoint" : [NSNumber valueWithCGPoint:CGPointMake(0.0, 0.0)]};
    self.gradientLayer = [GradientMaker makeGradientWithColors:colorsForGradient.projectsMainGradientColors WithFrame:self.bounds gradientPoints:gradientPoints];
    self.gradientLayer.drawsAsynchronously = YES;
    [self.layer insertSublayer:self.gradientLayer atIndex:0];
    
    self.gradientIndex = 0;
    self.gradientsForAnimation = @[colorsForGradient.projectsMainGradientColors, colorsForGradient.projectsSecondGradientColors, colorsForGradient.projectsThirdGradientColors,colorsForGradient.projectsFourthGradientColors];
    [self animateGradient];
}

- (void)animateGradient {
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"colors"];
    animation.fromValue = self.gradientsForAnimation[self.gradientIndex];

    if (self.gradientIndex < self.gradientsForAnimation.count - 1) {
        self.gradientIndex ++;
    } else {
        self.gradientIndex = 0;
    }
    
    animation.toValue = self.gradientsForAnimation[self.gradientIndex];
    animation.duration = 6.0;
    animation.removedOnCompletion = NO;
    animation.delegate = self;
    [self.gradientLayer addAnimation:animation forKey:@"colorsChange"];
}

#pragma mark - CAAnimationDelegate

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag {
    [self animateGradient];
}

#pragma mark - Button Actions

- (IBAction)burgerButtonActionn:(UIButton *)sender {
    FrameManager *frameManager = [[FrameManager alloc] init];
    self.isFullScreen = [frameManager frameForView:self isFullScreen:self.isFullScreen withCompletion:nil];
}

- (IBAction)startButtonAction:(id)sender {
    ProjectViewController *projectController = [[ProjectViewController alloc] initWithNibName:@"ProjectViewController" bundle:nil];
    [self.window.rootViewController presentViewController:projectController animated:YES completion:nil];
}



@end

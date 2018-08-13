//
//  MainViewController.m
//  ZazaBeat
//
//  Created by Gohar on 6/16/18.
//  Copyright © 2018 Gohar Vardanyan. All rights reserved.
//

#import "MainViewController.h"
#import "FrameManager.h"
#import "ProjectsView.h"
#import "AudiosView.h"
#import "VideosView.h"
#import "ProjectViewController.h"

typedef NS_ENUM(NSInteger, SectionsButton)
{
    ProjectsSectionButton = 1,
    AudiosSectionButton = 3,
    VideosSectionButton = 5,
};

@interface MainViewController ()

@property (assign, nonatomic) NSInteger shownViewTag;
@property (strong, nonatomic) ProjectsView *projectsView;
@property (strong, nonatomic) AudiosView *audiosView;
@property (strong, nonatomic) VideosView *videosView;
@property (strong, nonatomic) NSMutableArray <CAGradientLayer *> *projectViewGradientS;

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //Holla

    [self setup];
}

- (void)setup {
    [self.view viewWithTag:ProjectsSectionButton].layer.borderColor = [UIColor whiteColor].CGColor;
    [self.view viewWithTag:AudiosSectionButton].layer.borderColor = [UIColor clearColor].CGColor;
    [self.view viewWithTag:VideosSectionButton].layer.borderColor = [UIColor clearColor].CGColor;
    
    self.projectsView = [[ProjectsView alloc] initWithFrame:self.view.frame];
    self.projectsView.hidden = NO;
    self.shownViewTag = self.projectsView.tag;
    
    self.audiosView = [[AudiosView alloc] initWithFrame:self.view.frame];
    self.audiosView.hidden = YES;
    
    self.videosView = [[VideosView alloc] initWithFrame:self.view.frame];
    self.videosView.hidden = YES;
    
    [self.view addSubview:self.videosView];
    [self.view addSubview:self.audiosView];
    [self.view addSubview:self.projectsView];
}

- (IBAction)sectionsButtonAction:(UIButton *)sender {
    switch (sender.tag) {
        case ProjectsSectionButton: {
            [self changeShownView:self.projectsView withPressedButton:sender];
            self.projectsView.isFullScreen = YES;
        }
            break;
        case AudiosSectionButton: {
            [self changeShownView:self.audiosView withPressedButton:sender];
            self.audiosView.isFullScreen = YES;
        }
            break;
        case VideosSectionButton: {
            [self changeShownView:self.videosView withPressedButton:sender];
            self.videosView.isFullScreen = YES;
        }
            break;
    }
}

- (void)changeShownView:(UIView *)view withPressedButton:(UIButton *)button {
    [self.view viewWithTag:self.shownViewTag - 1].layer.borderColor = [UIColor clearColor].CGColor;
    UIView *shownView =  [self.view viewWithTag:self.shownViewTag];
    
    FrameManager *frameManager = [[FrameManager alloc] init];

    [frameManager frameForView:shownView isFullScreen:NO withCompletion:^{
        if (button.tag  != self.shownViewTag - 1) {
            shownView.hidden = YES;
            view.hidden = NO;
            self.shownViewTag = button.tag + 1;
        }
    }];

    button.layer.borderColor = [UIColor whiteColor].CGColor;
}

- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id)coordinator {
    [super viewWillTransitionToSize:size withTransitionCoordinator:coordinator];
    
    [coordinator animateAlongsideTransition:^(id<UIViewControllerTransitionCoordinatorContext>  _Nonnull context) {
        FrameManager *frameManager = [[FrameManager alloc] init];
        switch (self.shownViewTag) {
            case 2: {
                [frameManager frameForView:self.projectsView isFullScreen:!self.projectsView.isFullScreen withCompletion:nil];
                [frameManager frameForView:self.audiosView isFullScreen:self.projectsView.isFullScreen withCompletion:nil];
                [frameManager frameForView:self.videosView isFullScreen:self.projectsView.isFullScreen withCompletion:nil];
            }
                break;
            case 4: {
                [frameManager frameForView:self.audiosView isFullScreen:!self.projectsView.isFullScreen withCompletion:nil];
                [frameManager frameForView:self.projectsView isFullScreen:self.projectsView.isFullScreen withCompletion:nil];
                [frameManager frameForView:self.videosView isFullScreen:self.projectsView.isFullScreen withCompletion:nil];
            }
                break;
            case 6: {
                [frameManager frameForView:self.videosView isFullScreen:!self.projectsView.isFullScreen withCompletion:nil];
                [frameManager frameForView:self.projectsView isFullScreen:self.projectsView.isFullScreen withCompletion:nil];
                [frameManager frameForView:self.audiosView isFullScreen:self.projectsView.isFullScreen withCompletion:nil];
            }
        }
    } completion:nil];
}

- (BOOL)prefersStatusBarHidden{
    return YES;
}

@end

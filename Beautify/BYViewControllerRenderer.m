//
//  BYViewControllerRenderer.m
//  Beautify
//
//  Created by Colin Eberhardt on 18/03/2013.
//  Copyright (c) 2013 Colin Eberhardt. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import "BYViewControllerRenderer.h"
#import "BYViewControllerStyle.h"
#import "BYTheme.h"
#import "BYStyleRenderer_Private.h"
#import "BYControlRenderingLayer.h"

@implementation BYViewControllerRenderer {
    UIImageView* _backgroundImageView;
    BYControlRenderingLayer *_renderingLayer;
}

-(id)initWithView:(id)view theme:(BYTheme*)theme {
    if (self = [super initWithView:view theme:theme]) {
        [self setup:view theme:theme];
    }
    return self;
}

-(void)setup:(UIViewController*)viewController theme:(BYTheme*)theme {
    _renderingLayer = [[BYControlRenderingLayer alloc] initWithRenderer:self];
    [_renderingLayer setFrame:viewController.view.bounds];
    [viewController.view.layer insertSublayer:_renderingLayer atIndex:0];
    [self configureFromStyle];
}

-(id)styleFromTheme:(BYTheme*)theme {
    if(theme.viewControllerStyle) {
        return theme.viewControllerStyle;
    }
    return [BYViewControllerStyle defaultStyle];
}

-(void)configureFromStyle {
    UIViewController* vc = (UIViewController*)self.adaptedView;
    BYViewControllerStyle* style = self.style;
    
    if ([vc class] == [UINavigationController class]){
        for (UIViewController* vcs in ((UINavigationController*)vc).viewControllers) {
            [self redrawViewController:vcs style:style];
        }
    }
    else {
        [self redrawViewController:vc style:style];
    }
}

-(void)redrawViewController:(UIViewController*)vc style:(BYViewControllerStyle*)style {
    [_renderingLayer setFrame:vc.view.bounds];
    [_renderingLayer setNeedsDisplay];
}

#pragma mark - Style property setters

-(void)setBackgroundColor:(UIColor*)backgroundColor {
    [self setPropertyValue:backgroundColor forName:@"backgroundColor" forState:UIControlStateNormal];
}

-(void)setBackgroundGradient:(BYGradient*)backgroundGradient {
    [self setPropertyValue:backgroundGradient forName:@"backgroundGradient" forState:UIControlStateNormal];
}

-(void)setBackgroundImage:(BYBackgroundImage*)backgroundImage {
    [self setPropertyValue:backgroundImage forName:@"backgroundImage" forState:UIControlStateNormal];
}

@end
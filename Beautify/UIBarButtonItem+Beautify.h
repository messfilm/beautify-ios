//
//  UIBarButtonItem+Beautify.h
//  Beautify
//
//  Created by Daniel Allsop on 02/08/2013.
//  Copyright (c) 2013 Colin Eberhardt. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SCBarButtonItemRenderer.h"

@interface UIBarButtonItem (Beautify)

/*
 Return the renderer which enchances the UI for this view controller.
*/
@property (readonly) __weak SCBarButtonItemRenderer *renderer;

-(void)createRenderer;

/*
 + Whether this UIBarButtonItem is 'immune' to the streamed style, i.e. it will maintain the style defined by the
 developer when the UI was designed, either in the Interface Bulder or in code.
 */
-(BOOL)isImmuneToBeautify;

/*
 Set whether this UIBarButtonItem is 'immune' to streamed styles.
 */
-(void)setImmuneToBeautify:(BOOL)immuneToBeautify;

@end
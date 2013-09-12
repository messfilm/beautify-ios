//
//  SCThemeManager_Private.h
//  Beautify
//
//  Created by Colin Eberhardt on 14/08/2013.
//  Copyright (c) 2013 Colin Eberhardt. All rights reserved.
//

#import "SCThemeManager.h"

@interface SCThemeManager ()

// Map of UI element class to renderer type
@property NSDictionary* renderers;

// obtains a suitable renderer for the given view
-(SCStyleRenderer*)rendererForView:(id)view;

@end
//
//  SCDelegateMultiplexer.h
//  Beautify
//
//  Created by Colin Eberhardt on 03/06/2013.
//  Copyright (c) 2013 Colin Eberhardt. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SCDelegateMultiplexer : NSObject

@property id delegate;
@property id proxiedDelegate;

@end
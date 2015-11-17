/* Copyright (c) 2014-present, Facebook, Inc.
 * All rights reserved.
 *
 * This source code is licensed under the BSD-style license found in the
 * LICENSE file in the root directory of this source tree. An additional grant
 * of patent rights can be found in the PATENTS file in the same directory.
 */

#import <Foundation/Foundation.h>

@class ASDisplayNode;
@class _ASDisplayLayer;

@protocol ASDisplayNodeDelegate <NSObject>

@required
- (void)nodeDidLoad;
- (BOOL)isNodeLoaded;

@optional
- (void)nodeWillDisplay;
- (void)nodeDidDisplay;
- (void)nodeWillEndDisplay;
- (void)nodeDidEndDisplay;

- (void)nodeWillLayoutSubnodes;
- (void)nodeDidLayoutSubnodes;

@end
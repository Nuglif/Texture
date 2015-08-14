/* Copyright (c) 2014-present, Facebook, Inc.
 * All rights reserved.
 *
 * This source code is licensed under the BSD-style license found in the
 * LICENSE file in the root directory of this source tree. An additional grant
 * of patent rights can be found in the PATENTS file in the same directory.
 */

#import <UIKit/UIKit.h>

@class ASDisplayNode;
@class ASDisplayNodeController;
@protocol ASDisplayNodeContainerDelegate <NSObject>

@required
- (void)nodeContainerWillDisplayNode:(ASDisplayNode *)node;
- (void)nodeContainerDidDisplayNode:(ASDisplayNode *)node;
- (UIImage *)nodeContainerThumbnailForNode:(ASDisplayNode *)node contentsRect:(CGRect *)contentsRect;

@optional
- (void)presentNodeController:(ASDisplayNodeController *)nodeController animated:(BOOL)flag completion:(void(^)())completion;
@end
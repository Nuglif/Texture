/* Copyright (c) 2014-present, Facebook, Inc.
 * All rights reserved.
 *
 * This source code is licensed under the BSD-style license found in the
 * LICENSE file in the root directory of this source tree. An additional grant
 * of patent rights can be found in the PATENTS file in the same directory.
 */

#import "ASDealloc2MainObject.h"
#import "ASDisplayNode.h"
#import "ASDisplayNodeDelegate.h"

@interface ASDisplayNodeController : ASDealloc2MainObject <ASDisplayNodeDelegate>

@property (nonatomic) ASDisplayNode *node;

@property (nonatomic, readonly, weak) ASDisplayNodeController *parentNodeController;
@property (nonatomic, readonly) NSArray *childNodeControllers;

- (void)createNode;
- (void)configureNode;

- (BOOL)isNodeCreated;
- (void)nodeDidLoad;

- (void)addChildNodeController:(ASDisplayNodeController *)nodeController;
- (void)addChildNodeController:(ASDisplayNodeController *)nodeController superNode:(ASDisplayNode *)superNode;
- (void)removeFromParentNodeController;

- (void)willMoveToParentNodeController:(ASDisplayNodeController *)parentNodeController;
- (void)didMoveToParentNodeController:(ASDisplayNodeController *)parentNodeController;

- (CGSize)calculateSizeForNode:(ASDisplayNode *)node thatFits:(CGSize)constrainedSize;

@end

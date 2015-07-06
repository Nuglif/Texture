//
/* Copyright (c) 2014-present, Facebook, Inc.
 * All rights reserved.
 *
 * This source code is licensed under the BSD-style license found in the
 * LICENSE file in the root directory of this source tree. An additional grant
 * of patent rights can be found in the PATENTS file in the same directory.
 */

#import "ASDisplayNodeController.h"

@interface ASDisplayNodeController ()
@property (nonatomic) NSMutableArray *childControllers;
@property (nonatomic) ASDisplayNodeController *parentNodeController;
@end

@interface ASDisplayNode (Test)
- (void)__setDelegate:(id)test;
@end


@implementation ASDisplayNodeController

- (instancetype)init
{
	self = [super init];
	if(self) {
		self.childControllers = [NSMutableArray array];
	}
	return self;
}

- (ASDisplayNode *)node
{
	if(!_node) {
		[self createNode];
	}
	return _node;
}

#pragma mark - Public methods
- (void)createNode
{
	if(!self.isNodeCreated) {
		self.node = [[ASDisplayNode alloc] init];
	}
    
    [self.node __setDelegate:self];    
}

- (BOOL)isNodeCreated
{
    return _node != nil;
}

- (void)nodeDidLoad
{
    // Implement in subclass
}

- (NSArray *)childNodeControllers
{
	return [self.childControllers copy];
}

- (void)addChildNodeController:(ASDisplayNodeController *)nodeController
{
    [self addChildNodeController:nodeController superNode:self.node];
}

- (void)addChildNodeController:(ASDisplayNodeController *)nodeController superNode:(ASDisplayNode *)superNode
{
    @synchronized(_childControllers) {
        [self.childControllers addObject:nodeController];
    }
    nodeController.parentNodeController = self;
    
    ASDisplayNode *controllerSuperNode = superNode ?: self.node;
    
    if(!controllerSuperNode.isLayerBacked && (controllerSuperNode.isLayerBacked != nodeController.node.isLayerBacked)) {
        nodeController.node.layerBacked = NO;
    }
    
    CGSize calculatedSize = [self calculateSizeForNode:nodeController.node thatFits:controllerSuperNode.calculatedSize];
    [nodeController.node measure:calculatedSize];
    
    [controllerSuperNode addSubnode:nodeController.node];
    [nodeController didMoveToParentNodeController:self];
}

- (void)removeFromParentNodeController
{
	[self willMoveToParentNodeController:nil];
	
    @synchronized(_childControllers) {
        [self.parentNodeController.childControllers removeObject:self];
    }
    
	self.parentNodeController = nil;
	[self.node removeFromSupernode];
	
	[self didMoveToParentNodeController:nil];
}

- (void)willMoveToParentNodeController:(ASDisplayNodeController *)parentNodeController
{
    // Implement in subclass
}

- (void)didMoveToParentNodeController:(ASDisplayNodeController *)parentNodeController
{
    // Implement in subclass
}

#pragma mark - ASDisplayNodeDelegate
- (BOOL)isNodeLoaded
{
    return [self isNodeCreated] && self.node.isNodeLoaded;
}

- (CGSize)calculateSizeForNode:(ASDisplayNode *)node thatFits:(CGSize)constrainedSize
{
  return CGSizeZero;
}

@end

//
//  ASTouchInterceptingNode.m
//  
//
//  Created by Bussiere, Mathieu on 2015-08-11.
//
//

#import "ASTouchInterceptingNode.h"

#import "ASDisplayNode+Subclasses.h"

@implementation ASTouchInterceptingNode

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.enableTouchInterception = YES;
    }
    
    return self;
}

- (instancetype)initWithLayerBlock:(ASDisplayNodeLayerBlock)viewBlock
{
    self = [super initWithLayerBlock:viewBlock];
    if (self) {
        self.enableTouchInterception = YES;
    }
    
    return self;
}

- (instancetype)initWithViewBlock:(ASDisplayNodeViewBlock)viewBlock
{
    self = [super initWithViewBlock:viewBlock];
    if (self) {
        self.enableTouchInterception = YES;
    }
    
    return self;
}

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event
{
    if (self.enableTouchInterception) {
        [self.interceptingDelegate node:self interceptedTouchAtPoint:&point event:event];
    }
    
    return [super hitTest:point withEvent:event];
}

@end

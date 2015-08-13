//
//  ASTouchInterceptingNode.h
//  
//
//  Created by Bussiere, Mathieu on 2015-08-11.
//
//

#import <AsyncDisplayKit/ASDisplayNode.h>

@class ASTouchInterceptingNode;
@protocol ASTouchInterceptingNodeDelegate <NSObject>

- (void)node:(ASTouchInterceptingNode *)interceptingNode interceptedTouchAtPoint:(inout CGPoint *)point event:(UIEvent *)event;

@end

@interface ASTouchInterceptingNode : ASDisplayNode

@property (nonatomic) id<ASTouchInterceptingNodeDelegate> interceptingDelegate;
@property (nonatomic) BOOL enableTouchInterception;

@end

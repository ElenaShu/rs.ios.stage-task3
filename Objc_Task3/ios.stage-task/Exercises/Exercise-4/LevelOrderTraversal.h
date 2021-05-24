#ifndef LevelOrderTraversal_h
#define LevelOrderTraversal_h

#import <Foundation/Foundation.h>

@interface TreeNode : NSObject

@property (nonatomic, weak, readonly) TreeNode *parent;
@property (nonatomic, strong, readonly) TreeNode *left;
@property (nonatomic, strong, readonly) TreeNode *right;
@property (nonatomic, strong, readonly) NSNumber *number;

- (instancetype) init;
@end

@interface Tree : NSObject

@property (nonatomic, strong, readonly) NSArray *treeArray;
@property (nonatomic, strong, readonly) NSMutableArray *resultArray;
@property (nonatomic, strong, readonly) TreeNode *headTree;
@property (nonatomic, weak, readonly) TreeNode *nowTree;
@property (nonatomic, assign, readonly) NSInteger level;
@property (nonatomic, assign, readonly) BOOL nowLeft;
@property (nonatomic, assign, readonly) BOOL isCreatedTree;

- (instancetype)initWithArray:(NSArray *)treeArray;
- (void) createTree: (NSInteger) i;

@end

NSArray *LevelOrderTraversalForTree(NSArray *tree);

#endif /* LevelOrderTraversal_h */


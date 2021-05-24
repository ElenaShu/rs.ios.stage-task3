#import "LevelOrderTraversal.h"

@interface TreeNode ()

@property (nonatomic, weak, readwrite) TreeNode *parent;
@property (nonatomic, strong, readwrite) TreeNode *left;
@property (nonatomic, strong, readwrite) TreeNode *right;
@property (nonatomic, strong, readwrite) NSNumber *number;

@end

@implementation TreeNode

- (instancetype) init{
    self = [super init];
    if (self) {
        _parent = nil;
        _left = nil;
        _right = nil;
        _number = nil;
    }
    return self;
}

@end

@interface Tree ()

@property (nonatomic, strong, readwrite) NSArray *treeArray;
@property (nonatomic, strong, readwrite) NSMutableArray *resultArray;
@property (nonatomic, strong, readwrite) TreeNode *headTree;
@property (nonatomic, weak, readwrite) TreeNode *nowTree;
@property (nonatomic, assign, readwrite) NSInteger level;
@property (nonatomic, assign, readwrite) BOOL nowLeft;
@property (nonatomic, assign, readwrite) BOOL isCreatedTree;

@end

@implementation Tree

- (void) createTree: (NSInteger) i {
    if (i == [_treeArray count]) _isCreatedTree = true;
    if (_isCreatedTree) return;
    if (_nowLeft) {
        if([_treeArray objectAtIndex:i] == [NSNull null]) {
            _nowLeft = false;
            i++;
            [self createTree: i];
        } else {
            if (_nowTree.left != nil) {
                _nowLeft = false;
                [self createTree: i];
            }
            TreeNode * treeNode = [[TreeNode alloc] init];
            [treeNode setParent: _nowTree];
            [treeNode setNumber: [_treeArray objectAtIndex: i]];
            [_nowTree setLeft:treeNode];
            _nowTree = treeNode;
            if([_resultArray count] <= _level) {
                NSMutableArray * array = [[NSMutableArray alloc] initWithObjects: [_treeArray objectAtIndex: i], nil];
                [_resultArray addObject: array];
            } else [[_resultArray objectAtIndex: _level] addObject: [_treeArray objectAtIndex: i]];
            i++;
            _level++;
            [self createTree: i];
        }
    } else {
        if([_treeArray objectAtIndex:i] == [NSNull null]) {
            if (_nowTree.parent == nil) {
                _isCreatedTree = true;
                return;
            }
            _nowTree = _nowTree.parent;
            _level--;
            if (_nowTree.right != nil) [self createTree:i];
            i++;
            [self createTree:i];
        } else {
            TreeNode * treeNode = [[TreeNode alloc] init];
            [treeNode setParent: _nowTree];
            [treeNode setNumber: [_treeArray objectAtIndex: i]];
            [_nowTree setRight: treeNode];
            _nowTree = treeNode;
            _nowLeft = true;
            if([_resultArray count] <= _level) {
                NSMutableArray * array = [[NSMutableArray alloc] initWithObjects: [_treeArray objectAtIndex: i], nil];
                [_resultArray addObject: array];
            } else [[_resultArray objectAtIndex: _level] addObject: [_treeArray objectAtIndex: i]];
            i++;
            _level++;
            [self createTree:i];
        }
    }
}

- (instancetype)initWithArray:(NSArray *)treeArray {
    self = [super init];
    if (self) {
        _treeArray = treeArray;
        _nowLeft = true;
        _isCreatedTree = false;
        NSArray * array = [[NSArray alloc] initWithObjects:[treeArray objectAtIndex: 0], nil];
        _resultArray = [[NSMutableArray alloc] initWithObjects: array, nil];
        _level = 1;
    }
    return self;
}

@end

NSArray *LevelOrderTraversalForTree(NSArray *tree) {
    
    if([tree count] == 0) return @[];
    if([tree objectAtIndex:0] == [NSNull null]) return @[[NSNull null]];
    Tree * treeObj = [[Tree alloc]  initWithArray: tree];
    TreeNode * treeNode = [[TreeNode alloc] init];
    [treeObj setHeadTree: treeNode];
    [treeObj setNowTree: treeNode];
    treeObj.headTree = treeObj.nowTree;
    treeNode.number = [tree objectAtIndex: 0];
    NSInteger i = 1;
    [treeObj createTree: i];
    NSMutableArray * resultArray = [[NSMutableArray alloc] init];
    for ( NSMutableArray * value in treeObj.resultArray) {
        NSArray * array = [[NSArray alloc] initWithArray: value];
        [resultArray addObject: array];
    }
    return resultArray;
}

#import "PlayersSeparator.h"

@implementation PlayersSeparator

- (NSInteger)dividePlayersIntoTeams:(NSArray<NSNumber *>*)ratingArray {
    NSUInteger count = [ratingArray count];
  //  NSUInteger res = 0;
    if(count < 3) return 0;
    NSMutableArray *resArray = [NSMutableArray new];
    for (NSUInteger i = 0; i < count - 2; i++)
        for (NSUInteger j = 1; j < count - 1; j++)
            for (NSUInteger k = 2; k < count; k++) {
                if ( i >= j || i >= k || j >= k) continue;
                
                NSInteger numI = [[ratingArray objectAtIndex: i] integerValue];
                NSInteger numJ = [[ratingArray objectAtIndex: j] integerValue];
                NSInteger numK = [[ratingArray objectAtIndex: k] integerValue];
                
                if (numI == numJ || numI == numK || numJ == numK) return 0;
                if ( ((numI < numJ && numJ < numK ) || (numI > numJ && numJ > numK )) && ( numI >= 0 && numK >=0) ) {
                    NSArray * array = [[NSArray alloc] initWithObjects: [ratingArray objectAtIndex: i],
                                                                        [ratingArray objectAtIndex: j],
                                                                        [ratingArray objectAtIndex: k],
                                                                        nil];
                    if ( ![resArray containsObject: array]) [resArray addObject: array];
                }
    }
    return [resArray count];
}

@end

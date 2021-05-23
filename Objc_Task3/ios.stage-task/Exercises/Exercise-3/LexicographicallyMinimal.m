#import "LexicographicallyMinimal.h"

@interface LexicographicallyMinimal()

@property (nonatomic, strong) NSMutableString *resultString;

@end

@implementation LexicographicallyMinimal

-(NSString *)findLexicographicallyMinimalForString1:(NSString *)string1 andString2:(NSString *)string2 {
    if (string1 == nil && string2 == nil) return nil;
    
    NSString * str1 = [[NSString alloc] initWithString: string1];
    NSString * str2 = [[NSString alloc] initWithString: string2];
    NSMutableString * resString = [[NSMutableString alloc] init];
    
    NSCharacterSet * set = [NSCharacterSet uppercaseLetterCharacterSet];
    while ([str1 length] != 0 && [str2 length] != 0) {
        if ([str1 characterAtIndex: 0] <= [str2 characterAtIndex: 0]) {
            if (![set characterIsMember: [str1 characterAtIndex: 0]]) return nil;
            [resString appendFormat: @"%C", [str1 characterAtIndex: 0]];
            str1 = [str1 substringFromIndex: 1];
        } else {
            if (![set characterIsMember: [str2 characterAtIndex: 0]]) return nil;
            [resString appendFormat: @"%C", [str2 characterAtIndex: 0]];
            str2 = [str2 substringFromIndex: 1];
        }
    }
    
    if ([str1 length] != 0)
        while ([str1 length] != 0) {
            if (![set characterIsMember: [str1 characterAtIndex: 0]]) return nil;
            [resString appendFormat: @"%C", [str1 characterAtIndex: 0]];
            str1 = [str1 substringFromIndex: 1];
        }
    else if ([str2 length] != 0)
        while ([str2 length] != 0) {
            if (![set characterIsMember: [str2 characterAtIndex: 0]]) return nil;
            [resString appendFormat: @"%C", [str2 characterAtIndex: 0]];
            str2 = [str2 substringFromIndex: 1];
    }
    return resString;
}

@end

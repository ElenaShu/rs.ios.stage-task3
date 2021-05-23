#import "DateHelper.h"

@implementation DateHelper

#pragma mark - First

-(NSString *)monthNameBy:(NSUInteger)monthNumber {
    NSArray * arrayMonth = [[NSArray alloc] initWithObjects: @"January", @"February", @"March", @"April", @"May", @"June", @"July", @"August", @"September", @"October", @"November", @"December", nil];
    if (monthNumber < 1 || monthNumber > 12)
        return nil;
    return [arrayMonth objectAtIndex: monthNumber - 1];
}

#pragma mark - Second

- (long)dayFromDate:(NSString *)date {
    NSDateFormatter * dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = @"yyyy-MM-dd'T'HH:mm:ssZ";
    NSDate * dateFromString = [dateFormatter dateFromString: date];
    NSDateFormatter * resDateFormatter = [[NSDateFormatter alloc] init];
    resDateFormatter.dateFormat = @"dd";
    
    long res = [[resDateFormatter stringFromDate: dateFromString] longLongValue];
    return res;
}

#pragma mark - Third

- (NSString *)getDayName:(NSDate*) date {
    NSDateFormatter * dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.locale = [[NSLocale alloc] initWithLocaleIdentifier: @"ru_RU"];
    dateFormatter.dateFormat = @"EE";
    NSString * resString = [dateFormatter stringFromDate: date];
    return resString;
}

#pragma mark - Fourth

- (BOOL)isDateInThisWeek:(NSDate *)date {
    NSDateFormatter * monthDateFormatter = [[NSDateFormatter alloc] init];
    monthDateFormatter.dateFormat = @"MM";
    
    NSDateFormatter * yearDateFormatter = [[NSDateFormatter alloc] init];
    yearDateFormatter.dateFormat = @"yyyy";
    
    NSDateFormatter * dayDateFormatter = [[NSDateFormatter alloc] init];
    dayDateFormatter.dateFormat = @"dd";
    
    NSInteger year = [[yearDateFormatter stringFromDate: date] integerValue];
    NSInteger month = [[monthDateFormatter stringFromDate: date] intValue];
    NSInteger day = [[dayDateFormatter stringFromDate: date] intValue];
    
    if ( year == 2021 && month == 5 &&
        (day >= 17 && day <= 23)) {
        return YES;
    }
    return NO;
}

@end

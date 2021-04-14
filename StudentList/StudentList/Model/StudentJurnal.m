//
//  StudentJurnal.m
//  StudentList
//
//  Created by Denis Dmitriev on 14.04.2021.
//

#import "StudentJurnal.h"

@implementation StudentJurnal

- (instancetype)initWithName:(NSString *)name surname:(NSString *)surname age:(NSNumber *)age raiting:(NSNumber *)raiting
{
    self = [super initWithName:name surname:surname age:age];
    if (self) {
        _raiting = raiting;
    }
    return  self;
}

- (void)setRaiting:(NSNumber *)raiting {
    _raiting = raiting;
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"%@%@%@%@", super.description , @"\n", @"Рейтинг - ", self.raiting];
}

@end

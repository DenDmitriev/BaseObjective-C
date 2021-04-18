//
//  Flock.m
//  BirdFlock
//
//  Created by Denis Dmitriev on 18.04.2021.
//

#import "Flock.h"

@implementation Flock

- (instancetype)init
{
    self = [super init];
    if (self) {
        NSLog(@"Create flock");
    }
    return self;
}

- (void)configWithBird:(Bird *)bird count:(NSNumber *)count {
    [bird retain];
    [bird release];
    _bird = bird;
    NSLog(@"Add bird for flock");
    
    [count retain];
    [count release];
    _count = count;
    NSLog(@"Add count of bird in flock");
}

- (void)remove {
    NSLog(@"Remove bird and count from flock");
    [_bird release];
    [_count release];
}

- (void)dealloc {
    [self remove];
    NSLog(@"Dealloc flock");
    [super dealloc];
}

@end

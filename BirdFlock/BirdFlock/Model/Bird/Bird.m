//
//  Bird.m
//  BirdFlock
//
//  Created by Denis Dmitriev on 18.04.2021.
//

#import "Bird.h"

@implementation Bird

- (instancetype)initWithSpecies:(NSNumber *)species {
    self = [super init];
    if (self) {
        [species retain];
        [species release];
        self.species = species;
        NSLog(@"Create Bird -  %@", species);
    }
    return self;
}

- (void)dealloc {
    NSLog(@"Dealloc Bird - %@", self.species);
    [self.species retain];
    [self.species release];
    [super dealloc];
}

@end

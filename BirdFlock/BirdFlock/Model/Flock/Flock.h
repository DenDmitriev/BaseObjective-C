//
//  Flock.h
//  BirdFlock
//
//  Created by Denis Dmitriev on 18.04.2021.
//

#import <Foundation/Foundation.h>
#import "Bird.h"

NS_ASSUME_NONNULL_BEGIN

@interface Flock : NSObject

- (void)configWithBird:(Bird *)bird count:(NSNumber *)count;

@property (nonatomic, strong) NSNumber *count;
@property (nonatomic, strong) Bird *bird;

@end

NS_ASSUME_NONNULL_END

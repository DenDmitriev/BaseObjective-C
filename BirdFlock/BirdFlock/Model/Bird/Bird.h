//
//  Bird.h
//  BirdFlock
//
//  Created by Denis Dmitriev on 18.04.2021.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Bird : NSObject

@property (nonatomic, strong) NSString *species;

- (instancetype)initWithSpecies:(NSString *)species;

@end

NS_ASSUME_NONNULL_END

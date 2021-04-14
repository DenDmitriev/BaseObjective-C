//
//  StudentJurnal.h
//  StudentList
//
//  Created by Denis Dmitriev on 14.04.2021.
//

#import <Foundation/Foundation.h>
#import "Student.h"

NS_ASSUME_NONNULL_BEGIN

@interface StudentJurnal : Student

@property (nonatomic, strong, readonly) NSNumber *raiting;

- (instancetype)initWithName:(NSString *)name surname:(NSString *)surname age:(NSNumber *)age raiting:(NSNumber *)raiting;

- (void)setRaiting:(NSNumber * _Nonnull)raiting;

@end

NS_ASSUME_NONNULL_END

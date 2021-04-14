//
//  Student.h
//  StudentList
//
//  Created by Denis Dmitriev on 14.04.2021.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Student : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *surname;
@property (nonatomic, strong, readonly) NSNumber *age;

- (instancetype)initWithName:(NSString *)name
                     surname:(NSString *)surname
                         age:(NSNumber *)age;

- (void)setAge:(NSNumber *)age;

@end

NS_ASSUME_NONNULL_END

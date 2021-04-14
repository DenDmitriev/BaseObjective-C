//
//  Student.m
//  StudentList
//
//  Created by Denis Dmitriev on 14.04.2021.
//

#import "Student.h"

@implementation Student

- (instancetype)initWithName:(NSString *)name surname:(NSString *)surname age:(NSNumber *)age
{
    self = [super init];
    if (self) {
        _name = name;
        _surname = surname;
        _age = age;
    }
    return  self;
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"%@%@%@%@%@%@%@", @"\n", @"Студент - ", self.fullname, @"\n", @"Возраст - ", self.age, @" лет"];
}

- (NSString *)fullname
{
    return [NSString stringWithFormat: @"%@%@%@",self.name, @" ", self.surname];
}

- (void)setAge:(NSNumber *)age
{
    _age = age;
}

@end

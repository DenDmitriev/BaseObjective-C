//
//  Calc.m
//  Calculator
//
//  Created by Denis Dmitriev on 17.04.2021.
//

#import "Calc.h"

@implementation Calc

- (instancetype)initWithOperation:(CalcOperation)operation
{
    self = [super init];
    if (self) {
        self.operation = operation;
        self.previusValue = 0;
        self.currentValue = 0;
        self.nextInput = YES;
    }
    return self;
}

//MARK: - Public Calc methods

- (void)reset {
    self.previusValue = 0;
    self.currentValue = 0;
}

- (void)compute:(NSString *)value {
    self.nextInput = YES;
    self.currentValue = [value doubleValue];
    self.previusValue = [self calculate:_operation a:&(_previusValue) b:&(_currentValue)];
    self.currentValue = 0;
}

- (void)getOperationFrom:(NSString *)title {
    NSArray *titles = @[@"+", @"−", @"×", @"÷"];
    NSInteger operationString = [titles indexOfObject:title];
    switch (operationString) {
        case 0:
            self.operation = summa;
            break;
        case 1:
            self.operation = subtract;
            break;
        case 2:
            self.operation = multiplication;
            break;
        case 3:
            self.operation = division;
            break;
        default:
            NSLog(@"%@", @"Can't get the operation");
            break;
    }
}

- (void)unar {
    self.previusValue = unar(self.previusValue);
}

//MARK: - Private

-(CGFloat)calculate:(CalcOperation)operation a:(CGFloat *)valueA b:(CGFloat *)valueB {
    switch (operation) {
        case summa:
            return sum(*valueA, *valueB);
            break;
        case subtract:
            return sub(*valueA, *valueB);
            break;
        case multiplication:
            return multi(*valueA, *valueB);
            break;
        case division:
            return divide(*valueA, *valueB);
            break;
    };
}

CalcBlockDouble sum = ^(CGFloat valueA, CGFloat valueB) {
    return valueA + valueB;
};

CalcBlockDouble sub = ^(CGFloat valueA, CGFloat valueB) {
    return valueA - valueB;
};

CalcBlockDouble multi = ^(CGFloat valueA, CGFloat valueB) {
    return valueA * valueB;
};

CalcBlockDouble divide = ^(CGFloat valueA, CGFloat valueB) {
    return valueA / valueB;
};

CalcBlockSingle unar = ^(CGFloat value) {
    return value * (-1);
};

@end

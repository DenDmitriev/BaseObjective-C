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
        NSLog(@"Create Calc with operation - %ld", (long)self.operation);
    }
    return self;
}

- (void)dealloc
{
    NSLog(@"Dealloc Calc - %f", self.previusValue);
    [super dealloc];
}

//MARK: - Public Calc methods

- (void)reset {
    self.previusValue = 0;
    self.currentValue = 0;
}

- (void)compute:(NSString *)value {
    self.nextInput = YES;
    self.currentValue = [value doubleValue];
    self.previusValue = self.calculate;
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
    self.previusValue = self.previusValue * (-1);
}

//MARK: - Private

- (CGFloat)calculate {
    switch (_operation) {
        case summa:
            return [self sum];
            break;
        case subtract:
            return [self sub];
            break;
        case multiplication:
            return [self multi];
            break;
        case division:
            return [self div];
            break;
        default:
            return 0;
            break;
    }
}

- (CGFloat)sum {
    return (self.previusValue + self.currentValue);
}

- (CGFloat)sub {
    return (self.previusValue - self.currentValue);
}

- (CGFloat)multi {
    return (self.previusValue * self.currentValue);
}

- (CGFloat)div {
    return (self.previusValue / self.currentValue);
}

@end

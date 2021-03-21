//
//  ViewController.m
//  Calculator
//
//  Created by Denis Dmitriev on 21.03.2021.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSLog(@"Даны числа:");
    
    CGFloat valueA = 3;
    NSLog(@"a = %ld", (long)valueA);
    CGFloat valueB = 7;
    NSLog(@"b = %ld", (long)valueB);
    CGFloat valueC = -2;
    NSLog(@"b = %ld", (long)valueC);
    
    NSLog(@"Калькулятор:");
    
    NSInteger resultSum = valueA + valueB;
    NSInteger resultSub = valueA - valueB;
    NSInteger resultMult = valueA * valueB;
    CGFloat resultDiv = valueA / valueB;
    
    NSLog(@"a + b = %ld, a - b = %ld, a * b = %ld, a / b = %f", resultSum, resultSub, resultMult, resultDiv);
    
    CGFloat resultAverage = (valueA + valueB + valueC) / 3;
    
    NSLog(@"Среднее число равно %f", resultAverage);
}


@end

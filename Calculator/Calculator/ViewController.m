//
//  ViewController.m
//  Calculator
//
//  Created by Denis Dmitriev on 21.03.2021.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextField *valueAField;
@property (weak, nonatomic) IBOutlet UITextField *valueBField;
@property (weak, nonatomic) IBOutlet UILabel *resultField;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *calcButtons;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    NSLog(@"Даны числа:");
//
//    CGFloat valueA = 3;
//    NSLog(@"a = %ld", (long)valueA);
//    CGFloat valueB = 7;
//    NSLog(@"b = %ld", (long)valueB);
//    CGFloat valueC = -2;
//    NSLog(@"b = %ld", (long)valueC);
//
//    NSLog(@"Калькулятор:");
//
//    NSInteger resultSum = valueA + valueB;
//    NSInteger resultSub = valueA - valueB;
//    NSInteger resultMult = valueA * valueB;
//    CGFloat resultDiv = valueA / valueB;
//
//    NSLog(@"a + b = %ld, a - b = %ld, a * b = %ld, a / b = %f", resultSum, resultSub, resultMult, resultDiv);
//
//    CGFloat resultAverage = (valueA + valueB + valueC) / 3;
//
//    NSLog(@"Среднее число равно %f", resultAverage);
}

//MARK: - Calc methods


typedef NS_ENUM(NSInteger, CalcOperations) {
    summa = 0,
    subtract = 1,
    multiplication = 2,
    division = 3,
};



- (CGFloat)calculate:(CalcOperations)operation a:(CGFloat)valueA b:(CGFloat)valueB {

    switch (operation) {
        case summa:
            return [self sum:valueA with:valueB];
            break;
            
        case subtract:
            return [self sub:valueA with:valueB];
            break;
            
        case multiplication:
            return [self multi:valueA with:valueB];
            break;
            
        case division:
            return [self div:valueA with:valueB];
            break;
            
        default:
            return 0.0;
            break;
    }
}

- (CGFloat)sum:(CGFloat)valueA with:(CGFloat)valueB {
    CGFloat resultSum = valueA + valueB;
    return resultSum;
}

- (CGFloat)sub:(CGFloat)valueA with:(CGFloat)valueB {
    CGFloat resultSub = valueA - valueB;
    return resultSub;
}

- (CGFloat)multi:(CGFloat)valueA with:(CGFloat)valueB {
    CGFloat resultMult = valueA * valueB;
    return resultMult;
}

- (CGFloat)div:(CGFloat)valueA with:(CGFloat)valueB {
    CGFloat resultDiv = valueA / valueB;
    return resultDiv;
}

//MARK: - Actions

- (IBAction)calcAction:(UIButton *)sender {
    for (UIButton* button in self.calcButtons) {
        if (button != sender) {
            button.selected = NO;
            [button setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
        } else {
            sender.selected = YES;
            [sender setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        }
    }
}

- (IBAction)calculateAction:(UIButton *)sender {
    for (UIButton* button in self.calcButtons) {
        if (button.selected) {
            
            CalcOperations operation = summa;
            //Тут не придумал удобнее варианта, свитч не дает сравнивать NSString
            //Возможно нужно было объявить переменную, но я не разобрался как
            if ([button.titleLabel.text isEqual:@"+"]) {
                operation = summa;
            } else if ([button.titleLabel.text isEqual:@"−"]) {
                operation = subtract;
            } else if ([button.titleLabel.text isEqual:@"×"]) {
                operation = multiplication;
            } else if ([button.titleLabel.text isEqual:@"÷"]) {
                operation = division;
            }
            
            CGFloat valueA = [self.valueAField.text doubleValue];
            CGFloat valueB = [self.valueBField.text doubleValue];
            
            CGFloat result = [self calculate:operation a:valueA b:valueB];
            self.resultField.text = [NSString stringWithFormat:@"%g", result];
            break;
        }
    }
}


@end

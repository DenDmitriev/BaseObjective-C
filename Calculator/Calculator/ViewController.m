//
//  ViewController.m
//  Calculator
//
//  Created by Denis Dmitriev on 21.03.2021.
//

#import "ViewController.h"

typedef NS_ENUM(NSInteger, CalcOperations) {
    summa = 0,
    subtract = 1,
    multiplication = 2,
    division = 3,
};
CalcOperations operation;
CGFloat previusValue;
CGFloat currentValue;
BOOL nextInput;

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *resultField;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *calcButtons;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *numberButtons;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *buttons;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    operation = summa;
    previusValue = 0;
    currentValue = 0;
    nextInput = YES;
    
    for (UIButton* button in self.buttons) {
        button.layer.cornerRadius = button.frame.size.height/8;
        button.layer.masksToBounds = YES;
    }
}

//MARK: - Calc methods

- (CGFloat)calculate {
    switch (operation) {
        case summa:
            return [self sum:previusValue with:currentValue];
            break;
        case subtract:
            return [self sub:previusValue with:currentValue];
            break;
        case multiplication:
            return [self multi:previusValue with:currentValue];
            break;
        case division:
            return [self div:previusValue with:currentValue];
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

- (IBAction)numberAction:(UIButton *)sender {
    NSString *oldValue = self.resultField.text;
    if (nextInput) {
        nextInput = NO;
        oldValue = @"";
    }
    if (oldValue.length < 7) {
        if ([oldValue isEqual:@"0"]) {
            oldValue = @"";
        }
        NSString *newValue = [oldValue stringByAppendingString:sender.titleLabel.text];
        self.resultField.text = newValue;
    }
}

- (IBAction)clearAction:(UIButton *)sender {
    self.resultField.text = @"";
}

- (IBAction)clearOperationAction:(UIButton *)sender {
    previusValue = 0;
    currentValue = 0;
    self.resultField.text = @"";
}

- (IBAction)unarAction:(UIButton *)sender {
    CGFloat value = [self.resultField.text doubleValue];
    CGFloat newValue = value * (-1);
    self.resultField.text = [NSString stringWithFormat:@"%g", newValue];
}

- (IBAction)calcAction:(UIButton *)sender {
    
    if (!nextInput) {
        nextInput = YES;
        currentValue = [self.resultField.text doubleValue];
        previusValue = [self calculate];
        currentValue = 0;
        
        self.resultField.text = [NSString stringWithFormat:@"%g", previusValue];
    }
    
    NSString *buttonTitle = sender.titleLabel.text;
    NSArray *titles = @[@"+", @"−", @"×", @"÷"];
    NSInteger title = [titles indexOfObject:buttonTitle];
    switch (title) {
        case 0:
            operation = summa;
            break;
        case 1:
            operation = subtract;
            break;
        case 2:
            operation = multiplication;
            break;
        case 3:
            operation = division;
            break;
        default:
            break;
    }
}

- (IBAction)totalAction:(UIButton *)sender {
    nextInput = YES;
    currentValue = [self.resultField.text doubleValue];
    previusValue = [self calculate];
    self.resultField.text = [NSString stringWithFormat:@"%g", previusValue];
}


@end

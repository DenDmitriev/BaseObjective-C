//
//  ViewController.m
//  Calculator
//
//  Created by Denis Dmitriev on 21.03.2021.
//

#import "ViewController.h"
#import "Calc.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *resultField;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *calcButtons;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *numberButtons;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *buttons;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.calc = [[Calc new] initWithOperation:summa];
    
    for (UIButton* button in self.buttons) {
        button.layer.cornerRadius = button.frame.size.height/8;
        button.layer.masksToBounds = YES;
    }
}

//MARK: - Actions

- (IBAction)numberAction:(UIButton *)sender {
    
    NSString *oldValue = self.resultField.text;
    if (self.calc.nextInput) {
        self.calc.nextInput = NO;
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
    [self.calc reset];
    self.resultField.text = @"";
}

- (IBAction)unarAction:(UIButton *)sender {
    CGFloat value = [self.resultField.text doubleValue];
    CGFloat newValue = value * (-1);
    [self.calc unar];
    self.resultField.text = [NSString stringWithFormat:@"%g", newValue];
}

- (IBAction)calcAction:(UIButton *)sender {
    if (!self.calc.nextInput) {
        [self.calc compute:self.resultField.text];
        self.resultField.text = [NSString stringWithFormat:@"%g", self.calc.previusValue];
    }
    [self.calc getOperationFrom:sender.titleLabel.text];
}

- (IBAction)totalAction:(UIButton *)sender {
    [self.calc compute:self.resultField.text];
    self.resultField.text = [NSString stringWithFormat:@"%g", self.calc.previusValue];
}

@end

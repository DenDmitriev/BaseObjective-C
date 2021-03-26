//
//  ViewController.m
//  Alphabet
//
//  Created by Denis Dmitriev on 26.03.2021.
//

#import "ViewController.h"

@interface ViewController () <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *alphabetTextField;
@property (weak, nonatomic) IBOutlet UILabel *resultLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setup];
}

- (void)setup {
    self.alphabetTextField.delegate = self;
}

- (BOOL)isExists: (NSString*)letter {
    NSArray *alphabet = @[@"a", @"b", @"c", @"d", @"e", @"f", @"g", @"h", @"i", @"j", @"k", @"l", @"m", @"n", @"o", @"p", @"q", @"r", @"s", @"t", @"u", @"v", @"w", @"x", @"y", @"z"];
    
    if ([alphabet containsObject: letter]) {
        return YES;
    } else {
        return NO;
    }
}

- (IBAction)isExistsButton:(UIButton *)sender {
    NSString *letter = _alphabetTextField.text.lowercaseString;
    NSLog(@"%@", letter);
    BOOL isExists = [self isExists:letter];
    NSLog(@"Contains is - %s", isExists ? "Yes" : "No");
}

- (BOOL) textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}

- (void)textFieldDidChangeSelection:(UITextField *)textField {
    NSString *text = [textField text];
    
    if ([text length] > 1) {
        text = [text substringFromIndex:[text length] - 1];
        textField.text = text;
    }
    
    NSString *letter = text.lowercaseString;
    BOOL isExists = [self isExists:letter];
    NSLog(@"%@, %s", text, isExists ? "contained in the English alphabet" : "not contained in the English alphabet");
    
    self.resultLabel.textColor = isExists ? [UIColor systemGreenColor] : [UIColor systemRedColor];
    self.resultLabel.text = isExists ? @"Yes" : @"No";
}

@end

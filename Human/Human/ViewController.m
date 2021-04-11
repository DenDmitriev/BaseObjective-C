//
//  ViewController.m
//  Human
//
//  Created by Denis Dmitriev on 11.04.2021.
//

#import "ViewController.h"

typedef NS_ENUM(NSInteger, Gander) {
    female = 0,
    male = 1,
};

struct Human {
    NSString *name;
    NSInteger age;
    Gander gander;
};

@interface ViewController ()

@end

@implementation ViewController

typedef struct Human Human;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    Human pushkin;
    pushkin.age = 37;
    pushkin.gander = male;
    pushkin.name = @"Александр Пушкин";
    [self logDescription:pushkin];
    
    Human rand = {@"Айн Рэнд", 77, female};
    [self logDescription:rand];
    
    Human hemingway = {@"Эрнест Хемингуэй", 61, male};
    [self logDescription:hemingway];
}

- (NSString*)ganderDescription:(Gander)gander {
    NSDictionary *ganderDescription = @{@0: @"женщина", @1: @"мужчина"};
    return [ganderDescription objectForKey:@(gander)];
}

- (void)logDescription:(Human)human {
    NSLog(@"Имя - %@, пол - %@, возраст - %ld", human.name, [self ganderDescription:human.gander], human.age);
}


@end

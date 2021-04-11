//
//  ViewController.m
//  Сycle
//
//  Created by Denis Dmitriev on 11.04.2021.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSArray *names = @[
        @"Кролик Джо-джо",
        @"Бабавоз",
        @"Майор Гром"
    ];
    
    for (NSString *name in names) {
        NSLog(@"Его зовут - %@", name);
    }
    
    NSDictionary *actors = @{
        @"Питер Динклэйдж": @"Тирион Ланнистер",
        @"Эмилия Кларк": @"Дейнерис Таргариен",
        @"Кит Харингтон": @"Джон Сноу",
        @"Николай Костер-Вальдау": @"Джейме Ланнистер",
        @"Эйдан Гиллен": @"Мизинец"
    };
    NSEnumerator *keyActros = [actors keyEnumerator];
    id key;
    while ((key = [keyActros nextObject])) {
        id value = [actors objectForKey:key];
        NSLog(@"%@, в роли - %@", key, value);
    }
    
    NSInteger index = 1;
    NSInteger count = 9;
    do {
        NSLog(@"%ld", (long)index);
        index ++;
    } while (index <= count);
    
}


@end

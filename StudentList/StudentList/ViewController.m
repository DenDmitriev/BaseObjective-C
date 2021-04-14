//
//  ViewController.m
//  StudentList
//
//  Created by Denis Dmitriev on 14.04.2021.
//

#import "ViewController.h"
#import "Student.h"
#import "StudentJurnal.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    Student *denisDmitriev = [[Student new]initWithName:@"Денис" surname:@"Дмитриев" age:[NSNumber numberWithInt:30]];
    Student *vasiliyKotov = [[Student new]initWithName:@"Василий" surname:@"Котов" age:[NSNumber numberWithInt:24]];
    Student *semenZacepin = [[Student new]initWithName:@"Семен" surname:@"Зацепин" age:[NSNumber numberWithInt:29]];
    Student *olgaZumina = [[Student new]initWithName:@"Ольга" surname:@"Зумина" age:[NSNumber numberWithInt:33]];
    
    NSArray *students = @[denisDmitriev, vasiliyKotov, semenZacepin, olgaZumina];
    
    for (Student *student in students) {
        NSLog(@"%@", student.description);
    }
    
    [denisDmitriev setAge:[NSNumber numberWithInt:31]];
    NSLog(@"%@", denisDmitriev.description);
    
    
    Student *romanBelaev = [[StudentJurnal new]initWithName:@"Роман" surname:@"Беляев" age:[NSNumber numberWithInt:30] raiting:[NSNumber numberWithInt:73]];
    NSLog(@"%@", romanBelaev.description);
}


@end

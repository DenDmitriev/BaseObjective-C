//
//  ViewController.m
//  BirdFlock
//
//  Created by Denis Dmitriev on 18.04.2021.
//

#import "ViewController.h"
#import "Bird.h"
#import "Flock.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    Flock *flock = [Flock new];
    
    Bird *bird = [[Bird alloc] initWithSpecies:@"Shadoof"];
    
    [flock configWithBird:bird count:@37];
    [flock release];
}


@end

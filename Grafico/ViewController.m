//
//  ViewController.m
//  Grafico
//
//  Created by Mateus de Campos on 09/10/14.
//  Copyright (c) 2014 Workflow Tecnologia. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (strong, nonatomic) IBOutlet UIView *mainGraph;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //Setting the corner of view
    self.mainGraph.layer.cornerRadius = 10;
    self.mainGraph.layer.masksToBounds = YES;
    
    //Creating a view to be our progress view and setting width = 0;
    UIView * progressGraph = [[UIView alloc] initWithFrame:self.mainGraph.frame];
    [progressGraph setBackgroundColor:[UIColor redColor]];
    CGRect progressRect = progressGraph.frame;
    progressRect.size.width = 0;
    [progressGraph setFrame:progressRect];
    [self.view addSubview:progressGraph];
    
    //Animating progress view to our progress point
    [UIView animateWithDuration:1.0
                          delay:0.0
                        options:UIViewAnimationOptionOverrideInheritedOptions
                     animations:^{
                         
                         CGRect progressRect = progressGraph.frame;
                         // set here the relative progress point
                         progressRect.size.width = 100;
                         [progressGraph setFrame:progressRect];
                     }
                     completion:nil];
    
    //Creating description label to any point of the progress
    UILabel * label1 = [[UILabel alloc] initWithFrame:CGRectMake(progressGraph.frame.origin.x, progressGraph.frame.origin.y - 20, 50, 20)];
    label1.text = @"Initial";
    [self.view addSubview:label1];
    label1.font = [label1.font fontWithSize:10];
    
    UILabel * label2 = [[UILabel alloc] initWithFrame:CGRectMake(progressGraph.frame.origin.x + progressGraph.frame.size.width, progressGraph.frame.origin.y - 20, 50, 20)];
    label2.text = @"Progress";
    [self.view addSubview:label2];
    label2.font = [label2.font fontWithSize:10];
    
    UILabel * label3 = [[UILabel alloc] initWithFrame:CGRectMake(progressGraph.frame.origin.x + self.mainGraph.frame.size.width, progressGraph.frame.origin.y - 20, 50, 20)];
    label3.text = @"Goal";
    [self.view addSubview:label3];
    label3.font = [label3.font fontWithSize:10];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

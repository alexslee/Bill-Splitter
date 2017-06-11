//
//  ViewController.m
//  BillSplitter
//
//  Created by Alex Lee on 2017-06-10.
//  Copyright © 2017 Alex Lee. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextField *billTextField;

@property (weak, nonatomic) IBOutlet UISlider *peopleNumberSlider;

@property (weak, nonatomic) IBOutlet UILabel *splitTotalLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)calculateSplitAmount:(UIButton *)sender {
    
}

@end

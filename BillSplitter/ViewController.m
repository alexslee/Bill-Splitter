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

@property (weak, nonatomic) IBOutlet UISlider *tipSlider;

@property (weak, nonatomic) IBOutlet UILabel *splitTotalLabel;

@property (weak, nonatomic) IBOutlet UILabel *tipPercentDisplay;

@property (weak, nonatomic) IBOutlet UILabel *splitNumberDisplay;

@property (strong, nonatomic)NSNumber *tip;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.tip = [[NSNumber alloc] initWithFloat:15.0];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textFieldDidChange:) name:UITextFieldTextDidChangeNotification object:nil];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)calculateSplitAmount;
{
    float bill = [self.billTextField.text floatValue];
    float numberOfPeople = floor(self.peopleNumberSlider.value);
    
    float total = (bill / numberOfPeople);
    
    total += [self updateTipPercent:total];
    
    self.splitTotalLabel.text = [NSString stringWithFormat:@"$%.2lf",total];
}


- (IBAction)changedNumberOfPeople:(UISlider *)sender {
    if (sender == self.peopleNumberSlider) {
        self.splitNumberDisplay.text = [NSString stringWithFormat:@"%.0lf People",floor(self.peopleNumberSlider.value)];
        
        [self calculateSplitAmount];
    }
}

- (IBAction)changedTipPercent:(UISlider *)sender {
    if (sender == self.tipSlider) {
        
        self.tip = [NSNumber numberWithFloat:floor(self.tipSlider.value)];
        
        self.tipPercentDisplay.text = [NSString stringWithFormat:@"%.0lf%% Tip",[self.tip floatValue]];
        
        [self calculateSplitAmount];
    }
}

- (float)updateTipPercent:(float)total;
{
    float tipPercentage = [self.tip floatValue] / 100;
    return (total * tipPercentage);
}

- (void)textFieldDidChange:(NSNotification *)sender;
{
    [self calculateSplitAmount];
}

@end

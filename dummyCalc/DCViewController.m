//
//  DCViewController.m
//  dummyCalc
//
//  Created by Meynard on 11/24/12.
//
//

#import "DCViewController.h"

// Variable Declarations
typedef enum {
    plus, minus, times, divide, defaults
} dummyOper;
dummyOper operation;
float temp;
float current, result;
Boolean btnOper = false, btnEqual = false;

@interface DCViewController ()

@end

@implementation DCViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    operation = defaults;
    btnOper = true;
    temp = 0;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)numBtn:(UIButton *)sender {
    // Number buttons
    
    if (btnOper) {
        // if a math operation button is clicked
        
        self.calcField.text = @"";
        btnOper = false;
    }
    if ([self.calcField.text isEqualToString:@"0"]) {
        // if the text field is empty then...
        
        if (sender.tag == 0) {
            // if the sender.tag belongs to zero button
            // it will do nothing
            
        } else {
            self.calcField.text = @"";
            self.calcField.text = [self.calcField.text stringByAppendingFormat:@"%d", sender.tag];
        }
    } else {
        self.calcField.text = [self.calcField.text stringByAppendingFormat:@"%d", sender.tag];
    }
    
    
}
- (IBAction)operateBtn:(UIButton *)sender {
    // Math Operation buttons
    
    if (sender.tag == 99 && !btnOper) {
        // Equals button
        
        [self valueOperate]; // method call for valueOperate
        
    } else {
        if ( !btnOper ) {
            // if there's no operator clicked
            
            [self valueOperate];
        }
        
        // if an operator is clicked
        if (sender.tag == 98)
            operation = plus;
        else if (sender.tag == 97)
            operation = minus;
        else if (sender.tag == 96)
            operation = times;
        else if (sender.tag == 95)
            operation = divide;
    }
    
    btnOper = true; // if an operator is clicked
}

- (void) valueOperate {
    // for evaluation
    
    current = self.calcField.text.floatValue; // stores the field's current value
    self.calcField.text = @""; // set the text field empty
    switch (operation) {
        case plus:
            current = temp + current;
            operation = defaults;
            break;
        case minus:
            current = temp - current;
            operation = defaults;
            break;
        case times:
            current = temp * current;
            operation = defaults;
            break;
        case divide:
            current = temp / current;
            operation = defaults;
            break;
        case defaults:
            //result = current;
            break;
    }
    
    self.calcField.text = [self.calcField.text stringByAppendingFormat:@"%.2f", current];
    
    temp = current; // stores the current value to temp
    
}


- (IBAction)specialBtn:(UIButton *)sender {
    
    if (sender.tag == 11) {
        // Positive/Negative button
        
        if ([self.calcField.text rangeOfString:@"-"].location != NSNotFound) {
            // if there's a negative (-) character in the field
            
            self.calcField.text = [self.calcField.text substringFromIndex:1];
            
        } else if ([self.calcField.text isEqualToString:@""]) {
            // if text field is empty
            
        } else if ([self.calcField.text isEqualToString:@"0"]) {
            // if text field only contains zero
            
        } else if ([self.calcField.text isEqualToString:@"0."] || [self.calcField.text isEqualToString:@"0.0"] || [self.calcField.text isEqualToString:@"0.00"]) {
            // if text field only cotains 0.00
            
        } else {
        self.calcField.text = [@"-" stringByAppendingString:self.calcField.text];
        }
        
    } else if (sender.tag == 111) {
        // Dot button
        
        if ([self.calcField.text rangeOfString:@"."].location != NSNotFound) {
            // if there's a dot in the text field
            
        } else if ([self.calcField.text isEqualToString:@""]) {
            // if text field is empty
            
            self.calcField.text = [self.calcField.text stringByAppendingFormat:@"0."];
        } else {
        self.calcField.text = [self.calcField.text stringByAppendingFormat:@"."];
        }
        
    } else if (sender.tag == 1111) {
        // C/Clear button
        
        btnOper = false;
        temp = 0, result = 0, current = 0;
        operation = defaults;
        self.calcField.text = @"";
        self.calcField.placeholder = @"0.";
    }
}
@end

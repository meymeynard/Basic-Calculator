//
//  DCViewController.h
//  dummyCalc
//
//  Created by Meynard on 11/24/12.
//
//

#import <UIKit/UIKit.h>

@interface DCViewController : UIViewController
@property (strong, nonatomic) IBOutlet UITextField *calcField;

- (IBAction)numBtn:(UIButton *)sender;

- (IBAction)operateBtn:(UIButton *)sender;

- (IBAction)specialBtn:(UIButton *)sender;

@end

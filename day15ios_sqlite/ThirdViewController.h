//
//  ThirdViewController.h
//  day15ios_sqlite
//
//  Created by Student 01 on 25/09/17.
//  Copyright © 2017 mohini. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "databaseLib.h"
@interface ThirdViewController : UIViewController


@property (weak, nonatomic) IBOutlet UITextField *taskIdText;

@property (weak, nonatomic) IBOutlet UITextField *taskNameText;
- (IBAction)updateBtn:(id)sender;
- (IBAction)deleteBtn:(id)sender;
@property NSString *tId;
@property NSString *tName;


@end

//
//  NextViewController.h
//  day15ios_sqlite
//
//  Created by Student 01 on 25/09/17.
//  Copyright © 2017 mohini. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "databaseLib.h"
@interface NextViewController : UIViewController


@property (weak, nonatomic) IBOutlet UITextField *idText;

@property (weak, nonatomic) IBOutlet UITextField *nameText;


- (IBAction)saveDataBtn:(id)sender;


@end

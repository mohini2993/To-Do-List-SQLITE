//
//  NextViewController.m
//  day15ios_sqlite
//
//  Created by Student 01 on 25/09/17.
//  Copyright © 2017 mohini. All rights reserved.
//

#import "NextViewController.h"

@interface NextViewController ()

@end

@implementation NextViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)saveDataBtn:(id)sender
{
    NSString *insertQuery=[NSString stringWithFormat:  @"insert into taskTable(taskId,taskName) values('%@','%@')",self.idText.text,self.nameText.text];
    BOOL isSuccess=[[databaseLib sharedObject] executeQuery:insertQuery];
    if(isSuccess)
    {
        NSLog(@"Record inserted Successfully");
    }
    else
    {
          NSLog(@"inserted Failed!!!");
    }
    
}
@end

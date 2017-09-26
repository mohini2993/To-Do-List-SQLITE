//
//  ThirdViewController.m
//  day15ios_sqlite
//
//  Created by Student 01 on 25/09/17.
//  Copyright © 2017 mohini. All rights reserved.
//

#import "ThirdViewController.h"

@interface ThirdViewController ()

@end

@implementation ThirdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.taskIdText.text=self.tId;
    self.taskNameText.text=self.tName;
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

- (IBAction)updateBtn:(id)sender
{
    NSString *updateQuery=[NSString stringWithFormat:@"update taskTable set taskName='%@' where taskId='%@'",self.taskNameText.text,self.taskIdText.text];
    BOOL isSuccess=[[databaseLib sharedObject] executeQuery:updateQuery];
    if(isSuccess)
    {
        NSLog(@"Record updated Successfully");
    }
    else
    {
        NSLog(@"updated Failed!!!");
    }
    

}

- (IBAction)deleteBtn:(id)sender
{
    NSString *deleteQuery=[NSString stringWithFormat:@"delete  from taskTable where taskId='%@'",self.taskIdText.text];
    BOOL isSuccess=[[databaseLib sharedObject] executeQuery:deleteQuery];
    if(isSuccess)
    {
        NSLog(@"Record deleted Successfully");
    }
    else
    {
        NSLog(@"deleted Failed!!!");
    }
}
@end

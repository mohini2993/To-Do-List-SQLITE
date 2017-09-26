//
//  ViewController.m
//  day15ios_sqlite
//
//  Created by Student 01 on 25/09/17.
//  Copyright © 2017 mohini. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
      NSString *selectQuery=@"select * from taskTable";
        [[databaseLib sharedObject]getAllTasks:selectQuery];
    self.taskArray=[databaseLib sharedObject].taskMutableArray;
    self.taskIdArray=[databaseLib sharedObject].taskIdMutableArray;
    if(self.taskArray.count >0)
       {
           self.myTableView.delegate=self;
           self.myTableView.dataSource=self;
       }
    
    // Do any additional setup after loading the view, typically from a nib.
}
-(void)viewWillAppear:(BOOL)animated
{
    NSString *selectQuery=@"select * from taskTable";
    [[databaseLib sharedObject]getAllTasks:selectQuery];
    self.taskArray=[databaseLib sharedObject].taskMutableArray;
    if(self.taskArray.count >0)
    {
        self.myTableView.delegate=self;
        self.myTableView.dataSource=self;
    }
    
  
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.taskArray.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"cell"];
    cell.textLabel.text=[self.taskIdArray objectAtIndex:indexPath.row];
    cell.detailTextLabel.text=[self.taskArray objectAtIndex:indexPath.row];

    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell=[tableView cellForRowAtIndexPath:indexPath];
    NSString *selectedId=cell.textLabel.text;
    NSLog(@"Selected Id %@",selectedId);
    NSString *selectedName=cell.textLabel.text;
    NSLog(@"Selected Name %@",selectedName);
    NSString *tsId=cell.textLabel.text;
    NSString *tsName=cell.detailTextLabel.text;
    
    ThirdViewController *nvc=[self.storyboard instantiateViewControllerWithIdentifier:@"ThirdViewController"];
    nvc.tId=tsId;
    nvc.tName=tsName;
    [self.navigationController pushViewController:nvc animated:YES];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

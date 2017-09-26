//
//  ViewController.h
//  day15ios_sqlite
//
//  Created by Student 01 on 25/09/17.
//  Copyright © 2017 mohini. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "databaseLib.h"
#import "ThirdViewController.h"
@interface ViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>


@property (weak, nonatomic) IBOutlet UITableView *myTableView;

@property NSArray *taskArray;
@property NSArray *taskIdArray;

@end


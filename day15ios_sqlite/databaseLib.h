//
//  databaseLib.h
//  day15ios_sqlite
//
//  Created by Student 01 on 25/09/17.
//  Copyright © 2017 mohini. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>
@interface databaseLib : NSObject
{
    sqlite3 *taskDatabase;
}
+(instancetype)sharedObject;
-(NSString *)getDatabasepath;
-(void)createDatabase;
-(BOOL)executeQuery:(NSString *)query;
-(void)getAllTasks:(NSString *)query;
@property NSMutableArray *taskMutableArray;
@property NSMutableArray *taskIdMutableArray;

@end

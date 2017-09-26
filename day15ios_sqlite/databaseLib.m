//
//  databaseLib.m
//  day15ios_sqlite
//
//  Created by Student 01 on 25/09/17.
//  Copyright © 2017 mohini. All rights reserved.
//

#import "databaseLib.h"

@implementation databaseLib
+(instancetype)sharedObject
{
    databaseLib static *obj;
    if(obj==nil)
    {
        obj=[[databaseLib alloc]init];
        
    }
      return obj;
}
-(NSString *)getDatabasepath
{
    NSString *dbpath;
    NSArray *pathDir=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, true);
    dbpath=  [pathDir objectAtIndex:0];
    dbpath=[dbpath stringByAppendingString:@"sqliteTaskDatabase.db"];
    return dbpath;
}
-(BOOL)executeQuery:(NSString *)query
{
    BOOL sucess=0;
    const char *CQuery=[query UTF8String];
    NSString *dbPath=[self getDatabasepath];
    sqlite3_stmt *stmt;
    const char *pathOfDatabase=[dbPath UTF8String];
    if(sqlite3_open(pathOfDatabase, &taskDatabase)==SQLITE_OK)
    {
        if(sqlite3_prepare_v2(taskDatabase, CQuery, -1, &stmt, nil)!=SQLITE_OK)
        {
             NSLog(@"Database not able to Open %s",sqlite3_errmsg(taskDatabase));
        }
        else
        {
            
           if(sqlite3_step(stmt)==SQLITE_DONE)
            {
                sucess=1;
            }
        }
    }
    else
    {
        NSLog(@"Database not able to Open %s",sqlite3_errmsg(taskDatabase));
    }
    sqlite3_close(taskDatabase);
    sqlite3_finalize(stmt);
    return sucess;
}
-(void)createDatabase
{
   
    NSString *createQuery=@"create table if not exists taskTable(taskID text,taskName text)";
    BOOL createSuccess=[self executeQuery:createQuery];
    if(createSuccess==YES)
    {
        NSLog(@"Database Sucessfully created");
    }
    else
    {
         NSLog(@"Database not created");
    }
   
}
-(void)getAllTasks:(NSString *)query
{
    self.taskMutableArray=[[NSMutableArray alloc]init];
    self.taskIdMutableArray=[[NSMutableArray alloc]init];
    const char *CQuery=[query UTF8String];
    NSString *dbPath=[self getDatabasepath];
    sqlite3_stmt *stmt;
    const char *pathOfDatabase=[dbPath UTF8String];
    if(sqlite3_open(pathOfDatabase, &taskDatabase)==SQLITE_OK)
    {
        if(sqlite3_prepare_v2(taskDatabase, CQuery, -1, &stmt, nil)!=SQLITE_OK)
        {
            NSLog(@"Database not able to Open %s",sqlite3_errmsg(taskDatabase));
        }
        else
        {
            
            while(sqlite3_step(stmt)==SQLITE_ROW)
            {
                const unsigned char *taskName=sqlite3_column_text(stmt, 1);
                NSString *task=[NSString stringWithFormat:@"%s",taskName];
                const unsigned char *taskId=sqlite3_column_text(stmt, 0);
                NSString *tId= [NSString stringWithFormat:@"%s",taskId];
                [self.taskIdMutableArray addObject:tId];
                [self.taskMutableArray addObject:task];
            }
        }
    }
    else
    {
        NSLog(@"Database not able to Open %s",sqlite3_errmsg(taskDatabase));
    }
    sqlite3_close(taskDatabase);
    sqlite3_finalize(stmt);
    NSLog(@"Task Array contains %@",self.taskMutableArray);
}



@end

//
//  Todo.h
//  Every.Do
//
//  Created by Alejandro Zielinsky on 2018-04-24.
//  Copyright © 2018 Alejandro Zielinsky. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Todo : NSObject

@property (nonatomic) NSString* title;
@property (nonatomic) NSString* text;
@property (nonatomic) int priorityNum;
@property (nonatomic) NSDate *dueDate;
@property BOOL isComplete;
-(instancetype)initWithTitle:(NSString*)title description:(NSString*)text priority:(int)num dueDate:(NSDate*)date;

@end

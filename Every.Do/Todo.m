//
//  Todo.m
//  Every.Do
//
//  Created by Alejandro Zielinsky on 2018-04-24.
//  Copyright © 2018 Alejandro Zielinsky. All rights reserved.
//

#import "Todo.h"

@implementation Todo

-(instancetype)initWithTitle:(NSString*)title description:(NSString*)text priority:(int)num dueDate:(NSDate*)date
{
    self = [super init];
    if (self) {
        _title = title;
        _text = text;
        _priorityNum = num;
        _dueDate = date;
    }
    return self;
}
@end

//
//  Todo.m
//  Every.Do
//
//  Created by Alejandro Zielinsky on 2018-04-24.
//  Copyright © 2018 Alejandro Zielinsky. All rights reserved.
//

#import "Todo.h"

@implementation Todo

-(instancetype)initWithTitle:(NSString*)title description:(NSString*)text priority:(int)num
{
    self = [super init];
    if (self) {
        _title = title;
        _text = text;
        _priorityNum = num;
    }
    return self;
}
@end

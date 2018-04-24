//
//  ToDoCell.m
//  Every.Do
//
//  Created by Alejandro Zielinsky on 2018-04-24.
//  Copyright © 2018 Alejandro Zielinsky. All rights reserved.
//

#import "ToDoCell.h"


@implementation ToDoCell

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)setTodoItem:(Todo *)todoItem
{
    _todoItem = todoItem;
    self.titleLabel.attributedText = nil;
    
     NSMutableAttributedString *attributeString = [[NSMutableAttributedString alloc] initWithString:todoItem.title];
    
    if(todoItem.isComplete)
    {
        [attributeString addAttribute:NSStrikethroughStyleAttributeName
                                value:@2
                                range:NSMakeRange(0, [attributeString length])];
        
        
    }
//    else
//    {
//
//        self.titleLabel.text = todoItem.title;
//    }
    self.titleLabel.attributedText = attributeString;
}


@end

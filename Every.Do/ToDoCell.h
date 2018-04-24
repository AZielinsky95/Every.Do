//
//  ToDoCell.h
//  Every.Do
//
//  Created by Alejandro Zielinsky on 2018-04-24.
//  Copyright © 2018 Alejandro Zielinsky. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Todo.h"
@interface ToDoCell : UITableViewCell

@property (nonatomic, weak) IBOutlet UILabel *titleLabel;
@property (nonatomic, weak) IBOutlet UILabel *descriptionLabel;
@property (nonatomic, weak) IBOutlet UILabel *priorityLabel;
@property (nonatomic) UISwipeGestureRecognizer *swipe;

@property (nonatomic) Todo* todoItem;



@end

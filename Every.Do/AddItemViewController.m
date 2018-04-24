//
//  AddItemViewController.m
//  Every.Do
//
//  Created by Alejandro Zielinsky on 2018-04-24.
//  Copyright © 2018 Alejandro Zielinsky. All rights reserved.
//

#import "AddItemViewController.h"
#import "Todo.h"
@interface AddItemViewController ()
@property (weak, nonatomic) IBOutlet UITextField *titleLabel;
@property (weak, nonatomic) IBOutlet UITextField *descriptionLabel;
@property (weak, nonatomic) IBOutlet UITextField *priorityLabel;

@end

@implementation AddItemViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (IBAction)done:(UIBarButtonItem *)sender
{
    Todo *newItem = [[Todo alloc] init];
    newItem.title = self.titleLabel.text;
    newItem.priorityNum = [self.priorityLabel.text intValue];
    newItem.text = self.descriptionLabel.text;
    [self.delegate addItemViewController:self didAddItem:newItem];
}

@end

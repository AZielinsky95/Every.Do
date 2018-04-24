//
//  TableViewController.m
//  Every.Do
//
//  Created by Alejandro Zielinsky on 2018-04-24.
//  Copyright © 2018 Alejandro Zielinsky. All rights reserved.
//

#import "TableViewController.h"
#import "ToDoCell.h"
#import "Todo.h"
#import "DetailViewController.h"

@interface TableViewController ()

@end

@implementation TableViewController

- (id)initWithCoder:(NSCoder *)aDecoder
{
    if ((self = [super initWithCoder:aDecoder]))
    {
        [self initialToDoItems];
    }
    return self;
}


- (void)viewDidLoad
{
    [super viewDidLoad];

}

-(void)addItemViewController:(AddItemViewController *)controller didAddItem:(Todo *)item
{
    [self.todoItems addObject:(item)];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:([self.todoItems count] - 1) inSection:0];
    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    [self dismissViewControllerAnimated:YES completion:nil];    
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.todoItems count];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"showDetail"]) {
        
        DetailViewController *detailsViewController = [segue destinationViewController];
        
        detailsViewController.detailedItem = [[Todo alloc] initWithTitle:[sender titleLabel].text description:[sender descriptionLabel].text priority:[[sender priorityLabel].text intValue]];
    }
    else if ([segue.identifier isEqualToString:@"addItem"])
    {
        AddItemViewController *addItemViewController = [segue destinationViewController];
        addItemViewController.delegate = self;
    }
}

-(void)initialToDoItems
{
    self.todoItems = [[NSMutableArray alloc] init];
    Todo *item1 = [[Todo alloc] init];
    item1.title = @"Groceries";
    item1.priorityNum = 5;
    item1.text = @"Need Milk, Eggs, Bread";
    
    Todo *item2 = [[Todo alloc] init];
    item2.title = @"Study";
    item2.priorityNum = 1;
    item2.text = @"Need to study iOS!";
    
    Todo *item3 = [[Todo alloc] init];
    item3.title = @"Gym";
    item3.priorityNum = 1;
    item3.text = @"go to gym for 1 hour!";
    
    [self.todoItems addObject:item1];
    [self.todoItems addObject:item2];
    [self.todoItems addObject:item3];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ToDoCell *cell = (ToDoCell*)[tableView dequeueReusableCellWithIdentifier:@"ToDoCell"];
    if (!cell.swipe)
    {
        UISwipeGestureRecognizer *swipeGesture = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(itemComplete:)];
        [swipeGesture setDirection:UISwipeGestureRecognizerDirectionLeft];
        [cell addGestureRecognizer:swipeGesture];
    }
    Todo *todo = (self.todoItems)[indexPath.row];
    cell.todoItem = todo;
    cell.titleLabel.text = todo.title;
    cell.descriptionLabel.text = todo.text;
    cell.priorityLabel.text = [NSString stringWithFormat:@"P: %d",todo.priorityNum];
    
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}


-(void)itemComplete:(UISwipeGestureRecognizer*)sender
{
    ToDoCell *cell = (ToDoCell*)sender.view;

    if(cell.todoItem.isComplete)
    {
        cell.todoItem.isComplete = NO;
    }
    else
    {
        [self.todoItems removeObject:cell.todoItem];
        [self.todoItems addObject:cell.todoItem];
        cell.todoItem.isComplete = YES;
        [self.tableView reloadData];
    }
}



@end

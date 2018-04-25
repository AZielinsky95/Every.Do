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

-(void)setEditing:(BOOL)editing
{
    [super setEditing:editing];
    
    if([self.tableView isEditing])
    {
        [self.tableView setEditing:NO animated:YES];
    }
    else
    {
        [self.tableView setEditing:YES animated:YES];
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationItem.leftBarButtonItem = self.editButtonItem;
}

-(void)addItemViewController:(AddItemViewController *)controller didAddItem:(Todo *)item
{
    [self.openItems addObject:(item)];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:([self.openItems count] - 1) inSection:0];
    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    [self dismissViewControllerAnimated:YES completion:nil];    
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //return self.data[section].count
    if(section == 0)
    {
        return self.openItems.count;
    }
    else
    {
        return self.closedItems.count;
    }
    
//    return 1;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"showDetail"]) {
        
        DetailViewController *detailsViewController = [segue destinationViewController];
        
        detailsViewController.detailedItem = [[Todo alloc] initWithTitle:[sender titleLabel].text description:[sender descriptionLabel].text priority:[[sender priorityLabel].text intValue] dueDate:[sender todoItem].dueDate];
    }
    else if ([segue.identifier isEqualToString:@"addItem"])
    {
        AddItemViewController *addItemViewController = [segue destinationViewController];
        addItemViewController.delegate = self;
    }
}

-(void)initialToDoItems
{
    self.openItems = [[NSMutableArray alloc] init];
    self.closedItems = [[NSMutableArray alloc] init];
    
    Todo *item1 = [[Todo alloc] init];
    item1.title = @"Groceries";
    item1.priorityNum = 5;
    item1.text = @"Need Milk, Eggs, Bread";
    item1.dueDate = [NSDate date];
    
    Todo *item2 = [[Todo alloc] init];
    item2.title = @"Study";
    item2.priorityNum = 1;
    item2.text = @"Need to study iOS!";
    item2.dueDate = [NSDate date];
    
    Todo *item3 = [[Todo alloc] init];
    item3.title = @"Gym";
    item3.priorityNum = 1;
    item3.text = @"go to gym for 1 hour!";
    item3.dueDate = [NSDate date];
    
    [self.openItems addObject:item1];
    [self.openItems addObject:item2];
    [self.openItems addObject:item3];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ToDoCell *cell = (ToDoCell*)[tableView dequeueReusableCellWithIdentifier:@"ToDoCell"];
    
    if (!cell.swipe)
    {
        UISwipeGestureRecognizer *swipeGesture = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(itemComplete:)];
        [swipeGesture setDirection:UISwipeGestureRecognizerDirectionRight];
        [cell addGestureRecognizer:swipeGesture];
    }
    //[indexPath.section][indexPath.row];
    Todo *todo;
    if(indexPath.section == 0)
    {
    todo = self.openItems[indexPath.row];
    }
    else if(indexPath.section == 1)
    {
    todo = self.closedItems[indexPath.row];
    }
    
    
    cell.todoItem = todo;
    cell.titleLabel.text = todo.title;
    cell.descriptionLabel.text = todo.text;
    cell.priorityLabel.text = [NSString stringWithFormat:@"P: %d",todo.priorityNum];
    
    return cell;
}


- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete)
    {
        [self.openItems removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    }
}

- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath {
    NSString *stringToMove = [self.openItems objectAtIndex:sourceIndexPath.row];
    [self.openItems removeObjectAtIndex:sourceIndexPath.row];
    [self.openItems insertObject:stringToMove atIndex:destinationIndexPath.row];
}


- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return YES if you want the specified item to be editable.
    return YES;
}

-(BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    if(section==0)
    return 45;
    else
    return 0;
}

-(void)itemComplete:(UISwipeGestureRecognizer*)sender
{
    ToDoCell *cell = (ToDoCell*)sender.view;

    if(cell.todoItem.isComplete)
    {
        [self.closedItems removeObject:cell.todoItem];
        [self.openItems addObject:cell.todoItem];
        cell.todoItem.isComplete = NO;
    }
    else
    {
        [self.openItems removeObject:cell.todoItem];
        [self.closedItems addObject:cell.todoItem];
        cell.todoItem.isComplete = YES;
    }
    
    [self.tableView reloadData];
}



@end

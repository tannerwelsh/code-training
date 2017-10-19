//
//  XYZToDoListViewController.m
//  ToDoList
//
//  Created by Tanner Welsh on 10/27/13.
//  Copyright (c) 2013 Tanner Welsh. All rights reserved.
//

#import "XYZToDoListViewController.h"

#import "XYZAppDelegate.h"

#import "XYZAddToDoItemViewController.h"
#import "XYZToDoItem.h"
#import "ToDoItem.h"

@interface XYZToDoListViewController ()

@property (nonatomic, retain) NSManagedObjectContext *managedObjectContext;
@property (nonatomic, retain) XYZAppDelegate *appDelegate;

@property (nonatomic, strong) NSArray *fetchedRecordsArray;

@end

@implementation XYZToDoListViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.appDelegate = [UIApplication sharedApplication].delegate;
    self.managedObjectContext = self.appDelegate.managedObjectContext;
    
    [self refresh];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)refresh
{
    self.fetchedRecordsArray = [self.appDelegate getAllToDoItems];
    [self.tableView reloadData];
}

- (void)persistToDos
{
    NSError *error;
    if (![self.managedObjectContext save:&error]) {
        NSLog(@"Whoops, couldn't save: %@", [error localizedDescription]);
    }
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [self.fetchedRecordsArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"ListPrototypeCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    ToDoItem *toDoItem = [self.fetchedRecordsArray objectAtIndex:indexPath.row];

    cell.textLabel.text = toDoItem.itemName;
    if (toDoItem.completed) {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    } else {
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    
    return cell;
}

// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    
    ToDoItem *tappedItem = [self.fetchedRecordsArray objectAtIndex:indexPath.row];
    
    if (tappedItem.completed == nil) {
        tappedItem.completed = @1;
    } else {
        if ([tappedItem.completed isEqualToNumber:@1]) {
            tappedItem.completed = NO;
        } else {
            tappedItem.completed = @1;
        }
    }
    
    [self persistToDos];
    
    [tableView reloadRowsAtIndexPaths:@[indexPath]
                    withRowAnimation:UITableViewRowAnimationNone];
}

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

 */

- (IBAction)unwindToList:(UIStoryboardSegue *)segue
{
    XYZAddToDoItemViewController *source = [segue sourceViewController];
    XYZToDoItem *item = source.toDoItem;
    
    if (item != nil) {
        ToDoItem *newItem = [NSEntityDescription insertNewObjectForEntityForName:@"ToDoItem"
                                                          inManagedObjectContext:self.managedObjectContext];
        
        newItem.itemName = item.itemName;
        newItem.completed = NO;

        [self persistToDos];
        
//        [self.toDoItems addObject:item];
        [self refresh];
    }
}

@end

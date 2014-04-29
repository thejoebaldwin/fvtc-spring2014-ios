//
//  MainViewController.m
//  SuperheroStore
//
//  Created by student on 2/24/14.
//  Copyright (c) 2014 fvtc. All rights reserved.
//

#import "MainViewController.h"
#import "SuperheroStore.h"
#import "Hero.h"
#import "DetailViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}


-(void) AddItem
{
    //add a random superhero to the shared store
    
    Hero *hero = [[SuperheroStore SharedStore] CreateHero];
    [hero RandomizeHero];
    
   // [[SuperheroStore SharedStore] AddSuperhero:[Superhero RandomSuperhero]];
    //get the tableview control
    [[self tableView] reloadData];
}

-(id) init
{
    self = [super init];
    if (self)
    {
        //create an add button item
        UIBarButtonItem *AddButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(AddItem)];
        
        //add the button to the navigation
        [[self navigationItem] setRightBarButtonItem:AddButton];
        
    }
    
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    
    UISwipeGestureRecognizer *gestureLeft;
    gestureLeft = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipeFrom:)];
    gestureLeft.direction = UISwipeGestureRecognizerDirectionLeft;
    [[self tableView] addGestureRecognizer:gestureLeft];

}


-(void) handleSwipeFrom:(UISwipeGestureRecognizer *) sender
{
    NSLog(@"Swiped");
    if (sender.state == UIGestureRecognizerStateEnded)
    {
        CGPoint swipeLocation = [sender locationInView:[self tableView]];
        NSIndexPath *indexPath = [[self tableView] indexPathForRowAtPoint:swipeLocation];
        
        NSLog(@"Indexpath Row:%i||Section:%i", [indexPath row], [indexPath section]);
        NSLog(@"Count:%i", [[SuperheroStore SharedStore] Count] );
        if (indexPath != nil && [indexPath row] < [[SuperheroStore SharedStore] Count] )
        {
           [[self tableView] beginUpdates];
        
            [[self tableView] deleteRowsAtIndexPaths:[[NSArray alloc] initWithObjects:indexPath, nil]
                                withRowAnimation:UITableViewRowAnimationLeft];

            [[SuperheroStore SharedStore] RemoveSuperheroAtIndex:[indexPath row]];
        
            [[self tableView] endUpdates];
        }
    }
    
}

-(void) viewDidAppear:(BOOL)animated
{
    [[self tableView] reloadData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
    return [[SuperheroStore SharedStore] Count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    // Configure the cell...
    Hero *hero = [[SuperheroStore SharedStore] SuperheroAtIndex:[indexPath row]];
    
    NSString *display = [[NSString alloc] initWithFormat:@"%@: %@", hero.name, hero.power];
    
    [[cell textLabel] setText:display];
    
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

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

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    
     DetailViewController *detailViewController = [[DetailViewController alloc] init];
    [detailViewController SetSuperheroIndex:[indexPath row]];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     
}

@end

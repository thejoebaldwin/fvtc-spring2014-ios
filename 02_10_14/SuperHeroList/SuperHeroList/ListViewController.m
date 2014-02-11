//
//  ListViewController.m
//  SuperHeroList
//
//  Created by student on 2/10/14.
//  Copyright (c) 2014 FVTC. All rights reserved.
//

#import "ListViewController.h"
#import "DetailViewController.h"

@interface ListViewController ()

@end

@implementation ListViewController

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
    
    _superheroes = [[NSMutableArray alloc] init];
    
    Superhero  *temp = [[Superhero alloc] init];
    [temp SetName:@"Iron Man"];
    [temp SetPower:@"Suit of Armor"];
    [temp SetSecret:@"Tony Stark"];
    [temp SetImage:@"ironman.jpeg"];
    [_superheroes addObject:temp];
    
    temp = [[Superhero alloc] init];
    [temp SetName:@"Thor"];
    [temp SetPower:@"Hammer"];
    [temp SetSecret:@"Eric Masterson"];
    [temp SetImage:@"thor.jpg"];
    [_superheroes addObject:temp];
    
    /*
    [_superheroes addObject:[[Superhero alloc] initWithName:@"Thor" withPower:@"Hammer" withSecret:@"Eric Masterson"]];
    */
    
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

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
//#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
 //#warning Incomplete method implementation.
    // Return the number of rows in the section.
   // return 0;
    return [_superheroes count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //set the key for the cell
    static NSString *CellIdentifier = @"Cell";
    //see if there are any unused cells available already in the tableview
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    //if there isn't any available, cell will be NULL
    if (cell == nil) {
        //so create a new cell, using the "Cell" key, so we can reuse them again
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    // Configure the cell...
    //get row index
    int row = [indexPath row];
    //get the superhero out of the array at that index
    Superhero *tempHero = [_superheroes objectAtIndex:row];
    //get the superhero name
    NSString *name = [tempHero Name];
    
    NSString *image_name = [tempHero Image];
    UIImage *image = [UIImage imageNamed:image_name];
    
    //[cell setImage:image];
    [[cell imageView] setImage:image];
    
    //[cell setText:name];
    [[cell textLabel] setText:name];
    
    
    
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
     // ...
     // Pass the selected object to the new view controller.
    int row = [indexPath row];
    //get the superhero out of the array at that index
    Superhero *tempHero = [_superheroes objectAtIndex:row];
    
    [detailViewController SetName: [tempHero Name]];
    [detailViewController SetPower: [tempHero Power]];
    
    
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:detailViewController];
    //use the navigation controller to display the about view controller
    [self presentViewController:nav animated:YES completion:nil];
  
   
    
    
    
}

@end

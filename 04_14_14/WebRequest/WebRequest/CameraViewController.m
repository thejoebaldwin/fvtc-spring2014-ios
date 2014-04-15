//
//  CameraViewController.m
//  WebRequest
//
//  Created by student on 4/14/14.
//  Copyright (c) 2014 FVTC. All rights reserved.
//

#import "CameraViewController.h"
#import "GameStore.h"
#import "LocationViewController.h"

@interface CameraViewController ()

@end

@implementation CameraViewController

@synthesize ImageView, TakePhotoButton;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    if (![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera])
    {
        UIAlertView *myAlertView = [[UIAlertView alloc] initWithTitle:@"Error"
                                                              message:@"Device has no camera"
                                                             delegate:nil
                                                    cancelButtonTitle:@"OK"
                                                    otherButtonTitles:nil];
        //[myAlertView show];
        [TakePhotoButton setEnabled:NO];
        
    }
    [ImageView setImage:[[GameStore SharedStore] Image]];
    
    
    UIBarButtonItem *locationButton = [[UIBarButtonItem alloc]
                                       initWithTitle:@"Location"
                                       style:UIBarButtonItemStyleBordered
                                       target:self
                                       action:@selector(navigateLocation)];
    self.navigationItem.rightBarButtonItem = locationButton;
    
}

-(void) navigateLocation
{
    
    LocationViewController *location = [[LocationViewController alloc] init];
    [[self navigationController] pushViewController:location animated:YES];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)TakePhotoButtonClick:(id)sender {
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.allowsEditing = YES;
    picker.sourceType = UIImagePickerControllerSourceTypeCamera;
    [self presentViewController:picker animated:YES completion:nil];
}

- (IBAction)SelectPhotoButtonClick:(id)sender {
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.allowsEditing = YES;
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    [self presentViewController:picker animated:YES completion:nil];
}

- (IBAction)UploadPhotoButtonClick:(id)sender {
    
    void (^block) (void) = ^{
        
        NSLog(@"Upload Photo Complete");
        
    };
    
    UIImage *image = [ImageView image];
    [[GameStore SharedStore] UpdateProfileImage:image withBlock:block];
    
}

-(void) imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    UIImage *chosenImage = info[UIImagePickerControllerEditedImage];
    self.ImageView.image = chosenImage;
    [picker dismissViewControllerAnimated:YES completion:nil];
}

-(void) imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [picker dismissViewControllerAnimated:YES completion:nil];
}


@end

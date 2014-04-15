//
//  CameraViewController.h
//  WebRequest
//
//  Created by student on 4/14/14.
//  Copyright (c) 2014 FVTC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CameraViewController : UIViewController <UIImagePickerControllerDelegate, UINavigationControllerDelegate>

- (IBAction)TakePhotoButtonClick:(id)sender;
- (IBAction)SelectPhotoButtonClick:(id)sender;
- (IBAction)UploadPhotoButtonClick:(id)sender;
@property (weak, nonatomic) IBOutlet UIImageView *ImageView;
@property (weak, nonatomic) IBOutlet UIButton *TakePhotoButton;

@end

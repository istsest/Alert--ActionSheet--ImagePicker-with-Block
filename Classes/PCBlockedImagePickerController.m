//
//  PCBlockedImagePickerController.m
//  testPopCornComponents
//
//  Created by Joon on 13. 5. 14..
//  Copyright (c) 2013년 Joon. All rights reserved.
//

#import "PCBlockedImagePickerController.h"

@interface PCBlockedImagePickerController () <UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@end

@implementation PCBlockedImagePickerController


- (void)imagePickerController:(PCBlockedImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
	UIImage *editedImage = (UIImage *)[info valueForKey:UIImagePickerControllerEditedImage];
	if(!editedImage)
		editedImage = (UIImage *)[info valueForKey:UIImagePickerControllerOriginalImage];

	BOOL dismiss = YES;
	if(picker.selectImageBlock)
		picker.selectImageBlock(editedImage, info, &dismiss);
	if(dismiss)
		[picker dismissModalViewControllerAnimated:YES];
}

- (void)imagePickerControllerDidCancel:(PCBlockedImagePickerController *)picker
{
	if(picker.cancelBlock)
		picker.cancelBlock();
	[picker dismissModalViewControllerAnimated:YES];
}

- (void)showWithModalViewController:(UIViewController *)modalViewController
						   animated:(BOOL)animated
					  onSelectImage:(PCBlockedImagePickerControllerSelectImageBlock)dBlock
						   onCancel:(PCBlockedImagePickerControllerCancelBlock)cBlock
{
	self.delegate = self;
	self.selectImageBlock = dBlock;
	self.cancelBlock = cBlock;
	[modalViewController presentModalViewController:self animated:animated];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

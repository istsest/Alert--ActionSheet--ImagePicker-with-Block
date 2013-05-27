//
//  TestAlertViewController.m
//  testPopCornComponents
//
//  Created by Joon on 13. 5. 14..
//  Copyright (c) 2013년 Joon. All rights reserved.
//

#import "TestAlertViewController.h"
#import "PCBlockedAlertView.h"
#import "PCBlockedActionSheet.h"
#import "PCBlockedImagePickerController.h"

@interface TestAlertViewController () <UITableViewDataSource, UITableViewDelegate>

@end

@implementation TestAlertViewController


- (void)imagePickerBlock
{
	PCBlockedImagePickerController *ipc = [[PCBlockedImagePickerController alloc] init];
	ipc.allowsEditing = YES;
	ipc.sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
	[ipc showWithModalViewController:self
							animated:YES
					   onSelectImage:^(UIImage *image, NSDictionary *info, BOOL *dismiss) {
						   [PCBlockedAlertView showWithTitle:@"PCBlockedImagePickerController" message:@"You have selected image." cancelButtonTitle:@"Okey"];
						}
							onCancel:^(void) {
							   [PCBlockedAlertView showWithTitle:@"PCBlockedImagePickerController" message:@"You tapped Cancel Button." cancelButtonTitle:@"Okey"];
							}];
}

- (void)actionSheetBlock
{
	PCBlockedActionSheet *as = [[PCBlockedActionSheet alloc] initWithTitle:@"PCBlockedActionSheet"
													delegate:nil
										   cancelButtonTitle:@"Cancel"
									  destructiveButtonTitle:@"Button 1"
										   otherButtonTitles:@"Button 2", @"Button 3", nil];
	[as showInView:self.view
		 onDismiss:^(NSInteger buttonIndex ) {
			 [PCBlockedAlertView showWithTitle:@"PCBlockedActionSheet" message:[NSString stringWithFormat:@"You tapped Button %d.", buttonIndex + 1] cancelButtonTitle:@"Okey"];
		 }
		  onCancel:^(void) {
			  [PCBlockedAlertView showWithTitle:@"PCBlockedActionSheet" message:@"You tapped Cancel Button." cancelButtonTitle:@"Okey"];
		  }];
}

- (void)alertBlock
{
	[PCBlockedAlertView showWithTitle:@"PCBlockedAlertView"
					   message:@"If you tap a button, the block will be executed."
			 cancelButtonTitle:@"Cancel"
			 otherButtonTitles:@[@"Button 1", @"Button 2", @"Button 3"]
					 onDismiss:^(NSInteger buttonIndex) {
						 [PCBlockedAlertView showWithTitle:@"PCBlockedAlertView" message:[NSString stringWithFormat:@"You tapped Button %d.", buttonIndex + 1] cancelButtonTitle:@"Okey"];
					 }
					  onCancel:^(void) {
						  [PCBlockedAlertView showWithTitle:@"PCBlockedAlertView" message:@"You tapped Cancel Button." cancelButtonTitle:@"Okey"];
					  }];
}

- (int)numberOfSectionsInTableView:(UITableView *)tableView
{
	return 1;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
//	if(section == 0)
//		return @"PCBlockedAlertView";
	return @"";
}

- (int)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	NSString *cellIdentifier = @"TestAlertCell";
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
	if(cell == nil)
	{
		cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
	}
	
	int row = [indexPath row];
	if(row == 0)
		cell.textLabel.text = @"Simple Alert";
	else if(row == 1)
		cell.textLabel.text = @"Alert with Block";
	else if(row == 2)
		cell.textLabel.text = @"ActionSheet with Block";
	else if(row == 3)
		cell.textLabel.text = @"Image Picker with Block";
	
	return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
	int row = [indexPath row];
	
	switch(row)
	{
		case 0:
			[PCBlockedAlertView showWithTitle:@"PCBlockedAlertView" message:@"It has title, message and just only cancel button." cancelButtonTitle:@"Okey"];
			break;
		case 1:
			[self alertBlock];
			break;
		case 2:
			[self actionSheetBlock];
			break;
		case 3:
			[self imagePickerBlock];
			break;
	}
}


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

	self.title = @"Using Block";
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

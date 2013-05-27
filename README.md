Using Block Easily Alert, ActionSheet and ImagePicker
==========================


Simple Alert
<pre><code>
[PCBlockedAlertView showWithTitle:@"PCBlockedAlertView" message:@"It has title, message and just only cancel button." cancelButtonTitle:@"Okey"];
</code></pre>

Alert with block
<pre><code>
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
</code></pre>

ActionSheet with block
<pre><code>
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
</code></pre>

ImagePicker with block
<pre><code>
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
</code></pre>

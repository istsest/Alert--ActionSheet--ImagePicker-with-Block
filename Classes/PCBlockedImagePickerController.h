//
//  PCBlockedImagePickerController.h
//  testPopCornComponents
//
//  Created by Joon on 13. 5. 14..
//  Copyright (c) 2013년 Joon. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PCBlockedImagePickerController : UIImagePickerController

typedef void (^PCBlockedImagePickerControllerSelectImageBlock)(UIImage *image, NSDictionary *info, BOOL *dismiss);
typedef void (^PCBlockedImagePickerControllerCancelBlock)();

@property (nonatomic, copy)		PCBlockedImagePickerControllerSelectImageBlock		selectImageBlock;
@property (nonatomic, copy)		PCBlockedImagePickerControllerCancelBlock			cancelBlock;

- (void)showWithModalViewController:(UIViewController *)modalViewController
						   animated:(BOOL)animated
					  onSelectImage:(PCBlockedImagePickerControllerSelectImageBlock)dBlock
						   onCancel:(PCBlockedImagePickerControllerCancelBlock)cBlock;

@end

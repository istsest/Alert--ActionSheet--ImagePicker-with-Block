//
//  PCBlockedActionSheet.m
//  testPopCornComponents
//
//  Created by Joon on 13. 5. 14..
//  Copyright (c) 2013년 Joon. All rights reserved.
//

#import "PCBlockedActionSheet.h"


@interface PCBlockedActionSheet () <UIActionSheetDelegate>
{
	
}

@end


@implementation PCBlockedActionSheet


- (void)actionSheet:(PCBlockedActionSheet *)actionSheet didDismissWithButtonIndex:(NSInteger)buttonIndex
{
	if(buttonIndex == [actionSheet cancelButtonIndex])
	{
		if(actionSheet.cancelBlock)
			actionSheet.cancelBlock();
	}
	else
	{
		if(actionSheet.dismissBlock)
			actionSheet.dismissBlock(buttonIndex);
	}
}

- (void)actionSheetCancel:(PCBlockedActionSheet *)actionSheet
{
	if(actionSheet.cancelBlock)
		actionSheet.cancelBlock();
}

- (void)showInView:(UIView *)view
		 onDismiss:(PCBlockedActionSheetDismissBlock)dBlock
		  onCancel:(PCBlockedActionSheetCancelBlock)cBlock
{
	self.delegate = self;
	self.dismissBlock = dBlock;
	self.cancelBlock = cBlock;
	[self showInView:view];
}

@end

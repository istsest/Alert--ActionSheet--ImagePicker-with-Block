//
//  PCBlockedAlertView.m
//  testPopCornComponents
//
//  Created by Joon on 13. 5. 14..
//  Copyright (c) 2013년 Joon. All rights reserved.
//

#import "PCBlockedAlertView.h"


@interface PCBlockedAlertView () <UIAlertViewDelegate>
{
}

@end


@implementation PCBlockedAlertView


+ (void)alertView:(PCBlockedAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex
{
	if(buttonIndex == [alertView cancelButtonIndex])
	{
		if(alertView.cancelBlock)
			alertView.cancelBlock();
	}
	else
	{
		if(alertView.dismissBlock)
			alertView.dismissBlock(buttonIndex - 1);
	}
}

+ (void)alertViewCancel:(PCBlockedAlertView *)alertView
{
	if(alertView.cancelBlock)
		alertView.cancelBlock();
}

+ (id)showWithTitle:(NSString *)title
			message:(NSString *)message
  cancelButtonTitle:(NSString *)cancelButtonTitle
  otherButtonTitles:(NSArray *)otherButtonTitles
		  onDismiss:(PCBlockedAlertViewDismissBlock)dBlock
		   onCancel:(PCBlockedAlertViewCancelBlock)cBlock
{
	PCBlockedAlertView *alert = [[PCBlockedAlertView alloc] initWithTitle:title
                                                    message:message
                                                   delegate:[self class]
                                          cancelButtonTitle:cancelButtonTitle
                                          otherButtonTitles:nil];
	
	for(NSString *buttonTitle in otherButtonTitles)
        [alert addButtonWithTitle:buttonTitle];
	
	alert.dismissBlock = dBlock;
	alert.cancelBlock = cBlock;
	
	[alert show];
	
	return alert;
}

+ (id)showWithTitle:(NSString *)title
			message:(NSString *)message
  cancelButtonTitle:(NSString *)cancelButtonTitle
{
	PCBlockedAlertView *alert = [[PCBlockedAlertView alloc] initWithTitle:title
                                                    message:message
                                                   delegate:nil
                                          cancelButtonTitle:cancelButtonTitle
                                          otherButtonTitles:nil];
	
	[alert show];
	
	return alert;
}

@end

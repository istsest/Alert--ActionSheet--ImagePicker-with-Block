//
//  PCBlockedAlertView.h
//  testPopCornComponents
//
//  Created by Joon on 13. 5. 14..
//  Copyright (c) 2013년 Joon. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PCBlockedAlertView : UIAlertView

typedef void (^PCBlockedAlertViewDismissBlock)(NSInteger buttonIndex);
typedef void (^PCBlockedAlertViewCancelBlock)();

@property (nonatomic, copy)		PCBlockedAlertViewDismissBlock		dismissBlock;
@property (nonatomic, copy)		PCBlockedAlertViewCancelBlock		cancelBlock;


+ (id)showWithTitle:(NSString *)title
			message:(NSString *)message
  cancelButtonTitle:(NSString *)cancelButtonTitle
  otherButtonTitles:(NSArray *)otherButtonTitles
		  onDismiss:(PCBlockedAlertViewDismissBlock)dBlock
		   onCancel:(PCBlockedAlertViewCancelBlock)cBlock;

+ (id)showWithTitle:(NSString *)title
			message:(NSString *)message
  cancelButtonTitle:(NSString *)cancelButtonTitle;

@end

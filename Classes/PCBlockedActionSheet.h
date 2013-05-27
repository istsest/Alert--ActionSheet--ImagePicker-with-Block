//
//  PCBlockedActionSheet.h
//  testPopCornComponents
//
//  Created by Joon on 13. 5. 14..
//  Copyright (c) 2013년 Joon. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PCBlockedActionSheet : UIActionSheet

typedef void (^PCBlockedActionSheetDismissBlock)(NSInteger buttonIndex);
typedef void (^PCBlockedActionSheetCancelBlock)();

@property (nonatomic, copy)		PCBlockedActionSheetDismissBlock		dismissBlock;
@property (nonatomic, copy)		PCBlockedActionSheetCancelBlock		cancelBlock;


- (void)showInView:(UIView *)view
		 onDismiss:(PCBlockedActionSheetDismissBlock)dBlock
		  onCancel:(PCBlockedActionSheetCancelBlock)cBlock;

@end

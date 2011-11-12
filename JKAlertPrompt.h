//
//  JKAlertPrompt.h
//  JobStairs
//
//  Created by Jens Kohl on 17.12.09.
//  Copyright 2009 Jeff LaMarche. All rights reserved.
//	@see http://iphonedevelopment.blogspot.com/2009/02/alert-view-with-prompt.html
//

#import <Foundation/Foundation.h>


@interface JKAlertPrompt : UIAlertView {
	UITextField *textField;
}
@property (nonatomic, strong) UITextField *textField;
@property (weak, readonly) NSString *enteredText;

-(id)initWithTitle:(NSString *)title message:(NSString *)message delegate:(id)delegate 
 cancelButtonTitle:(NSString *)cancelButtonTitle okButtonTitle:(NSString *)okButtonTitle placeholderText:(NSString *)placeholderText;

@end

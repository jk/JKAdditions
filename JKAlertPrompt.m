//
//  JKAlertPrompt.m
//  JobStairs
//
//  Created by Jens Kohl on 17.12.09.
//  Copyright 2009 Jeff LaMarche. All rights reserved.
//	@see http://iphonedevelopment.blogspot.com/2009/02/alert-view-with-prompt.html
//

#import "JKAlertPrompt.h"


@implementation JKAlertPrompt
@synthesize textField;


-(id)initWithTitle:(NSString *)title message:(NSString *)message delegate:(id)delegate 
 cancelButtonTitle:(NSString *)cancelButtonTitle okButtonTitle:(NSString *)okButtonTitle {
	DLog(@"");
	if (self = [super initWithTitle:title message:message delegate:delegate cancelButtonTitle:cancelButtonTitle otherButtonTitles:okButtonTitle, nil]) {
		DLog(@"");
		UITextField *theTextField = [[UITextField alloc] initWithFrame:CGRectMake(12.0, 45.0, 260.0, 25.0)];
		[theTextField setBackgroundColor:[UIColor whiteColor]];
		[self addSubview:theTextField];
		self.textField = theTextField;
		[theTextField release];
		CGAffineTransform translate = CGAffineTransformMakeTranslation(0.0, 130.0);
		[self setTransform:translate];
	}
	return self;
}

-(void)show {
	[textField becomeFirstResponder];
	[super show];
}

-(NSString *)enteredText {
	return textField.text;
}

- (void) dealloc
{
	[textField release];
	[super dealloc];
}


@end

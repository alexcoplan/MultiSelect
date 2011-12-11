//
//  MultiSelectAppDelegate.h
//  MultiSelect
//
//  Created by Alex Coplan on 11/12/2011.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MultiSelectViewController;

@interface MultiSelectAppDelegate : NSObject <UIApplicationDelegate> {

}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet MultiSelectViewController *viewController;

@end

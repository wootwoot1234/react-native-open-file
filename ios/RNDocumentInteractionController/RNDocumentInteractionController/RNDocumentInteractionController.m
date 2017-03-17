//
//  RNDocumentInteractionController.m
//  RNDocumentInteractionController
//
//  Created by Aaron Greenwald on 7/5/16.
//  Copyright © 2016 Wix.com. All rights reserved.
//

#import "RNDocumentInteractionController.h"
#import <UIKit/UIKit.h>

@implementation RNDocumentInteractionController

RCT_EXPORT_MODULE();

RCT_EXPORT_METHOD(open: (NSURL *)path)
{
    UIDocumentInteractionController *interactionController = [UIDocumentInteractionController interactionControllerWithURL:path];
    interactionController.delegate = self;
    dispatch_sync(dispatch_get_main_queue(), ^{
        [interactionController presentPreviewAnimated:YES];
    });
    [[UIApplication sharedApplication] setStatusBarHidden:YES];
}

- (UIViewController *) documentInteractionControllerViewControllerForPreview: (UIDocumentInteractionController *) controller
{
    [[[[UIApplication sharedApplication] delegate] window] setWindowLevel:UIWindowLevelStatusBar];
    
    return [[[[UIApplication sharedApplication] delegate] window] rootViewController];
}

@end

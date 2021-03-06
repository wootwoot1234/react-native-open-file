//
//  RNDocumentInteractionController.m
//  RNDocumentInteractionController
//
//  Created by Aaron Greenwald on 7/5/16.
//  Copyright © 2016 Wix.com. All rights reserved.
//

#import "RNDocumentInteractionController.h"
#import <UIKit/UIKit.h>
#import <React/RCTConvert.h>

@implementation RNDocumentInteractionController

RCT_EXPORT_MODULE();

RCT_EXPORT_METHOD(open: (NSDictionary *)options) {
    NSURL *path = [RCTConvert NSURL:options[@"path"]];
    UIDocumentInteractionController *interactionController = [UIDocumentInteractionController interactionControllerWithURL:path];
    if (options[@"name"]){
        NSString *name = [RCTConvert NSString:options[@"name"]];
        interactionController.name = name;
    }
    interactionController.delegate = self;
    dispatch_sync(dispatch_get_main_queue(), ^{
        [interactionController presentPreviewAnimated:YES];
    });
}


- (UIViewController *) documentInteractionControllerViewControllerForPreview: (UIDocumentInteractionController *) controller
{
    return [[[[UIApplication sharedApplication] delegate] window] rootViewController];
}

static NSTimer* timer = nil;

- (void)documentInteractionControllerWillBeginPreview:(UIDocumentInteractionController *)controller
{
    timer = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(hideStatusBar) userInfo:nil repeats:YES];
}

-(void)hideStatusBar
{
    [[UIApplication sharedApplication] setStatusBarHidden:YES];
}

-(void)documentInteractionControllerDidEndPreview:(UIDocumentInteractionController *)controller
{
    [timer invalidate];
    [[UIApplication sharedApplication] setStatusBarHidden:YES];
}

@end

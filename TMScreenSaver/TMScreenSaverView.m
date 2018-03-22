//
//  TMScreenSaverView.m
//  TMScreenSaver
//
//  Created by 天明 on 2018/3/22.
//  Copyright © 2018年 天明. All rights reserved.
//

#import "TMScreenSaverView.h"
#import <WebKit/WebKit.h>

@implementation TMScreenSaverView

- (instancetype)initWithFrame:(NSRect)frame isPreview:(BOOL)isPreview
{
    self = [super initWithFrame:frame isPreview:isPreview];
    if (self) {
        NSURL* indexHTMLDocumentURL = [NSURL URLWithString:[[[NSURL fileURLWithPath:[[NSBundle bundleForClass:self.class].resourcePath stringByAppendingString:@"/index.html"] isDirectory:NO] description] stringByAppendingFormat:@"?screensaver=1%@", self.isPreview ? @"&is_preview=1" : @""]];
        WebView* webView = [[WebView alloc] initWithFrame:NSMakeRect(0, 0, frame.size.width, frame.size.height)];
        webView.drawsBackground = NO;
        [webView.mainFrame loadRequest:[NSURLRequest requestWithURL:indexHTMLDocumentURL]];
        [self addSubview:webView];
    }
    return self;
}

- (void)startAnimation
{
    [super startAnimation];
}

- (void)stopAnimation
{
    [super stopAnimation];
}

- (void)drawRect:(NSRect)rect
{
    [super drawRect:rect];

}

- (void)animateOneFrame
{
    [self stopAnimation];
}

- (BOOL)hasConfigureSheet
{
    return false;
}

- (NSWindow*)configureSheet
{
    return nil;
}


@end

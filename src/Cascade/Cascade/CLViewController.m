//
//  CLViewController.m
//  Cascade
//
//  Created by Emil Wojtaszek on 11-03-26.
//  Copyright 2011 CreativeLabs.pl. All rights reserved.
//

#import "CLViewController.h"
#import "CLCascadeNavigationController.h"

@implementation CLViewController

@synthesize cascadeNavigationController = _cascadeNavigationController;
@synthesize viewOnStackIndex = _viewOnStackIndex;


///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)dealloc
{
    [_cascadeNavigationController release], _cascadeNavigationController = nil;
    [_originShadow release], _originShadow = nil;    
    [super dealloc];
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.        
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
	return NO;
}

#pragma mark -
#pragma mark Class methods


///////////////////////////////////////////////////////////////////////////////////////////////////
- (void) setOuterLeftShadow:(UIColor*)shadowColor width:(CGFloat)width alpha:(CGFloat)alpha {
    CAGradientLayer* shadow = [[[CAGradientLayer alloc] init] autorelease];

    shadow.startPoint = CGPointMake(0, 0.5);
    shadow.endPoint = CGPointMake(1.0, 0.5);
    CGRect newShadowFrame = CGRectMake(0, 0, width, self.view.frame.size.height);
    
    shadow.frame = newShadowFrame;
    shadow.colors = [NSArray arrayWithObjects: 
                            (id)([[UIColor clearColor] colorWithAlphaComponent:0.0].CGColor), 
                            (id)([shadowColor colorWithAlphaComponent: alpha].CGColor), 
                            nil];
    
    [(CLSegmentedView*)self.view setShadow:shadow withWidth:width];
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (void) pushDetailViewController:(CLViewController *)viewController animated:(BOOL)animated {
    [self.cascadeNavigationController addViewController:viewController sender:self animated:animated];
}


#pragma mark CLViewControllerDelegate

///////////////////////////////////////////////////////////////////////////////////////////////////
- (void) pageDidAppear {
    /*
     * Called when page (view of this controller) will be unveiled by 
     * another page or will slide in CascadeView bounds
     */
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (void) pageDidDisappear {
    /*
     * Called when page (view of this controller) will be shadowed by 
     * another page or will slide out CascadeView bounds
     */
}

@end

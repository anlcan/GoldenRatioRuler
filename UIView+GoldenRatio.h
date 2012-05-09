//
//  UIView+UIView__GoldenRatio.h
//  KnowNow
//
//  Created by Anil Can Baykal on 5/9/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

/* 
 
 http://en.wikipedia.org/wiki/Fibonacci_sequence 
 http://en.wikipedia.org/wiki/Golden_ratio
 
 */

#define DEBUG_GR		1
#define GOLDEN_RATIO	1.6180 
#define GR_LINE_WIDTH	5
#define GR_LINE_COLOR	[UIColor whiteColor].CGColor
#define GR_VIEW_TAG 	123455

typedef enum  {
    topLeft,
    topRight,
    bottomLeft, 
    bottomRight
    
}SpiralOrigin ;

@interface GoldenRatio : UIView {
    
    BOOL _top; 
    BOOL _left; 
    
    BOOL reverse; 
    
}

@property(nonatomic, assign) BOOL reverse; 
-(void)setSpiralOrigin:(SpiralOrigin)origin; 

@end

//==============================================================================
@interface UIView (GoldenRatio)

-(void) addGoldenRatio;

@end

//
//  UIView+UIView__GoldenRatio.m
//  KnowNow
//
//  Created by Anil Can Baykal on 5/9/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "UIView+GoldenRatio.h"


@implementation GoldenRatio
@synthesize reverse; 

-(id)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame]; 
    
    if (self) {        
        
        self.backgroundColor = [UIColor clearColor]; 
        self.tag = GR_VIEW_TAG; 
        
        //_left = YES; 
        //_top = YES; 
    }
    
    return self; 
}


-(CGRect)goldenratio:(CGRect) r{
    
    CGRect result = r; 
    
    CGFloat h = r.size.height; 
    CGFloat w = r.size.width; 
    
    // could be simplier, this is much more clearer..
    if (h > w)  {
        CGFloat h_new = h / GOLDEN_RATIO;

        if (_top){
            
            result.origin.y = h_new;                         
        }
        
        _top = !_top; 
        result.size.height =  h - h_new;         
       
            
    } else {
        CGFloat w_new = w /GOLDEN_RATIO;
        
        if (_left){
            result.origin.x =  w_new; 
           
        }
        
        _left = !_left;        
        result.size.width = w - w_new; 
    }
    
    return result; 
}

-(void)setSpiralOrigin:(SpiralOrigin)origin{
    
    switch (origin) {
        case topLeft:
            _left = YES; 
            _top = YES; 
            break;
            
        case topRight:
            _left = NO; 
            _top = YES;   
            break;
            
        case bottomLeft:
            _left = NO; 
            _top = NO; 
            break;
            
        case bottomRight:
            _left = YES; 
            _top = NO;  
            break;
            
            
            
        default:
            break;
    }
}

-(void)drawRect:(CGRect)rect{
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    if (reverse){
        
        CGContextTranslateCTM(context, self.bounds.size.width, self.bounds.size.height);
        CGContextRotateCTM(context, M_PI);
    }
    
    CGContextBeginPath(context); 
    
    CGRect iter = self.bounds;     
    for (int i =0; i < 6; i++){
                
#if (DEBUG_GR == 3)
        UILabel * lbl = [[[UILabel alloc] initWithFrame:iter] autorelease]; 
        lbl.backgroundColor = [UIColor clearColor]; 
        lbl.text = [NSString stringWithFormat:@"%d" , i];
        lbl.textColor = [UIColor redColor];
        lbl.textAlignment = UITextAlignmentCenter;
        [self addSubview:lbl];
#endif

        CGContextAddRect(context, iter); 
        CGRect nextIter = [self goldenratio:iter];         

               
        iter = nextIter; 
        
    }
    
    
    CGContextSetStrokeColorWithColor(context, GR_LINE_COLOR);
    CGContextStrokePath(context);
}


@end

@implementation UIView (UIView__GoldenRatio)

-(void) addGoldenRatio{
    
    GoldenRatio * gr = [[[GoldenRatio alloc] initWithFrame:self.bounds] autorelease];
    [gr setSpiralOrigin:topRight]; 
    
    [self addSubview:gr];    
    [self bringSubviewToFront:gr]; 
}

-(void) addGoldenRatioForDepth:(int)i{
    
}

@end

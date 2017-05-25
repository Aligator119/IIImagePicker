//
//  UIImage+Resize.h
//  
//
//  Created by aligator on 5/25/17.
//
//

#import <Foundation/Foundation.h>

@interface UIImage (Resize)

-(UIImage*)resizedImageToSize:(CGSize)dstSize;
-(UIImage*)resizedImageToFitInSize:(CGSize)boundingSize scaleIfSmaller:(BOOL)scale;

@end

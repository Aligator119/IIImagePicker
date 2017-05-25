//
//  UIImage+fixOrientation.h
//  Daily Rate
//
//  Created by Bogdan Shcherbyna on 1/29/15.
//  Copyright (c) 2015 eKreative. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (fixOrientation)

- (UIImage *)fixOrientation;
- (UIImage *)cropToSize:(CGSize)newSize;

@end

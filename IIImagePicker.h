//
//  IIImagePicker.h
//  
//
//  Created by aligator on 5/25/17.
//
//

#import <UIKit/UIKit.h>

@interface IIImagePicker : NSObject

@property (nonatomic, copy) void (^onImagePicking)(UIImage *image);
@property (nonatomic, copy) void (^onImagePickerDismiss)();
@property (nonatomic, strong) UIViewController *parentVC;

@property (nonatomic, assign) UIImagePickerControllerSourceType sourceType;
@property (nonatomic, assign) BOOL allowEditing;

+ (SBImagePicker*)initWithParent:(UIViewController*)parent;
- (void)showImagePicker;
- (void)hideImagePicker;

@end

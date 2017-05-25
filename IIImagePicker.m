//
//  IIImagePicker.m
//  
//
//  Created by aligator on 5/25/17.
//
//

#import "IIImagePicker.h"
#import "UIImage+fixOrientation.h"
#import <Photos/Photos.h>
#import "UIImage+Resize.h"

@interface IIImagePicker () <UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@property (nonatomic) UIImagePickerController *imagePickerController;

@end

@implementation IIImagePicker

- (id)init
{
    if (self = [super init]) {
        self.imagePickerController = [[UIImagePickerController alloc] init];
        self.imagePickerController.modalPresentationStyle = UIModalPresentationCurrentContext;
        self.imagePickerController.delegate = self;
        self.allowEditing = false;
    }
    return self;
}

+ (IIImagePicker *)initWithParent:(UIViewController *)parent
{
    IIImagePicker *picker = [[IIImagePicker alloc] init];
    picker.parentVC = parent;
    return picker;
}

- (void)setSourceType:(UIImagePickerControllerSourceType)sourceType
{
    if(_sourceType != sourceType) {
        _sourceType = sourceType;
        self.imagePickerController.sourceType = sourceType;
    }
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    void (^imagePickingFinishing)(UIImage*) = ^(UIImage* image) {
        if (self.onImagePicking != nil) {
            self.onImagePicking(image);
        }
        
        [picker dismissViewControllerAnimated:YES completion:nil];
    };
    
    NSString * imageKey = self.allowEditing ? UIImagePickerControllerEditedImage : UIImagePickerControllerOriginalImage;
    
    UIImage *image = [(UIImage*)info[imageKey] fixOrientation];
    if (image != nil) {
        imagePickingFinishing(image);
    } else {
        NSURL *assetURL = info[UIImagePickerControllerReferenceURL];
        PHAsset *asset = [PHAsset fetchAssetsWithALAssetURLs:@[assetURL] options:[[PHFetchOptions alloc] init]].firstObject;
        PHImageManager *manager = [PHImageManager defaultManager];
        [manager requestImageForAsset:asset targetSize:[UIScreen mainScreen].bounds.size contentMode:PHImageContentModeDefault options:nil resultHandler:^(UIImage * _Nullable result, NSDictionary * _Nullable info) {
            imagePickingFinishing(result);
        }];
    }
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [picker dismissViewControllerAnimated:YES completion:nil];
    if (self.onImagePickerDismiss != nil) {
        self.onImagePickerDismiss();
    }
}

- (void)showImagePicker
{
    self.imagePickerController.allowsEditing = self.allowEditing;
    [self.parentVC presentViewController:self.imagePickerController animated:NO completion:nil];
}

- (void)hideImagePicker
{
    [self imagePickerControllerDidCancel:self.imagePickerController];
}

@end
